/*
Author: Olsen (Olsen Framework) Editor: Pax_Jarome
Locality:
local execution
local effect
Desc:
At mission start the anti ND EH will inhibit any
throwables thrown or weapons shot based on a value
for distance and/or time defined in the RR_Commons.
This script will not accept parameters.
This script does not return any values.
*/

#include "devar.sqf"

[] spawn {
//	waitUntil {!isNull player}; removed as most likely not needed as fired via playerInitLocal
	RR_commons_resources_spawnPos = getPos player;
	RR_commons_resources_antiNDFiredLocalEh = player addEventHandler ["Fired", {
		private _munition = _this select 6;
		Missiontime = call RR_commons_core_fnc_getMissionTime;
		if (((RR_commons_resources_spawnPos distance player) <= RR_commons_anti_ND_Distance) || ((Missiontime) <= RR_commons_resources_anti_ND_Time)) then {
			deleteVehicle _munition;
			hintC format ["Spawn Anti-ND Schutz"];
			if ((_this select 5) call BIS_fnc_isThrowable) then {
				player addMagazine (_this select 5);
			}
			else {
				player setAmmo [currentWeapon player, (player ammo currentWeapon player) + 1];
			};
		};
	}];
};