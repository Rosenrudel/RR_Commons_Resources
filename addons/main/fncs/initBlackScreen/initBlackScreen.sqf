/*
*	Author: LAxemann
*
*	Desc: 
*   Zeigt einen schwarzen Bildschirm mit Text an, setzt den Spieler als 
*	captive, verhindert Sound.
*
*	Params:
*	0 - Enable <BOOL>
*	1 - Enable for JIP <BOOL>
*	2 - Enable for SP <BOOL>
*	3 - Screen Time <Number>
*	4 - Screen Text <STRING>
*
*	Returns:
*	nil
*
* =================================================*/

params[
	["_blackScreen_enable", false, [true]],
	["_allowForJIP", true, [true]],
	["_allowForSP", false, [true]],
	["_screenTime", 12, [12]],
	["_screenText", "Mission wird initialisiert", [""]]
];

if (!_blackScreen_enable) exitWith {};

/* Init stuff */
if (didJIP && !(_allowForJIP)) exitWith {};
if ((!isMultiplayer) && (!_allowForSP)) exitWith {};
private ["_fuel","_playerVehicle"];
waitUntil {time > 0};
private _wasCaptive = captive player;
private _preventFromFiringAction = player addAction ["", {},nil,0,false,true,"defaultAction"];
private _isInVehicle = (vehicle player == player);

if (_isInVehicle) then {
	_playerVehicle = (vehicle player);
	if (local _playerVehicle) then {
		_fuel = fuel _playerVehicle;
		_playerVehicle setFuel 0;
	};
} else {	
	player switchMove "HubSpectator_standu";
};

/* Set player captive, disable sound, display black text */
player setCaptive true;
[0] call acre_api_fnc_setGlobalVolume;
ace_hearing_disableVolumeUpdate = true; 
0 fadeSound 0;
cutText [_screenText, "BLACK OUT",0.001];

sleep _screenTime;

/* Fade in, set values again */
cutText [_screenText, "BLACK IN",5];

if (_isInVehicle) then {
	if (local _playerVehicle) then {
		_playerVehicle setFuel _fuel;
	};
} else {
	player switchMove "";
};

player removeAction _preventFromFiringAction;
if !(_wasCaptive) then {player setCaptive false};
[0] call acre_api_fnc_setGlobalVolume;
ace_hearing_disableVolumeUpdate = false;
5 fadeSound 1;