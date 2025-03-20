#!/usr/bin/env bash

TXT_GRAY="\e[90m"
TXT_LIGHT_GRAY="\e[37m"
TXT_RED="\e[91m"
TXT_GREEN="\e[92m"
TXT_YELLOW="\e[93m"
TXT_BLUE="\e[94m"
TXT_PURPLE="\e[95m"
TXT_CYAN="\e[36m"
TXT_WHITE="\e[97m"
TXT_CLEAR="\e[0m"

logIndentCount=0
logTaskNames=""

# Determine using printf over echo
cout() {
  if hash printf 2>/dev/null; then
    printf "%b" "$*"
  else
    # shellcheck disable=SC2039
    echo -n -e "$@"
  fi
}

get_current_time() {
  # date is different on macos and linux
  date_format="$(date +%s)"

  # shellcheck disable=SC2039
  if [ $IS_GNUDATE = true ]; then
    # Fix for timezone Europe/Berlin and alpine images
    time=$(date -d @$date_format +%T)
  else
    time=$(date -r $date_format +%T)
  fi

  cout "$time"
}

get_spinner() {
  local start="⠀"
  local end="⠿"
  local spinner=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")

  case $1 in
      start) echo $start                     ;;
      end)   echo $end                       ;;
      *)     echo ${spinner[$((($1 % 10)))]} ;;
  esac
}

get_progressbar() {
  # llocal sep="▕"
  # local rsep="▏"
  # local fill="░"
  # local bar="█"
  local lsep="["
  local rsep="]"
  local fill=" "
  local bar="="

  local value=$1
  local max=$2

  if [ $value -lt 0 ]; then
      value=0
  fi

  if [ $value -gt $max ]; then
      value=$max
  fi

  let _progress=(${value}*100/${max}*100)/100
  let _done=(${_progress}*4)/10
  let _left=40-$_done
  # Build progressbar string lengths
  _done=$(printf "%${_done}s")
  _left=$(printf "%${_left}s")

  # 1.2 Build progressbar strings and print the ProgressBar line
  # 1.2.1 Output example:
  # 1.2.1.1 Progress : ▕████████████████████░░░░░░░░░░░░░░░░░░░░▏ 50%
  # echo "$lsep${_done// /$bar}${_left// /$fill}$rsep ${_progress}%%"
  echo "$lsep${_done// /$bar}>${_left// /$fill}$rsep ${_progress}%%"
}

# $1 Text to log
log() {
  cout "${TXT_GRAY}$(get_current_time)${TXT_CLEAR} $1\n"
}

# $1 Text to log
log_info() {
  log "${TXT_BLUE}$(get_log_indents)ℹ ${TXT_WHITE}${1}${TXT_CLEAR}"
}

# $1 Text to log
log_success() {
  log "${TXT_GREEN}$(get_log_indents)✔ ${1}${TXT_CLEAR}"
}

# $1 Text to log
log_warn() {
  log "${TXT_YELLOW}$(get_log_indents)⚠ ${1}${TXT_CLEAR}"
}

# $1 Text to log
log_error() {
  log "${TXT_RED}$(get_log_indents)✘ ${1}${TXT_CLEAR}"
}

log_question() {
  cout "${TXT_BLUE}？${1}${TXT_CLEAR}" >&2
  read -r ANSWER
  printf "%s" "$ANSWER"
}

# Pushes a task name to the stack
push_task_name() {
  logTaskNames="$logTaskNames $(printf "%s" "$@" | base64)"
}

# Reads last task name from stack
peek_task_name() {
  printf "%s" "${logTaskNames##* }" | base64 -d
}

# Removes last task name from stack
pop_task_name() {
  logTaskNames="${logTaskNames% *}"
}

# $@ Text to log
log_task() {
  push_task_name "$@"
  log "${TXT_PURPLE}$(get_log_indents)⚙ ${TXT_GRAY}$(peek_task_name)${TXT_CLEAR}"
  log_indent_increase
}

