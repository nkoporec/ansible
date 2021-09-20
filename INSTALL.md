1. Download the .ISO file from Arch Downloads.
2. Create a bootable USB drive (using Etcher)
3. Boot and type archinstall in the console.
4. Select a keyboard language. You have to type the number which is shown prepended in each language name.
5. Select a region to download packages from.
6. This one is an important part of installation. You have to select a drive where you want to install the system.
7. After the partition stuff done, You have to choose a fire system format. I am most comfortable with ext4 so I will type 1.
8. You can now setup encryption if you like. In my case I will just leave it blank for no encryption.
9. Create a hostname.
10. Type a password for the hostname.
11. Now create your first user by the same process. When asked if it should be superuser type y.
12. Now it will ask you to select a predefined profile. Here we want to install i3 so we will select 0 which is desktop.
13. Type 6 for the i3 window manager.
14. When asked to choose between i3-wm & i3-gaps, you can choose anyone you like. I will go with i3-gaps.
15. Now you have to select drivers for the system. I recommend going with 1 which installs all open-source drivers. But if you are on Nvidia, Go for 3.
16. You can select any audio drive you like.
17. You can now select a kernel. The default is fine for most users so just press enter.
18. When asked to install additional packages just type enter as you can always install then after.
19. Now choose a network manager to configure, I type 1 which is NetworkManager.
20. Select your timezone. UTC is fine for me so I just press enter.
21. I want to sync to NTP so now I will type y.
22. Press enter to continue.
23. Now it will take some time to install & setup all the things.
24. It will now ask to manually check the installation. You can type n for decline.
25. Now when you are back to console you have to restart. Type shutdown -r 0 in the terminal to restart.
26. Remove the pen drive and boot normally.
27. You will see a GRUB screen. Select Arch Linux and press enter.
28. You will now see a login screen. Type your password and login.
29. Install git, ansible using pacman.
30. Clone this repo and run `make ansible-install`
