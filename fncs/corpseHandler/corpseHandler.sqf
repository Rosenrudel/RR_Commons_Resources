/*
Author: Olsen and Perfk (Olsen Framework) Editor: Pax_Jarome
Locality:
server execution
global effect
Desc:
This function checks if the body of a disconnected player is
within the defined deletion window and if it is already
tracked by the server, if yes on window and no on tracking
the function will delete the body.
*/

private ["_unit"];
_unit = _this select 0;

if (_unit getVariable ["RR_commons_resources_UnitTracked", false]) then {
	#include "devar.sqf"
	if (time < RR_commons_corpseHandler_Time * 60 && (side _unit) in RR_commons_corpseHandler_Sides) then {
		deleteVehicle _unit;
	};
};