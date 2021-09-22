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

### Microphone not working
 Most likely the channel is disabled. Go to `pavucontrol` and under input enable the microphone (lock icon).
