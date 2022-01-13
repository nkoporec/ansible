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
 3. Add a task to install gopls
 4. Automate qutebrowser theme install.
 5. Automate the scripts (in dotfiles)

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
 4. Move it to `/usr/bin/`
 5. In project nvim settings(.local.vimrc) alter the phpstan maker
    ```
    let phpStanConfigFilePath = 'path_to_config_file'
    let g:neomake_php_phpstan_maker = {
    \ 'exe': 'phpstan7',
    \ 'args': ['analyse', '--error-format', 'raw', '--no-progress', '--level', '5', '-c', phpStanConfigFilePath],
    \ 'errorformat': '%E%f:%l:%m',
    \ }
    ```

#### Use composer with php7
 1. Install php7, `sudo pacman -Sy php7 php7-gd`
 2. Enable ext-gd and ext-sockets extensions in `/etc/php7/php.ini`
 3. Create a bash script named `composer7` with contents (change variables with the correct values):
    ```
    #!/bin/bash
    /usr/bin/php7 /usr/bin/composer $@
    ```
 4. Make it executable `sudo chmod +x composer7`
 5. Move it to `/usr/bin/`

#### Why does it take longer to open a URL in qutebrowser than in chromium?

When opening a URL in an existing instance, the normal qutebrowser Python script is started and a few PyQt libraries need to be loaded until it is detected that there is an instance running to which the URL is then passed. This takes some time. One workaround is to use this script(https://github.com/qutebrowser/qutebrowser/blob/master/scripts/open_url_in_instance.sh) and place it in your $PATH with the name "qutebrowser". This script passes the URL via a unix socket to qutebrowser (if its running already) using socat which is much faster and starts a new qutebrowser if it is not running already.

1. Create a `qutebrowser` script in  `/usr/bin/` and add the contents of `open_url_in_instance` script.
2. Make it executable `chmod +x ./qutebrowser`

#### How to downgrade packages

If after system update certain packages are not working correctly then the easiest way to fix it is to downgrade the package to the previous working version.

1. Run `sudo downgrade PKG`
2. Select the version
