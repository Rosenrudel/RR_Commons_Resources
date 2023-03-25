/*
*	Author: Wasserstoff
*
*	Desc: 
*   Initialisiert die Variablen und Actions für den Teleporter.
*
*	Params:
*	0 - Teleport enable <BOOL>
*	1 - Allow teleport to AI <BOOL>
*	2 - Show teleport menu on JIP <BOOL>
*	3 - Teleport Objects <[STRING]>
*
*	Returns:
*	Nil
*
*	Example: 
*   call RR_commons_teleport_fnc_initTeleport
* =================================================*/

params[
	["_teleport_enable", false, [true]],
	["_allowTeleportToAI", false, [true]],
	["_teleportJIP", false, [true]],
	["_teleporter_objects", [], [[""]]]
];

if (!_teleport_enable) exitWith {};

RR_commons_teleport_canTeleport  = true;
RR_commons_teleport_allowTeleportToAI = _allowTeleportToAI;


[_teleporter_objects] call RR_commons_teleport_fnc_addAction;

if (!_teleportJIP) exitWith {};

[] spawn {
	waitUntil {!isNull player};
	if (didJIP) then {
		call RR_commons_teleport_fnc_addActionJIP;
	};
};

nil;