# $@ Fail Text
log_task_fail() {
  log_indent_decrease
  log "${TXT_PURPLE}$(get_log_indents)${TXT_RED}✘ ${TXT_GRAY}$(peek_task_name)${TXT_RED} $*${TXT_CLEAR}"
  pop_task_name
  # exits when run in pipeline, be aware to abort your script on your own on local usage, e.g. "return"
  if [[ "${CI}" ]]; then
    exit 1
  fi
}

# $@ Success Text
# shellcheck disable=SC2120
log_task_success() {
  log_indent_decrease
  log "${TXT_PURPLE}$(get_log_indents)${TXT_GREEN}✔ ${TXT_GRAY}$(peek_task_name)${TXT_GREEN} $*${TXT_CLEAR}"
  pop_task_name
}

# $@ Arguments are the array to log
log_list() {
  list=""
  separator=""
  for item in "$@"; do
    list="${list}${separator}${item}"
    separator=", "
  done

  log "${TXT_GRAY}$(get_log_indents)≡ [${list}]${TXT_CLEAR}"
}

# $@ Arguments are the array to log
log_list_newline() {
  items=( "$@" )
  total_items=${#items[@]}
  columns=3
  rows=$(( (total_items + columns) / columns ))

  for (( i=0; i<rows; i++ )); do
    for (( j=0; j<columns; j++ )); do
      index=$(( i + j * rows ))

      if [ $index -lt $total_items ]; then
        printf "%2d: %-25s" $index ${items[$index+1]}
      fi
    done
    echo
  done
}

log_progress() {
  local i=1
  local line=0

  printf "${TXT_GRAY}$(get_current_time)${TXT_CLEAR} ${TXT_YELLOW}$(get_log_indents)$(get_spinner 'start')${TXT_CLEAR} $(get_progressbar 0 100)${TXT_CLEAR}\r"

  while true; do
    if ! [ -t 0 ] && read -t 0.01 -r new_line; then
      if ! [[ $new_line =~ ^-?[0-9]+$ ]]; then
        continue
      fi
      line="$new_line"
    fi

    printf "${TXT_GRAY}$(get_current_time)${TXT_CLEAR} ${TXT_YELLOW}$(get_log_indents)$(get_spinner $i)${TXT_CLEAR} $(get_progressbar $line 100)${TXT_CLEAR}\r"

    if [[ "$line" == "100" ]]; then
      break
    fi

    sleep 0.033333
    i=$((i+1)) 
  done

  printf "${TXT_GRAY}$(get_current_time)${TXT_CLEAR} ${TXT_YELLOW}$(get_log_indents)$(get_spinner 'end')${TXT_CLEAR} $(get_progressbar 100 100)${TXT_CLEAR}\r\n";
}

# $1 The link to log
log_link() {
  log "${TXT_CYAN}$(get_log_indents)↗ ${TXT_WHITE}${1}${TXT_CLEAR}\n"
}

# $1 Sub path to documentation
log_documentation_links() {
  log_link "Documentation: https://documentation...${1}.html"
  log_link "Source Code:   https://github.com/etenzy/.dotfiles/blob/main/${1}"
}

# $1 Time in seconds
log_timer() {
  start_time=$(date +%s)
  end_time=$((start_time + $1))

  log_task "Waiting for $1 seconds... "

  while [[ end_time -gt $(date +%s) ]]; do
    log_info "waiting..."
    sleep 1
  done

  log_task_success
}

log_indent_reset() {
  logIndentCount=0
}

log_indent_increase() {
  logIndentCount=$((logIndentCount + 1))
}

log_indent_decrease() {
  if [[ $logIndentCount -gt 0 ]]; then
    logIndentCount=$((logIndentCount - 1))
  fi
}

get_log_indents() {
  indents=""

  count=0
  while [ $count -lt $logIndentCount ]; do
    indents="$indents  "
    count=$((count + 1))
  done

  printf "%s" "$indents"
}
