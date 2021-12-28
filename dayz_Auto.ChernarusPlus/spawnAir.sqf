//DayZ Legacy 0.44
//spawnAir.sqf - Handles helicopter spawning for the server

activateAddons["CAAir", "CAAir2", "CAAir3"];

createVehicle ["IND_Heli_Light01_Military_H", [9742.67, 1723.21, 0.00176013], [], 0, "CAN_COLLIDE"];
createVehicle ["Heli_Light01_shadow_H", [9741.67, 1749.21, 0.00176013], [], 0, "CAN_COLLIDE"];
createVehicle ["TK_Heli_Medium01_Military_H", [9712.67, 1720.21, 0.00176013], [], 0, "CAN_COLLIDE"];
createVehicle ["Heli_Medium01_Coastguard_H", [9645.67, 1723.21, 0.00176013], [], 0, "CAN_COLLIDE"];
createVehicle ["Heli_Medium01_wasp_H", [9712.67, 1749.21, 0.00176013], [], 0, "CAN_COLLIDE"];
createVehicle ["Heli_Heavy01_Luxury_President_H", [9734.67, 1720.21, 0.00176013], [], 0, "CAN_COLLIDE"];

diag_log "Aerial vehicles created.";