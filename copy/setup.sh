#!/bin/bash
#
# Set up OSX preferences
#
# Blatenly copied from: https://gist.github.com/tylerwalts/9375263
###########################################
# CONFIG

HOSTNAME="machiavellia"
TIMEZONE="America/Boston" # 'systemsetup -listtimezones'

###########################################
# MAIN

echo "This script will set properties on OSX"

echo " Ask for the administrator password for the duration of this script"
sudo -v

echo " Keep-alive: update existing sudo time stamp until .osx has finished"
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo " Set computer name to $HOSTNAME (as done via System Preferences → Sharing)"
sudo scutil --set ComputerName $HOSTNAME
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME

echo " Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

echo " Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo " Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo " Automatically illuminate built-in MacBook keyboard in low light"
defaults write com.apple.BezelServices kDim -bool true

echo " Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

echo " Show IP address, hostname, OS version when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo " Never go into computer sleep mode"
systemsetup -setcomputersleep Off > /dev/null

echo " Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo " Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo " Trackpad: map bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

echo " Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo " Enable full keyboard access for all controls"
echo " (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo " Set the timezone to $TIMEZONE"
systemsetup -settimezone $TIMEZONE > /dev/null

echo " Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo " Finder: show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo " Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo " Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo " Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo " Enable snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo " Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: icnv, clmv, Flwv"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
echo " Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo " Empty Trash securely by default"
defaults write com.apple.finder EmptyTrashSecurely -bool true

echo " Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo " Hot corners"
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# Top left screen corner → Mission Control
#defaults write com.apple.dock wvous-tl-corner -int 2
#defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
#defaults write com.apple.dock wvous-tr-corner -int 4
#defaults write com.apple.dock wvous-tr-modifier -int 0
echo " Bottom right screen corner → Start screen saver"
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

echo " Enable SSH "
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist

###########################################
echo "Done.  Restart computer to see all changes"
