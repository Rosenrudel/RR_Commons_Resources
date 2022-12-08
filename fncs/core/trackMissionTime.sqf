/*
Author: Pax_Jarome
Locality:
server execution
global effect
Desc:
At mission start the server is instructed to fill RR_commons_resources_missionTime every second
with the current time since the mission started. That variable can then be called by a client
in f.e. combination with didJIP to do stuff.
This script will not accept parameters.
This script does not return any values.
*/

if (isDedicated) then {
	diag_log format ["TRACKER: Starte Missionszeiterfassung %1", systemTime];
	while {"true"} do {
		missionNamespace setVariable [RR_commons_resources_missionTime, time, false];
		sleep 1;
	};
};