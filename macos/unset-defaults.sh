#!/usr/bin/env bash

echo 'start osx/unset-defaults.sh'

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
if [ -f "$HOME/.dotfiles/macos/ComputerName.bak" ]; then
	MyComputerName=$(cat $HOME/.dotfiles/macos/ComputerName.bak)
	echo "Restoring ComputerName to '$MyComputerName'" 
	sudo scutil --set ComputerName "$MyComputerName"
	rm -f $HOME/.dotfiles/macos/ComputerName.bak
fi

if [ -f "$HOME/.dotfiles/macos/HostName.bak" ]; then
	MyHostName=$(cat $HOME/.dotfiles/macos/HostName.bak)
  	echo "Restoring HostName to '$MyHostName'" 
	sudo scutil --set HostName "$MyHostName"
	rm -f $HOME/.dotfiles/macos/HostName.bak
fi

if [ -f "$HOME/.dotfiles/macos/LocalHostName.bak" ]; then
	MyLocalHostName=$(cat $HOME/.dotfiles/macos/LocalHostName.bak)
  	echo "Restoring LocalHostName to '$MyLocalHostName'"
  	sudo scutil --set LocalHostName "$MyLocalHostName"
	rm -f $HOME/.dotfiles/macos/LocalHostName.bak
fi

if [ -f "$HOME/.dotfiles/macos/NetBIOSName.bak" ]; then
	MyNetBIOSName=$(cat $HOME/.dotfiles/macos/NetBIOSName.bak)
	echo "Restoring NetBIOSName to '$MyNetBIOSName'"
	sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$MyNetBIOSName"
	rm -f $HOME/.dotfiles/macos/NetBIOSName.bak
fi

if [[ "$DISABLE_STARTUP_SOUND" == "true" ]]; then
	sudo nvram SystemAudioVolume=%80
fi

if [[ "$ENABLE_SMALL_SIDEBARICONS" == "true" ]]; then
	defaults delete NSGlobalDomain NSTableViewDefaultSizeMode
fi

if [[ "$ENABLE_INCREASED_RESIZE_SPEED" == "true" ]]; then
	defaults delete NSGlobalDomain NSWindowResizeTime
fi

if [[ "$ENABLE_EXPANDED_SAVEDIALOG" == "true" ]]; then
	defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode
	defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode2
fi

if [[ "$DISABLE_DEFAULT_SAVETO_ICLOUD" == "true" ]]; then
	defaults delete NSGlobalDomain NSDocumentSaveNewDocumentsToCloud
fi

if [[ "$ENABLE_EXPANDED_PRINTDIALOG" == "true" ]]; then
	defaults delete NSGlobalDomain PMPrintingExpandedStateForPrint
	defaults delete NSGlobalDomain PMPrintingExpandedStateForPrint2
fi

if [[ "$ENABLE_AUTOCLOSE_PRINTER" == "true" ]]; then
	defaults delete com.apple.print.PrintingPrefs "Quit When Finished"
fi

if [[ "$DISABLE_SMARTQUOTES" == "true" ]]; then
	defaults delete NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled
fi

if [[ "$DISABLE_SMARTDASHES" == "true" ]]; then
	defaults delete NSGlobalDomain NSAutomaticDashSubstitutionEnabled
fi

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

if [[ "$ENABLE_TAPTCLICK" == "true" ]]; then
	defaults delete com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking
	defaults delete NSGlobalDomain com.apple.mouse.tapBehavior
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 0
fi

if [[ "$ENABLE_FAST_KEYBOARD_REPEAT" == "true" ]]; then
	defaults delete NSGlobalDomain KeyRepeat
	defaults delete NSGlobalDomain InitialKeyRepeat
fi

if [[ "$DISABLE_AUTOCORRECT" == "true" ]]; then
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true
	defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool true
fi

###############################################################################
# Screen                                                                      #
###############################################################################

if [[ "$ENABLE_REQUIRE_PASSWORD_IMMEDIATELY" == "true" ]]; then
	defaults delete com.apple.screensaver askForPassword
	defaults delete com.apple.screensaver askForPasswordDelay
fi

if [[ "$ENABLE_CUSTOM_SCREENCAPTURE_LOCATION" == "true" ]]; then
	defaults delete com.apple.screencapture location
	defaults delete com.apple.screencapture location-last
fi

if [[ "$DISABLE_SCREENCAPTURE_SHADOW" == "true" ]]; then
	defaults delete com.apple.screencapture disable-shadow
fi

###############################################################################
# Finder                                                                      #
###############################################################################

if [[ "$ENABLE_FINDER_NEW_WINDOW_TARGET" == "true" ]]; then
	if [[ "$FINDER_NewWindowTarget" == "PfLo" ]]; then
		defaults delete com.apple.finder NewWindowTargetPath
	fi

	defaults delete com.apple.finder NewWindowTarget
fi

if [[ "$ENABLE_FINDER_MOUNT_DESKTOP_ICONS" == "true" ]]; then
	defaults delete com.apple.finder ShowHardDrivesOnDesktop
	defaults delete com.apple.finder ShowExternalHardDrivesOnDesktop
	defaults delete com.apple.finder ShowMountedServersOnDesktop
	defaults delete com.apple.finder ShowRemovableMediaOnDesktop
fi

