/*
*	Author: Wasserstoff
*
*	Desc: 
*   Inits the globals for the dynamic view distance main loop
*
*	Params:
*	0 - Enable Viewdistance <BOOL>
*	1 - Minimum Viewdistance <NUMBER>
*	2 - Maximum Viewdistance <NUMBER>
*	3 - Height Threshold <NUMBER>
*	4 - Dynamic Viewdistance Enable <BOOL>
*
*	Returns:
*	nil
*
* =================================================*/

params[
	["_viewdistance_enable", false, [true]],
	["_viewDistance_min", viewDistance, [0]],
	["_viewDistance_max", 2 * viewDistance, [0]],
	["_heightThreshold", 20, [0]],
	["_dynamicViewdistance_enable", true, [true]]
];

RR_commons_viewdistance = _viewdistance_enable;
RR_commons_viewDistance_min = _viewDistance_min;
RR_commons_viewDistance_max = _viewDistance_max;
RR_commons_dynamicViewdistance_groundViewdistance = _viewDistance_min;
RR_commons_dynamicViewdistance_airViewDistance = _viewDistance_max;
RR_commons_dynamicViewdistance_heightThreshold = _heightThreshold;
RR_commons_dynamicViewdistance = _dynamicViewdistance_enable;
RR_commons_dynamicViewdistance_nextCheck = 0;
RR_commons_dynamicViewdistance_overrideOVD = false;
RR_commons_dynamicViewdistance_keepRatio = true;
RR_commons_dynamicViewdistance_groundOVD = getObjectViewDistance param [0];
RR_commons_dynamicViewdistance_airOVD = getObjectViewDistance param [0];
RR_commons_dynamicViewdistance_firstTime = true;
if (_viewdistance_enable) then {
	private _vdActionID = player addAction["<t color='#FF0000'>Sichtweite</t>",RR_commons_dynamicViewDistance_fnc_openDialog,[],-99,false,false,"",''];
};
