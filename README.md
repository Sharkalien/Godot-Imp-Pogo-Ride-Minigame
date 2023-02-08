# Godot Imp Pogo Ride Minigame
The pogo ride Flash game from Homestuck recreated in Godot (v3.5.1)

Play the game [here](https://linkh.at/pogo)!

# To-do:
* [X] Get textbox working
* [X] Replay button
* [X] Volume button
* [X] Add an online scoreboard/leaderboard

# Exporting to HTML5
Under the export options, load the custom HTML shell from the "[export](https://github.com/Sharkalien/Godot-Imp-Pogo-Ride-Minigame/tree/main/export)" folder. The preloader.gif won't be included in the export, so be sure to copy the file to the folder you export to.

![image](https://user-images.githubusercontent.com/22488483/217599714-78ea4c1f-8462-44bf-a191-9e14d130785f.png)

Enable the experimental virtual keyboard as well so players on mobile can enter in their name.

![image](https://user-images.githubusercontent.com/22488483/217600896-379391ad-27ae-42eb-aea1-5abee5617ee9.png)

Under the Resources tab, export "*.env" files for the SilentWolf API key if you wish to set up your own leaderboard (more info on that [here](https://escada-games.itch.io/jump3match/devlog/242610/making-a-simple-online-leaderboard-in-godot-with-silentwolf)). Also exclude the reference images from the "images/references" folder, although this isn't necessary. It just makes the file size slightly smaller.

![image](https://user-images.githubusercontent.com/22488483/217601246-7e657e81-b3f5-4c8f-8552-9e7add43f66d.png)

# License
The code in this repository is licensed under the MIT license, but the music and art are not. All assets are the property of their respective owners. This is just an unoffical fan project being made and released freely.

# Credits
* Original art by Andrew Hussie
* Original music written by Mark Hadley and arranged by Michael Guy Bowman with guitar by Joseph Aylsworth
* Original ActionScript code by Aria "Gankra" Beingessner
* Original Flash game [here](https://www.homestuck.com/flash/hs2/00476/00476.swf)
