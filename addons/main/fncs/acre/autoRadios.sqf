/*
*	Author: LAxemann
*
*	Desc: 
*   Vergibt Funkgeräte zu Missionsstart an Spieler. 
*
*	Params:
*	0 - Auto radios enable <BOOL>
*	1 - Include Civilians? <BOOL>
*	2 - Enable 148 for group leaders <BOOL>
*	3 - Enable 117 for units above lieutenant <BOOL>
*	4 - Units with 148 <[STRING]>
*	5 - Units with 117 <[STRING]>
*
*	Returns:
*	Nil
*
*	Example: 
*   call RR_commons_acre_fnc_autoRadios
* =================================================*/

params[
	["_autoRadios_enable", false, [true]],
	["_includeCivilians", true, [true]],
	["_148ForGroupLeaders", true, [true]],
	["_117ForAboveLieutenant", true, [true]],
	["_unitsWith148", [], [[""]]],
	["_unitsWith117", [], [[""]]]
];

if (_autoRadios_enable) then {
	if ((side player == civilian) && {!_includeCivilians}) exitWith {};
	private _has148  = false;
	private _has117F = false;

	/* Füge 148er zu Gruppenleitern und 117F zu Einheiten mit einem Rang ab "Captain" hinzu */
	if (_148ForGroupLeaders && {player == (leader (group player))}) then {
		player addItem "ACRE_PRC148";
		_has148 = true;
	};
	if (_117ForAboveLieutenant && {[player] call RR_commons_core_fnc_isLeader}) then {
		player addItem "ACRE_PRC117F";
		_has117F = true;
	};

	
	private _148Array = [];
	private _117Array = [];
	_unitsWith148 select {
		private _unit = _x;
		if (typeName _unit == "STRING") then {
			_unit = call compile _unit;
		};
		_148Array pushBack _unit;
		true;
	};
	_unitsWith117 select {
		private _unit = _x;
		if (typeName _unit == "STRING") then {
			_unit = call compile _unit;
		};
		_117Array pushBack _unit;
		true;
	};

	/* Checke, ob die Einheit in der forcierten Funkgerätzuweisung auftaucht */
	if (player in _148Array && {!(_has148)}) then {
		player addItem "ACRE_PRC148";
	};
	if (player in _117Array && {!(_has117F)}) then {
		player addItem "ACRE_PRC117F";
	};
};

nil;