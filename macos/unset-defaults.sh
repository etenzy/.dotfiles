
#!/usr/bin/env bash
echo 'start osx/unset-defaults.sh'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
sudo defaults delete /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName

# Set sidebar icon size to small
defaults delete NSGlobalDomain NSTableViewDefaultSizeMode

# Increase window resize speed for Cocoa applications
defaults delete NSGlobalDomain NSWindowResizeTime

# Expand save panel by default
defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode
defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode2

# Expand print panel by default
defaults delete NSGlobalDomain PMPrintingExpandedStateForPrint
defaults delete NSGlobalDomain PMPrintingExpandedStateForPrint2

# Save to disk (not to iCloud) by default
defaults delete NSGlobalDomain NSDocumentSaveNewDocumentsToCloud

# Automatically quit printer app once the print jobs complete
defaults delete com.apple.print.PrintingPrefs "Quit When Finished"

# Disable the “Are you sure you want to open this application?” dialog
defaults delete com.apple.LaunchServices LSQuarantine

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults delete /Library/Preferences/com.apple.loginwindow

# Disable smart quotes as they’re annoying when typing code
defaults delete NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled

# Disable smart dashes as they’re annoying when typing code
defaults delete NSGlobalDomain NSAutomaticDashSubstitutionEnabled

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults delete com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking
defaults delete NSGlobalDomain com.apple.mouse.tapBehavior

# Disable “natural” (Lion-style) scrolling
defaults delete NSGlobalDomain com.apple.swipescrolldirection

# Set a fast keyboard repeat rate
defaults delete NSGlobalDomain KeyRepeat
defaults delete NSGlobalDomain InitialKeyRepeat

# Disable auto-correct
defaults delete NSGlobalDomain NSAutomaticSpellingCorrectionEnabled

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults delete com.apple.screensaver askForPassword
defaults delete com.apple.screensaver askForPasswordDelay

# Save screenshots to custom folder
defaults delete com.apple.screencapture location

# Disable screenshot shadows
defaults delete com.apple.screencapture disable-shadow

###############################################################################
# Finder                                                                      #
###############################################################################

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults delete com.apple.finder NewWindowTarget
defaults delete com.apple.finder NewWindowTargetPath

# Show icons for hard drives, servers, and removable media on the desktop
defaults delete com.apple.finder ShowExternalHardDrivesOnDesktop
defaults delete com.apple.finder ShowHardDrivesOnDesktop
defaults delete com.apple.finder ShowMountedServersOnDesktop
defaults delete com.apple.finder ShowRemovableMediaOnDesktop

# Automatically open a new Finder window when a volume is mounted
defaults delete com.apple.frameworks.diskimages auto-open-ro-root
defaults delete com.apple.frameworks.diskimages auto-open-rw-root
defaults delete com.apple.finder OpenWindowForNewRemovableDisk

# Finder: show all filename extensions
#defaults delete NSGlobalDomain AppleShowAllExtensions

# Finder: allow text selection in Quick Look
defaults delete com.apple.finder QLEnableTextSelectio

# Display full POSIX path as Finder window title
defaults delete com.apple.finder _FXShowPosixPathInTitle

# When performing a search, search the current folder by default
defaults delete com.apple.finder FXDefaultSearchScope

# Disable the warning when changing a file extension
defaults delete com.apple.finder FXEnableExtensionChangeWarning

# Avoid creating .DS_Store files on network volumes
defaults delete com.apple.desktopservices DSDontWriteNetworkStores
defaults delete com.apple.desktopservices DSDontWriteUSBStores

# Disable disk image verification
defaults delete com.apple.frameworks.diskimages skip-verify
defaults delete com.apple.frameworks.diskimages skip-verify-locked
defaults delete com.apple.frameworks.diskimages skip-verify-remote

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults delete com.apple.finder FXPreferredViewStyle

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the ~/Users folder
chflags nohidden /Users

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults delete com.apple.finder FXInfoPanesExpanded

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults delete com.apple.TimeMachine DoNotOfferNewDisksForBackup

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
