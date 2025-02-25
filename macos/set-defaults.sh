#!/usr/bin/env bash

echo 'start macos/set-#defaults.sh'

if [ -f "$HOME/.dotfiles/macos/CONFIG" ]; then
	source $HOME/.dotfiles/macos/CONFIG
else
    echo "No CONFIG supplied..."
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
if [ -n "$MyComputerName" ]; then
	scutil --get ComputerName > $HOME/.dotfiles/macos/ComputerName.bak
	echo "Setting ComputerName to '$MyComputerName'" 
	sudo scutil --set ComputerName "$MyComputerName"
fi

if [ -n "$MyHostName" ]; then
	scutil --get HostName > $HOME/.dotfiles/macos/HostName.bak
	echo "Setting HostName to '$MyHostName'" 
	sudo scutil --set HostName "$MyHostName"
fi

if [ -n "$MyLocalHostName" ]; then
	scutil --get LocalHostName > $HOME/.dotfiles/macos/LocalHostName.bak
	echo "Setting LocalHostName to '$MyLocalHostName'"
	sudo scutil --set LocalHostName "$MyLocalHostName"
fi

if [ -n "$MyNetBIOSName" ]; then
	defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName > $HOME/.dotfiles/macos/NetBIOSName.bak
	echo "Setting NetBIOSName to '$MyNetBIOSName'"
	sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$MyNetBIOSName"
fi

if [[ "$DISABLE_STARTUP_SOUND" == "true" ]]; then
	sudo nvram -d SystemAudioVolume
fi

if [[ "$ENABLE_SMALL_SIDEBARICONS" == "true" ]]; then
	defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
fi

if [[ "$ENABLE_INCREASED_RESIZE_SPEED" == "true" ]]; then
	defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
fi

if [[ "$ENABLE_EXPANDED_SAVEDIALOG" == "true" ]]; then
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
fi

if [[ "$DISABLE_DEFAULT_SAVETO_ICLOUD" == "true" ]]; then
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
fi

if [[ "$ENABLE_EXPANDED_PRINTDIALOG" == "true" ]]; then
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
fi

if [[ "$ENABLE_AUTOCLOSE_PRINTER" == "true" ]]; then
	defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
fi

if [[ "$DISABLE_SMARTQUOTES" == "true" ]]; then
	defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
fi

if [[ "$DISABLE_SMARTDASHES" == "true" ]]; then
	defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
fi

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

if [[ "$ENABLE_TAPTCLICK" == "true" ]]; then
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
fi

if [[ "$ENABLE_FAST_KEYBOARD_REPEAT" == "true" ]]; then
	defaults write NSGlobalDomain KeyRepeat -int 2
	defaults write NSGlobalDomain InitialKeyRepeat -int 25
fi

if [[ "$DISABLE_AUTOCORRECT" == "true" ]]; then
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
	defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false
fi

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
if [[ "$ENABLE_REQUIRE_PASSWORD_IMMEDIATELY" == "true" ]]; then
	defaults write com.apple.screensaver askForPassword -int 1
	defaults write com.apple.screensaver askForPasswordDelay -int 0
fi

if [[ "$ENABLE_CUSTOM_SCREENCAPTURE_LOCATION" == "true" ]]; then
	mkdir -p $CUSTOM_SCREENCAPTURE_LOCATION
	defaults write com.apple.screencapture location -string "$CUSTOM_SCREENCAPTURE_LOCATION"
	defaults write com.apple.screencapture location-last -string "$CUSTOM_SCREENCAPTURE_LOCATION"
fi

if [[ "$DISABLE_SCREENCAPTURE_SHADOW" == "true" ]]; then
	defaults write com.apple.screencapture disable-shadow -bool true
fi


###############################################################################
# Finder                                                                      #
###############################################################################

if [[ "$ENABLE_FINDER_NEW_WINDOW_TARGET" == "true" ]]; then
	defaults write com.apple.finder NewWindowTarget -string "$FINDER_NewWindowTarget"

	if [[ "$FINDER_NewWindowTarget" == "PfLo" ]]; then
		defaults write com.apple.finder NewWindowTargetPath -string "file://${FINDER_NewWindowTargetPath}/"
	fi
fi

if [[ "$ENABLE_FINDER_MOUNT_DESKTOP_ICONS" == "true" ]]; then
	defaults write com.apple.finder ShowHardDrivesOnDesktop -bool $FINDER_ShowHardDrivesOnDesktop
	defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool $FINDER_ShowExternalHardDrivesOnDesktop
	defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool $FINDER_ShowRemovableMediaOnDesktop
	defaults write com.apple.finder ShowMountedServersOnDesktop -bool $FINDER_ShowMountedServersOnDesktop
fi

if [[ "$ENABLE_FINDER_NEW_WINDOW_REMOVEABLE_MEDIA" == "true" ]]; then
	defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
	defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
	defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
fi

if [[ "$ENABLE_FINDER_SHOW_PATHBAR" == "true" ]]; then
	defaults write com.apple.finder ShowPathbar -bool true
fi

if [[ "$ENABLE_FINDER_SHOW_PATH_IN_TITLE" == "true" ]]; then
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
fi

