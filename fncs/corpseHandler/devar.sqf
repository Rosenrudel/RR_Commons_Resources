// Variable definitions for bodyHandler

// This defines for how many minutes after the mission started, bodies will be deleted at their spawn location
if (isNil "RR_commons_bodyHandler_Time") then {
	//default value if for some reason not defined via RR_commons
	RR_commons_corpseHandler_Time = 15;
};

// This defines for which BIS_sides bodies should be tracked. It is suggested to only select sides with playable slots.
if (isNil "RR_commons_bodyHandler_Sides") then {
	//this module will default to NO SIDE for tracked units to be removed.
	RR_commons_corpseHandler_Sides = [];
};