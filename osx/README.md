# OSX Scaffold

- [Application list](#application-list)
  - [Base](#base)
  - [Work](#work)
- [Step-by-step Installation](#step-by-step-installation)



## Application list

### Base

- iTerm2 https://www.iterm2.com/

  Terminal emulator.

- Homebrew https://brew.sh/

  - tap

    - cask

  - app

     - zsh
     - wget
     - tree
     - thefuck https://github.com/nvbn/thefuck

  - font

     - font-firacode-nerd-font

        `brew cask install caskroom/fonts/font-firacode-nerd-font`

- oh-my-zsh https://github.com/robbyrussell/oh-my-zsh

   Oh My Zsh is an open source, community-driven framework for managing your [zsh](http://www.zsh.org/) configuration.

- Typora https://typora.io/

  The markdown editor.

- Yoink https://eternalstorms.at/yoink/

  Simplify and Improve Drag and Drop.

- iStat Menus https://bjango.com/mac/istatmenus/

  An advanced system monitor for menubar.

- Magnet http://magnet.crowdcafe.com/

  Window manager.

- Keka http://www.kekaosx.com/en/

   Free file archiver.

- Timing https://timingapp.com/

### Work

- Dash https://kapeli.com/dash

  Dash is an API Documentation Browser and Code Snippet Manager.

- GitKraken https://www.gitkraken.com/

- Beyond Compare https://www.scootersoftware.com/

- Visual Studio Code https://code.visualstudio.com/

- PhpStorm https://www.jetbrains.com/phpstorm/

- Docker https://www.docker.com/



## Step-by-step Installation

1. Install [Homebrew](https://brew.sh/)

   ```bash
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   ```

   1. Install wget

      ```bash
      brew install wget
      ```

   2. Install tree

      ```bash
      brew install tree
      ```
      
   3. Install [thefuck](https://github.com/nvbn/thefuck)

      ```bash
      brew install thefuck
      ```

   4. Install zsh

      ```bash
      brew install zsh
      ```

      change the default shell to zsh

      ```bash
      sudo sh -c "echo $(which zsh) >> /etc/shells"
      chsh -s $(which zsh)
      ```
      
   5. Add tap

      ```bash
      brew tap caskroom/cask
      brew tap caskroom/fonts
      ```
      
   6. Install font: font-firacode-nerd-font

      ```bash
      brew cask install caskroom/fonts/font-fira-code
      brew cask install caskroom/fonts/font-firacode-nerd-font
      ```

2. Install [iTerm2](https://www.iterm2.com/), install by Homebrew-Cask or download fomr website.

  ```bash
  brew cask install iterm2
  ```

3. Change the iterm2 color

   - Download the schema from https://github.com/mbadolato/iTerm2-Color-Schemes
   
   ```bash
   https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Tomorrow%20Night%20Eighties.itermcolors -O tomorrow-night-eighties.itermcolors
   ```

4. Change the font to `14pt firacode-nerd-font` in `Preferences > Profiles > Text > Change Font`.

5. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

   1. [Download and install oh-my-zsh by script](https://github.com/robbyrussell/oh-my-zsh#via-curl)

      ```bash
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
      ```

   2. Setup the theme to [Powerlevel9k](https://github.com/bhilburn/powerlevel9k):
      1. [Install Powerlevel9k](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-2-install-for-oh-my-zsh) for Oh-My-Zsh:

         clone the powerlevel9k to `~/.oh-my-zsh/custom/themes/powerlevel9k`

         ```bash
         git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
         ```


      2. Setting the theme and setup the config of `powerlevel9k`
         - ***Option 1***: 
             1. Download the config
             ```bash
             mkdir .myconfig
             ```

             ```bash
             wget https://raw.githubusercontent.com/seanmars/dotfiles/master/osx/.myconfig/oh-my-zsh-theme -O .myconfig/oh-my-zsh-theme
             ```

             2. Edit the `.zshrc`, add the below script under `ZSH_THEME="robbyrussell"`

             ```bash
             source .myconfig/oh-my-zsh-theme
             ```


         - ***Option 2***: Edit the `.zshrc` directly

         ```bash
         ZSH_THEME="powerlevel9k/powerlevel9k"

         # =============================================================================
         # POWERLEVEL9K
         # =============================================================================
         POWERLEVEL9K_MODE='nerdfont-complete'

         POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B4"
         POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="\uE0B4"
         POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
         POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="\uE0B6"

         POWERLEVEL9K_PROMPT_ON_NEWLINE=true
         POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

         POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{169}╭%F"
         POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{169}\u2570%F{208}\uF460%F{220}\uF460%F{231}\uF460%f "

         POWERLEVEL9K_STATUS_VERBOSE=false
         POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true

         POWERLEVEL9K_HOST_TEMPLATE=""
         POWERLEVEL9K_HOST_ICON="%F{228}\uF120%F"

         POWERLEVEL9K_TIME_BACKGROUND="255"
         POWERLEVEL9K_TIME_FORMAT="\uF017 %D{%T}"

         POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
         POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2

         POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host time dir dir_writable vcs status)
         POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time ip)
         ```

6. Add alias


```bash
wget https://raw.githubusercontent.com/seanmars/dotfiles/master/osx/.myconfig/alias -O .myconfig/alias
```

```bash
echo "source .myconfig/alias" >> ~/.zshrc
```
