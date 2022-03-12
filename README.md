# DayZ Legacy Mission Data

<p align="center">
  <a href="https://www.codacy.com/gh/doctashay/DayZ-Missions/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=doctashay/DayZ-Missions&amp;utm_campaign=Badge_Grade" rel="nofollow"><img src="https://app.codacy.com/project/badge/Grade/d71cbf4c259f4ff699e151268d34507b" alt="Codacy Badge" style="max-width:100%;"></a>
  <a href="https://discord.gg/TF7CXGMFqg"><img src="https://img.shields.io/discord/756287461377703987" alt="Discord"></a>
  <a href="https://makeapullrequest.com"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square" alt=PRs Welcome></a>
</p>

## Repository Description

This repository contains the mission files that support DayZ Legacy. 

Per the ARMA engine standard, server and client data is often packed into a folder and turned into a PBO file, which is then read by the game server upon launch. These PBO files can contain a wide variety of both simple and complex scripts, from server monitors, to anti-cheats, to event handlers of all types.

In DayZ specifically, this forumula has been tweaked a little bit. The engine still uses and depends on a mission file to run the server, however in the offical branches of versions 0.28-0.59, these are heavily stripped-down missions that only contain simple and/or auxillary systems, such as specifying the hive server, some loading strings, time and weather. From here, the game actually decides to call gameplay related scripts from two separate script modules, `server_data.pbo` and `modules_DayZ.pbo`. These two modules contain roughly 90% of all script data related to player, zombie, and world interaction, and the game depends on these scripts to load into game. 

To preserve the integrity of these script modules, two separate versions of the DayZ Legacy Mission exist, one which loads completely vanilla, as the game was on Steam for the version 0.44 release. The other has been modified to call the "redirected" versions of these script two script modules with my custom content and features. 

Our modified DayZ Legacy mission has several changes like a debug monitor that shows coordinates, FPS, and blood/health/shock values, as well as a debug menu to perform a variety of different functions for testing purposes. This mission also has scripts that handle animal, helicrash, car, and helicopter spawning. This mission uses a copy of `modules_DayZ.pbo` and `server_data.pbo` that are present in the `@DayZLegacy` addon, which is hosted at this repository here: https://github.com/doctashay/DayZ-Legacy-Addons. These scripts have been merged with scripts from newer versions of the game to support things like pulse checking, horticulture, hunting, camping, fishing, base building, etc. 

dayz_Auto.ChernarusPlus contains the current working version of the DayZ Legacy mission, while dayzea.ChernarusPlus is the original, vanilla mission (maybe has been changed a little bit?)

## Script Execution Flow

To-Do