if [[ "$ENABLE_FINDER_SHOW_ALL_EXTENSIONS" == "true" ]]; then
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true
fi

if [[ "$DISABLE_FINDER_WARNING_EXTENSION_CHANGE" == "true" ]]; then
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
fi

if [[ "$ENABLE_FINDER_QL_PANE" == "true" ]]; then
	defaults write com.apple.finder ShowPreviewPane -bool true
	defaults write com.apple.finder QLEnableTextSelection -bool true
fi

if [[ "$ENABLE_FINDER_SEARCH_SCOPE" == "true" ]]; then
	defaults write com.apple.finder FXDefaultSearchScope -string "$FINDER_FXDefaultSearchScope"
fi

if [[ "$DISABLE_DS_Store_ON_MOUNTS" == "true" ]]; then
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
fi

if [[ "$DISABLE_DISK_IMAGE_VERIFICATION" == "true" ]]; then
	defaults write com.apple.frameworks.diskimages skip-verify -bool true
	defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
	defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
fi

if [[ "$ENABLE_FINDER_VIEW_STYLE" == "true" ]]; then
	defaults write com.apple.finder FXPreferredViewStyle -string "$FINDER_FXPreferredViewStyle"
fi

if [[ "$ENABLE_FINDER_LIBRARY_FOLDER" == "true" ]]; then
	chflags nohidden ~/Library
fi

if [[ "$ENABLE_FINDER_USER_FOLDER" == "true" ]]; then
	chflags nohidden /Users
fi

if [[ "$ENABLE_FINDER_EXPAND_INFO_PANE" == "true" ]]; then
	defaults write com.apple.finder FXInfoPanesExpanded -dict \
		General -bool true \
		OpenWith -bool true \
		Privileges -bool true
fi

if [[ "$DISABLE_ASK_FOR_TIMEMACHINE" == "true" ]]; then
	defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
fi

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

if [[ "$ENABLE_DOCK_NO_BOUNCING" == "true" ]]; then
	defaults write com.apple.dock no-bouncing -bool true
fi

if [[ "$ENABLE_DOCK_TILESIZE" == "true" ]]; then
	defaults write com.apple.dock tilesize -int $DOCK_tilesize
fi

if [[ "$ENABLE_DOCK_LARGESIZE" == "true" ]]; then
	defaults write com.apple.dock largesize -int $DOCK_largesize
fi

if [[ "$ENABLE_DOCK_MAGNIFICATION" == "true" ]]; then
	defaults write com.apple.dock magnification -bool true
fi

if [[ "$ENABLE_DOCK_WIPE" == "true" ]]; then
	defaults write com.apple.dock persistent-apps -array '{}'
fi

if [[ "$ENABLE_DOCK_HIDE_RECENTS" == "true" ]]; then
	defaults write com.apple.dock show-recents -bool false
fi

if [[ "$DISABLE_DOCK_REARRANGE_SPACES" == "true" ]]; then
	defaults write com.apple.dock mru-spaces -bool false
fi

if [[ "$ENABLE_DOCK_HIDDEN_TRANSLUCENT" == "true" ]]; then
	defaults write com.apple.dock showhidden -bool true
fi

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor

if [[ "$ENABLE_ACTIVITY_MONITOR_OPENMAINWINDOW" == "true" ]]; then
	defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
fi

if [[ "$ENABLE_ACTIVITY_MONITOR_DOCKICON_CPU" == "true" ]]; then
	defaults write com.apple.ActivityMonitor IconType -int 5
fi

if [[ "$ENABLE_ACTIVITY_MONITOR_ALLPROCESSES" == "true" ]]; then
	defaults write com.apple.ActivityMonitor ShowCategory -int 0
fi

if [[ "$ENABLE_ACTIVITY_MONITOR_SORTING" == "true" ]]; then
	defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
	defaults write com.apple.ActivityMonitor SortDirection -int 0
fi

###############################################################################
# TextEdit                                                                    #
###############################################################################

if [[ "$ENABLE_TEXTEDIT_PLAINTEXT" == "true" ]]; then
	defaults write com.apple.TextEdit RichText -int 0
fi

if [[ "$ENABLE_TEXTEDIT_PLAINTEXT_ENCODING" == "true" ]]; then
	defaults write com.apple.TextEdit PlainTextEncoding -int 4
	defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
fi

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

if [[ "$ENABLE_SAFARI_FULL_URL" == "true" ]]; then
	defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
fi

if [[ "$ENABLE_SAFARI_FAVORITES_BAR" == "true" ]]; then
	defaults write com.apple.Safari ShowFavoritesBar -bool true
fi

if [[ "$ENABLE_SAFARI_DEBUG_MENU" == "true" ]]; then
	defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
fi

if [[ "$ENABLE_SAFARI_DEVELOPER_MENU" == "true" ]]; then
	defaults write com.apple.Safari IncludeDevelopMenu -bool true
	defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
fi

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in  \
	"Dock" "Finder" "System Settings" "SizeUp" "SystemUIServer" "cfprefsd"  \
	"Activity Monitor" "Terminal" "Safari" "TextEdit"; do
	killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
