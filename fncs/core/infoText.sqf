/* 	Template:
	[parseText "<t font='PuristaBold' size='1.6'>Too heavy to climb this high</t>", true, nil, 2, [0.1,1], 0] spawn BIS_fnc_textTiles;
*/

params [
	"_string",
	["_duration",2],
	["_playSound",true]
];

[parseText _string, true, nil, _duration, [0.1,1], 0] spawn BIS_fnc_textTiles;
if (_playSound) then [
	playSound ["RR_audio_core_infoTextHint",true];
};
