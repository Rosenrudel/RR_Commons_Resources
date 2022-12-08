/*
Author: Pax_Jarome
Locality:
local execution
local effect
Desc:
Checks if the receiver isn't a Headless Client, continues to set the players primary weapon to safe,
copy magazine name, remove all bullets from the loaded magazine and adds a magazine of the previously
loaded type to any free space on the player, thus preventing the player from discharging a bullet.
This script will not accept parameters.
This script does not return any values.
*/

waitUntil {not isNil player};
if (isPlayer && !hasInterface) then { //exclude HC
	exitWith {0};
} else {
	[player, primaryWeapon player, true] call ACE_safemode_fnc_setWeaponSafety;
	private _mag = primaryWeaponMagazine player;
	player setAmmo [primaryWeapon player, 0];
	player addMagazine _mag;
};