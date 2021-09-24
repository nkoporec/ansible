## About
This is my personal ansible setup to set up a new arch linux machine. The OS should be installed via the `archinstall` command, see INSTALL.md on how to do it. After the installation, the `pacman -Sy --noconfirm --needed git ansible` command needs to be run in order to install the dependencies needed for this.

## Testing
 1. Build and start the containers: \
`make clean && make build && make run && make shell`

 2. Run the ansible as normal user (in docker shell): \
`sudo su nkoporec` \
`make ansible-install`

## Installation (on new computer)
 1. See INSTALL.md

 2. Run the ansible as normal user: \
`make ansible-install`


## Manual steps / TODO
 1. Automate .gitignore and .gitconfig
 2. Automate mimeapps.list (for default apps)
 3. Find a working spotify app (maybe spotify-tui ?)
 4. Add a task to install gopls


## Troubleshooting

#### Microphone not working
 Most likely the channel is disabled. Go to `pavucontrol` and under input enable the microphone (lock icon).
 
#### Microphone sound is choppy
 1. `sudo nvim /etc/pulse/daemon.conf`
 2. Set `default-sample-rate` and `alternate-sample-rate` to 48000
 3. Save and restart

#### phpstan does not work in nvim(using neomake)
The issue is that by default php8 is installed and older versions of phpstan was not compatible with it.
 1. Install php7, `sudo pacman -Sy php7`
 2. Create a bash script named `phpstan7` with contents (change variables with the correct values):
    ```
    #!/bin/bash
    /usr/bin/php7 -d memory_limit=4G PATH_TO_PHPSTAN_PHAR $@
    ```
 3. Make it executable `sudo chmod +x phpstan7`
 4. Move it to `/usr/bin/
 5. In project nvim settings(.local.vimrc) alter the phpstan maker
    ```
    let phpStanConfigFilePath = 'path_to_config_file'
    let g:neomake_php_phpstan_maker = {
    \ 'exe': 'phpstan7',
    \ 'args': ['analyse', '--error-format', 'raw', '--no-progress', '--level', '5', '-c', phpStanConfigFilePath],
    \ 'errorformat': '%E%f:%l:%m',
    \ }
    ```
