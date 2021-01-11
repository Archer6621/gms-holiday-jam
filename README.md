# gms-holiday-jam
Game for Christmas game jam (Forward Momentum) 2020-2021

Link to jam: https://itch.io/jam/gamemaker-holiday

Link to submission: https://archer6621.itch.io/supernova

You'll need at least GMS 2.3.1 to open this project.

The game was built in about 2-ish weeks, including all sound, music and graphics.

Some cool stuff it features in terms of tech:
- Dynamic lighting system (shader + light sorter/manager) with normal map and emission map support.
- Procedural shaded endless parallax backgrounds via sprite splatting
- A shader for the supernova effects, featuring some screen warping
- Drones that behave a bit like boids
- A basic physics system for rigidbody collisions written in GML (ignoring Gamemaker's built-in physics system for extra control)
- A nifty UI workflow that works with callbacks
- A type-writer style dialogue system
- Queued announcer system
- Some nice utility functions that make use of the newly added functions for GML (e.g. delayed actions, conditional actions, proximity checkers)
- A neat way to decouple control from the controlling object, e.g. Ships are both used by the player and by AI Drones
