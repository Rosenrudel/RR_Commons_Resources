/* Sichtweiten Kram */
[
	RR_commons_viewdistance,
	RR_commons_viewDistance_min,
	RR_commons_viewDistance_max,
	RR_commons_dynamicViewdistance_heightThreshold,
	RR_commons_dynamicViewdistance
] call RR_commons_dynamicViewDistance_fnc_initDynamicViewDistance;


/* ACRE */
[
	RR_commons_acre_babel,
	RR_commons_acre_babel_bluforLanguage,
	RR_commons_acre_babel_redforLanguage,
	RR_commons_acre_babel_greenforLanguage,
	RR_commons_acre_babel_civilLanguage,
	RR_commons_feature_acre_babel_bluforLanguageTranslators,
	RR_commons_feature_acre_babel_redforLanguageTranslators,
	RR_commons_feature_acre_babel_greenforLanguageTranslators,
	RR_commons_feature_acre_babel_civilLanguageTranslators    
] call RR_commons_acre_fnc_babelSetup;

[
	RR_commons_acre_autoRadios,
	RR_commons_acre_autoRadios_includeCivilians,
	RR_commons_acre_autoRadios_148ForGroupLeaders,
	RR_commons_acre_autoRadios_117ForAboveLieutenant,
	RR_commons_acre_autoRadios_unitsWith148,
	RR_commons_acre_autoRadios_unitsWith117 
]call RR_commons_acre_fnc_autoRadios;


/* Teleporter */
[
	RR_commons_teleport,
	RR_commons_teleport_allowTeleportToAI,
	RR_commons_teleportJIP,
	RR_commons_teleport_teleporterObjects
] call RR_commons_teleport_fnc_initTeleport;


/* Init Blackscreen */
[
	RR_commons_initBlackScreen,
	RR_commons_initBlackScreen_allowForJIP,
	RR_commons_initBlackScreen_allowForSP,
	RR_commons_initBlackScreen_time,
	RR_commons_initBlackScreen_text
] spawn RR_commons_initBlackScreen_fnc_initBlackScreen;


/* Artilleriecomputer */
[RR_commons_artilleryComp] params [["_artilleryComp", false, [true]]];
if !(_artilleryComp) then {
	enableEngineArtillery false; 
};


/* Zonerestriction */
[
	RR_commons_zoneRestriction,
	RR_commons_zoneRestriction_invert,
	RR_commons_zoneRestriction_disableAir,
	RR_commons_zoneRestriction_warningTime,
	RR_commons_zoneRestriction_mode,
	RR_commons_zoneRestriction_text,
	RR_commons_zoneRestriction_triggers,
	RR_commons_zoneRestriction_excludeArray
] call RR_commons_zoneRestriction_fnc_initZoneRestriction;


/* Anti Cheat */
if (isMultiplayer) then {
	[] spawn {
		private _randomTime = 8 + (random 20);
		waitUntil {sleep 0.5; time > _randomTime};
		call RR_commons_antiCheat_fnc_clientSendInfoToServer;
	};
};




/* Persistence */
if (RR_commons_persistence) then {
	if (isNil "RR_commons_persistence_baseTrigger") then {RR_commons_persistence_baseTrigger = []};
	if (isNil "RR_commons_persistence_customSaveFunction") then {RR_commons_persistence_customSaveFunction = ""};
	if (isNil "RR_commons_persistence_customLoadFunction") then {RR_commons_persistence_customLoadFunction = ""};
	if (isNil "RR_commons_persisRR_commons_persistence_disablePositionLoadingtence_baseTrigger") then {RR_commons_persistence_disablePositionLoading = false};
};

/* Master PFH */
[{
	/* Dyn. viewDistance */
	private _currentTime = time;
	if (RR_commons_viewdistance && {_currentTime >= RR_commons_dynamicViewdistance_nextCheck}) then {
		call RR_commons_dynamicViewdistance_fnc_handleTerrainGrid;
		RR_commons_dynamicViewdistance_nextCheck = _currentTime + 0.5;
	};
	
	/* zoneRestriction */
	if (RR_commons_zoneRestriction && {_currentTime >= RR_commons_zoneRestriction_nextCheck}) then {
		call RR_commons_zoneRestriction_fnc_main;
		RR_commons_zoneRestriction_nextCheck = _currentTime + 0.5;
	};
	clearRadio
}, 0] call CBA_fnc_addPerFrameHandler;