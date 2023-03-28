/*
*	Author: LAxemann
*
*	Desc: 
*   Sofern Babel aktiviert ist, vergibt das Script die definierten Sprachen an Spieler.
*	Config via Editor.
*
*	Params:
*	0 - Babel Enable <BOOL>
*	1 - Bluefor Language <STRING>
*	2 - Redfor  Language <STRING>
*	3 - Greenfor Language <STRING>
*	4 - Civilian Language <STRING>
*	5 - Blufor Language Translators <[STRING]>
*	6 - Redfor Language Translators <[STRING]>
*	7 - Greenfor Language Translators <[STRING]>
*	8 - Civilian Language Translators <[STRING]>
*  
*	Returns:
*	Nil
*
*	Example: 
*   call RR_commons_acre_fnc_babelSetup
* =================================================*/

params[
	["_babel_enable", false, [true]],
	["_bluforLanguage", "BLUFOR-Sprache", [""]],
	["_redforLanguage", "REDFOR-Sprache", [""]],
	["_greenforLanguage", "GREENFOR-Sprache", [""]],
	["_civilLanguage", "ZIVIL-Sprache", [""]],
	["_bluforLanguageTranslators", [], [[""]]],
	["_redforLanguageTranslators", [], [[""]]],
	["_greenforLanguageTranslators", [], [[""]]],
	["_civilLanguageTranslators", [], [[""]]]
];

if !(_babel_enable) exitWith {};

/* Definiert die Standardsprachen */
["BF", _bluforLanguage] 	call acre_api_fnc_babelAddLanguageType;
["RF", _redforLanguage] 	call acre_api_fnc_babelAddLanguageType;
["GF", _greenforLanguage] 	call acre_api_fnc_babelAddLanguageType;
["CV", _civilLanguage] 		call acre_api_fnc_babelAddLanguageType;
RR_commons_acre_languagesBLUFOR   = ["BF"];
RR_commons_acre_languagesREDFOR   = ["RF"];
RR_commons_acre_languagesGREENFOR = ["GF"]; // <- GREENFOR können also ihre eigene und die Zivilsprache
RR_commons_acre_languagesCivs 	  = ["CV"];

private _side = side player;

/* Vergebe die Standardsprachen an Spieler */
RR_commons_spokenLanguages = switch (_side) do {
	case west: {
		RR_commons_acre_languagesBLUFOR;
	};
	case east: {
		RR_commons_acre_languagesREDFOR;
	};
	case resistance: {
		RR_commons_acre_languagesGREENFOR;
	};
	case civilian: {
		RR_commons_acre_languagesCivs;
	};
};

/* Checke, ob der Spieler Übersetzer ist */
private _bfTranslators = _bluforLanguageTranslators   apply {call compile _x};
private _rfTranslators = _redforLanguageTranslators   apply {call compile _x};
private _gfTranslators = _greenforLanguageTranslators apply {call compile _x};
private _cvTranslators = _civilLanguageTranslators    apply {call compile _x};
{
	_x params ["_unitArray","_language"];
	if (player in _unitArray) then {
		RR_commons_spokenLanguages pushBackUnique _language;
	};
} forEach [[_bfTranslators,"BF"],[_rfTranslators,"RF"],[_gfTranslators,"GF"],[_cvTranslators,"CV"]];

/* Weise die Sprachen zu */
RR_commons_spokenLanguages call acre_api_fnc_babelSetSpokenLanguages;

nil;