if [[ "$ENABLE_FINDER_NEW_WINDOW_REMOVEABLE_MEDIA" == "true" ]]; then
	defaults delete com.apple.frameworks.diskimages auto-open-ro-root
	defaults delete com.apple.frameworks.diskimages auto-open-rw-root
	defaults delete com.apple.finder OpenWindowForNewRemovableDisk
fi

if [[ "$ENABLE_FINDER_SHOW_PATHBAR" == "true" ]]; then
	defaults delete com.apple.finder ShowPathbar
fi

if [[ "$ENABLE_FINDER_SHOW_PATH_IN_TITLE" == "true" ]]; then
	defaults delete com.apple.finder _FXShowPosixPathInTitle
fi

if [[ "$ENABLE_FINDER_SHOW_ALL_EXTENSIONS" == "true" ]]; then
	defaults delete NSGlobalDomain AppleShowAllExtensions
fi

if [[ "$DISABLE_FINDER_WARNING_EXTENSION_CHANGE" == "true" ]]; then
	defaults delete com.apple.finder FXEnableExtensionChangeWarning
fi

if [[ "$ENABLE_FINDER_QL_PANE" == "true" ]]; then
	defaults delete com.apple.finder ShowPreviewPane
	defaults delete com.apple.finder QLEnableTextSelection
fi

if [[ "$ENABLE_FINDER_SEARCH_SCOPE" == "true" ]]; then
	defaults delete com.apple.finder FXDefaultSearchScope
fi

if [[ "$DISABLE_DS_Store_ON_MOUNTS" == "true" ]]; then
	defaults delete com.apple.desktopservices DSDontWriteNetworkStores
	defaults delete com.apple.desktopservices DSDontWriteUSBStores
fi

if [[ "$DISABLE_DISK_IMAGE_VERIFICATION" == "true" ]]; then
	defaults delete com.apple.frameworks.diskimages skip-verify
	defaults delete com.apple.frameworks.diskimages skip-verify-locked
	defaults delete com.apple.frameworks.diskimages skip-verify-remote
fi

if [[ "$ENABLE_FINDER_VIEW_STYLE" == "true" ]]; then
	defaults delete com.apple.finder FXPreferredViewStyle
fi

if [[ "$ENABLE_FINDER_LIBRARY_FOLDER" == "true" ]]; then
	chflags hidden ~/Library
fi

if [[ "$ENABLE_FINDER_USERS_FOLDER" == "true" ]]; then
	chflags hidden /Users
fi

if [[ "$ENABLE_FINDER_EXPAND_INFO_PANE" == "true" ]]; then
	defaults delete com.apple.finder FXInfoPanesExpanded
fi

if [[ "$DISABLE_ASK_FOR_TIMEMACHINE" == "true" ]]; then
	defaults delete com.apple.TimeMachine DoNotOfferNewDisksForBackup
fi

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Prevent applications from bouncing in Dock
defaults delete com.apple.dock no-bouncing

# Set the icon size of Dock items to 32 pixels
defaults delete com.apple.dock tilesize

# Set the icon hover-size of Dock items to 48 pixels
defaults delete com.apple.dock largesize

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults delete com.apple.dock persistent-apps

# Disable Dashboard
defaults delete com.apple.dashboard mcx-disabled

# Don’t show Dashboard as a Space
defaults delete com.apple.dock dashboard-in-overlay

# Don’t automatically rearrange Spaces based on most recent use
defaults delete com.apple.dock mru-spaces

# Make Dock icons of hidden applications translucent
defaults delete com.apple.dock showhidden

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults delete com.apple.ActivityMonitor OpenMainWindow

# Visualize CPU usage in the Activity Monitor Dock icon
defaults delete com.apple.ActivityMonitor IconType

# Show all processes in Activity Monitor
defaults delete com.apple.ActivityMonitor ShowCategory

# Sort Activity Monitor results by CPU usage
defaults delete com.apple.ActivityMonitor SortColumn 
defaults delete com.apple.ActivityMonitor SortDirection

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Use plain text mode for new TextEdit documents
defaults delete com.apple.TextEdit RichText

# Open and save files as UTF-8 in TextEdit
defaults delete com.apple.TextEdit PlainTextEncoding
defaults delete com.apple.TextEdit PlainTextEncodingForWrite

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Disable Safari’s thumbnail cache for History and Top Sites
defaults delete com.apple.Safari DebugSnapshotsUpdatePolicy

# Enable Safari’s debug menu
defaults delete com.apple.Safari IncludeInternalDebugMenu

# Show Safari’s bookmarks bar by default
defaults delete com.apple.Safari ShowFavoritesBar

# Enable the Develop menu and the Web Inspector in Safari
defaults delete com.apple.Safari IncludeDevelopMenu
defaults delete com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey
defaults delete com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled

# Enable “Do Not Track”
defaults delete com.apple.Safari SendDoNotTrackHTTPHeader

# Update extensions automatically
defaults delete com.apple.Safari InstallExtensionUpdatesAutomatically

###############################################################################
# Spotlight                                                                   #
###############################################################################

# Disable Spotlight indexing for external volumes
sudo defaults delete /Library/Preferences/com.apple.SpotlightServer.plist ExternalVolumesIgnore

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Mail" "Messages" "Safari" "SizeUp" "SystemUIServer" \
	"Terminal" "Transmission" "Twitter" "iCal"; do
	killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
