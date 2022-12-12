/*
Author: Olsen and Perfk (Olsen Framework) Editor: Pax_Jarome
Locality:
server execution
global effect
Desc:
This function adds an EH to the mission to call for body clean
ups according to the settings set in the RR_Commons.
*/

ace_respawn_RemoveDeadBodiesDisconnected = false;

RR_commons_resources_EventDisconnectEH_corpseRemoval = addMissionEventHandler ["HandleDisconnect", {_this call RR_commons_corpseHandler_fnc_corpseHandler;}];