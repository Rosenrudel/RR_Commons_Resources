/*
Author: Olsen, Perfk, Pax_Jarome
Locality:
server execution
local effect
Desc:
Main cascading function for the track workflow. Min one instance of this function
will be active for the entire length of the mission spawning childs of itself if
eventhandlers connected to the tracker fire.
*/

params [
	["_mode", "init", [""]], ["_unit", nil, [objNull]]
];

switch (toLower _mode) do {

	case "init": {
		{
			if (!(_x getVariable ["RR_commons_resources_DoNotTrack", false])) then {
				["trackUnit",_x] call RR_commons_core_fnc_unitTracker;
			};
		} forEach allUnits;
		RR_commons_resources_EventPlayerSpawnedHandle = ["RR_commons_resources_PlayerSpawnedEH", {["eventPlayerSpawned",_this] call RR_commons_core_fnc_unitTracker;}] call CBA_fnc_addEventHandler;
		RR_commons_resources_EventRespawnedHandle = addMissionEventHandler ["EntityRespawned", {["eventRespawned",_this] call RR_commons_core_fnc_unitTracker;}];
		RR_commons_resources_EventKilledHandle = addMissionEventHandler ["EntityKilled", {["eventKilled",_this] call RR_commons_core_fnc_unitTracker;}];
		RR_commons_resources_EventDisconnectHandle = addMissionEventHandler ["HandleDisconnect", {["eventDisconnect",_this] call RR_commons_core_fnc_unitTracker;}];
	};

	case "trackUnit": {
		private _unit = _this select 1;

		if (!(_unit getVariable ["RR_commons_resources_UnitTracked", false])) then {
			_unit setVariable ["RR_commons_resources_UnitTracked", true];
		};
	};

	case "untrackUnit": {
		private _unit = _this select 1;
		_unit setVariable ["RR_commons_resources_UnitTracked", nil];
	};

	case "eventPlayerSpawned": {
		private _unit = _this select 1;
		["trackUnit",_unit] call RR_commons_core_fnc_unitTracker;
		_unit setVariable ["RR_commons_resources_UnitDead", false, true];
		_unit setVariable ["RR_commons_resources_UnitHasDied", false];
	};

	case "eventDisconnect": {
		private _unit = _this select 1;

		if (_unit getVariable ["RR_commons_resources_UnitTracked", false]) then {
			if (["alive",_unit] call RR_commons_core_fnc_unitTracker) then {
				_unit setVariable ["RR_commons_resources_UnitDead", true, true];
			};
		};
		false
	};

	case "eventRespawned": {
		private _unit = _this select 1;

		if (!(_unit getVariable "RR_commons_resources_UnitDead")) then {
			["eventPlayerSpawned",_unit] call RR_commons_core_fnc_unitTracker;
		} else {
			["untrackUnit",_unit] call RR_commons_core_fnc_unitTracker;
		};
	};

	case "eventKilled": {
		private _unit = _this select 1;

		if (_unit getVariable ["RR_commons_resources_UnitTracked", false]) then {

			if (!(_unit getVariable ["RR_commons_resources_UnitHasDied", false]) &&  !(_unit getVariable ["RR_commons_resources_UnitDead", false])) then {
				_unit setVariable ["RR_commons_resources_UnitHasDied", true];
			};
		};
	};

	case "alive": {
		private _unit = _this select 1;
		(alive _unit) && !(_unit getVariable ["FW_Dead", false])
	};
};