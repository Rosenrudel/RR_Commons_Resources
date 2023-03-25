/*
*	Author: Wasserstoff
*
*	Desc: 
*   Inits the globals for the zone restriction main loop
*
*	Params:
*	0 - Enable <BOOL>
*	1 - Warning Time <NUMBER>
*	2 - Mode <NUMBER>
*	3 - Text <STRING>
*	4 - Triggers <[STRING]>
*	5 - Excluded units <[STRING]>
*
*	Returns:
*	nil
*
* =================================================*/

params[
	["_zoneRestriction_enable", false, [true]],
	["_invert", false, [true]],
	["_disableAir", false, [true]],
	["_warningTime", 10, [10]],
	["_mode", 0, [0]],
	["_text", "Achtung! Kehre in den Spielbereich zurück!", [""]],
	["_triggers", [], [[""]]],
	["_excludeArray", [], [[""]]]
];

RR_commons_zoneRestriction = _zoneRestriction_enable;
RR_commons_zoneRestriction_invert = _invert;
RR_commons_zoneRestriction_disableAir = _disableAir;
RR_commons_zoneRestriction_warningTime = _warningTime;
RR_commons_zoneRestriction_mode = _mode;
RR_commons_zoneRestriction_text = _text;
RR_commons_zoneRestriction_triggers 	= RR_commons_zoneRestriction_triggers   	apply {call compile _x};
RR_commons_zoneRestriction_excludeArray = RR_commons_zoneRestriction_excludeArray   apply {call compile _x};

RR_commons_zoneRestriction_canBeWarned = true;
RR_commons_zoneRestriction_killTime = 0;
RR_commons_zoneRestriction_nextCheck = 0;
RR_commons_zoneRestriction_lastWarning = -3;
RR_commons_lastVDChange = 0;