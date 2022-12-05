/*
Author: unkown (Armaholic ~2014) Editor: Pax_Jarome
Locality:
local execution
local effect
Desc:
At mission start the script will gather all placed
markers including hidden ones and perform a search
based on the markers variableObjectName given in the
editor. If the variableObjectName starts with any of
the BIS provided sides west,east,resistance,civilian
the script will "hide" (setMarkerAlphaLocal) the marker
based on the players playerSide.
This script will not accept parameters.
This script does not return any values.
*/

{
    _x setMarkerAlphaLocal 0
} count (
    allMapMarkers select {
        private _marker = _x;
        !(
            [
                west,east,resistance,civilian
            ] select {
                _marker find toLower str _x != -1
            } isEqualTo []
        ) && {
            _x find toLower str playerSide == -1
        }
    }
);