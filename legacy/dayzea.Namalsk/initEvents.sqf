DEBUGME = true;
/*
	CLIENT EVENTS
*/
if (!isDedicated) then
{
	"effectDazed" addPublicVariableEventHandler
	{
		call dayz_bulletHit;
		effectDazed = false;
	};
	"actionRestrained"  addPublicVariableEventHandler
	{
		[(_this select 1)] call event_playerRestrained;
	};	
	"makeNote" addPublicVariableEventHandler
	{
		notepen = (_this select 1) select 0;
		notepaper = (_this select 1) select 1;
		_ok = createDialog 'RscDisplayNote';
	};
	"displayNote" addPublicVariableEventHandler
	{
		noteDisplay = createDialog 'RscDisplayNoteViewer';
		(findDisplay 121 displayCtrl 1400) ctrlSetStructuredText parseText (_this select 1);
	};
};