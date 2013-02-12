#!/bin/bash -x
# This shell script was created at solowizard.com
#

#
# http://github.com/tommyh/solo_wizard
# (c) 2012, Tom Hallett
# This script may be freely distributed under the MIT license.

pushd `pwd`
if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi



mkdir -p ~/cookbooks; cd ~/cookbooks
cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::rvm
- pivotal_workstation::ack
- pivotal_workstation::1password
- pivotal_workstation::alfred
- pivotal_workstation::chrome
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::defaults_fast_key_repeat_rate
- pivotal_workstation::disable_front_row
- pivotal_workstation::dropbox
- pivotal_workstation::enable_assistive_devices
- pivotal_workstation::evernote
- pivotal_workstation::finder_display_full_path
- pivotal_workstation::firefox
- pivotal_workstation::function_keys
- pivotal_workstation::git
- pivotal_workstation::github_for_mac
- pivotal_workstation::gitx
- pivotal_workstation::git_config_global_defaults
- pivotal_workstation::global_environment_variables
- pivotal_workstation::homebrew
- pivotal_workstation::increase_shared_memory
- pivotal_workstation::keyboard_preferences
- pivotal_workstation::menumeters
- pivotal_workstation::mouse_locator
- pivotal_workstation::oh_my_zsh
- pivotal_workstation::osx_updates
- pivotal_workstation::propane
- pivotal_workstation::remove_garageband
- pivotal_workstation::safari_preferences
- pivotal_workstation::set_finder_show_user_home_in_sidebar
- pivotal_workstation::sizeup
- pivotal_workstation::skype
- pivotal_workstation::sublime_text
- pivotal_workstation::terminal_preferences
- pivotal_workstation::timemachine_preferences
- pivotal_workstation::unix_essentials
- pivotal_workstation::user_owns_usr_local
- pivotal_workstation::vagrant
- pivotal_workstation::vim
- pivotal_workstation::virtualbox
- pivotal_workstation::workspace_directory
- pivotal_workstation::zsh
- pivotal_workstation::bartender
- pivotal_workstation::grid
- pivotal_workstation::omnigraffle
- pivotal_workstation::pwgen
- pivotal_workstation::terminal_preferences
- pivotal_workstation::vlc
- frank_workstation::autojump
- frank_workstation::whois
- frank_workstation::openoffice
- frank_workstation::handbrake
- frank_workstation::libdvdcss
- frank_workstation::mosh
- frank_workstation::beid
- frank_workstation::trimenabler
- frank_workstation::hostname
- frank_workstation::sourcecodeprofonts

EOF
if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
fi
if [[ -d frank_workstation ]]; then
  cd frank_workstation && git pull && cd ..
else
  git clone https://github.com/franklouwers/frank_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
soloist
popd
