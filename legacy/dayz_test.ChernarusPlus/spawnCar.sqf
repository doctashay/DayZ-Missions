//DayZ Legacy 0.44
//spawnCar.sqf - Handles car spawning for the server

activateAddons["DZ_Vehicles_wheeled", "hsim_wheeled_h_truck_light_transport", "hsim_wheeled_h_police_car"];

_this = createVehicle ["UAZ_CDF", [9762.67, 1749.51, 0.00176013], [], 0, "CAN_COLLIDE"];
_this = createVehicle ["Skoda", [9767.67, 1749.21, 0.00176013], [], 0, "CAN_COLLIDE"];
_this = createVehicle ["HMMWV", [9770.67, 1749.21, 0.00176013], [], 0, "CAN_COLLIDE"];
_this = createVehicle ["PoliceCar_H", [9782.67, 1760.51, 0.00176013], [], 0, "CAN_COLLIDE"];
_this = createVehicle ["Van_H", [9757.67, 1749.21, 0.00176013], [], 0, "CAN_COLLIDE"];
_this = createVehicle ["Van_Flatbed_H", [9770.67, 1749.21, 0.00176013], [], 0, "CAN_COLLIDE"];
_this = createVehicle ["Van_Flatbed_H", [10493.7, 2348.17, 0], [], 0, "CAN_COLLIDE"]; //electro shcola
_this = createVehicle ["datsun1_civil_2_covered", [10150.7, 1810.41, 0], [], 0, "CAN_COLLIDE"]; //electro prom zona
_this = createVehicle ["UAZ_RU", [11986.2, 3839.67, 0], [], 0, "CAN_COLLIDE"]; //kamishovo verh	
_this = createVehicle ["Ural_INS", [12883.2, 6259.25, 0], [], 0, "CAN_COLLIDE"]; //solnecnii verh
_this = createVehicle ["Ural_Refuel_H", [12275.8, 9123.41, 0], [], 0, "CAN_COLLIDE"]; //berezeno kolhoz
_this = createVehicle ["HMMWV", [12937.6, 10185.7, 0], [], 0, "CAN_COLLIDE"]; //berezeno police
_this = createVehicle ["SkodaGreen", [13845.8, 13216.7, 0], [], 0, "CAN_COLLIDE"]; //svetloearsk police
_this = createVehicle ["UralCivil", [13891.7, 13425.6, 0], [], 0, "CAN_COLLIDE"]; // svetloearsk JD stanciea
_this = createVehicle ["car_hatchback", [11885.6,12469.2,0], [], 0, "CAN_COLLIDE"];//krasnostav airfield
_this = createVehicle ["HMMWV", [11262.4, 12212.2, 0], [], 0, "CAN_COLLIDE"]; //krasnostav magazin
_this = createVehicle ["UAZ_INS", [4794.11, 2539.87, 0], [], 0, "CAN_COLLIDE"]; //balota airfield
_this = createVehicle ["Skoda", [10740.4, 10788.2, 0], [], 0, "CAN_COLLIDE"]; //dubrovka zaprafka
_this = createVehicle ["UralCivil", [10661.3, 7994.43, 0], [], 0, "CAN_COLLIDE"]; //poleana magazin
_this = createVehicle ["datsun1_civil_2_covered", [7185, 7675.18, 0], [], 0, "CAN_COLLIDE"]; //novii sobor police
_this = createVehicle ["hilux1_civil_1_open", [6063.77, 7871.36, 0], [], 0, "CAN_COLLIDE"]; //staryi sobor magazin
_this = createVehicle ["datsun1_civil_3_open", [4519.95, 8291.32, 0], [], 0, "CAN_COLLIDE"]; //military base kabanino
_this = createVehicle ["HMMWV", [4795.56, 10250.1, 0], [], 0, "CAN_COLLIDE"]; //lopatino stekleashka
_this = createVehicle ["car_sedan", [4170.73, 11103.4, 0], [], 0, "CAN_COLLIDE"]; //lopatino palatki
_this = createVehicle ["SkodaGreen", [5954.25, 10366.5, 0], [], 0, "CAN_COLLIDE"]; //grishino gostinitca
_this = createVehicle ["tractor", [3751.32, 8858.37, 0], [], 0, "CAN_COLLIDE"]; //vibor shkola
_this = createVehicle ["UralOpen_CDF", [2716.53, 10031.4, 0], [], 0, "CAN_COLLIDE"]; //lopatino cerkov
_this = createVehicle ["HMMWV", [3048.92, 7787.31, 0], [], 0, "CAN_COLLIDE"]; //pustoshka garaji
_this = createVehicle ["hilux1_civll_1_open", [2589.18, 6355.03, 0], [], 0, "CAN_COLLIDE"]; //sosnovka orkaina
_this = createVehicle ["SkodaBlue", [2583.23, 5073.8, 0], [], 0, "CAN_COLLIDE"]; //zelenogorsk milytary base naves
_this = createVehicle ["UralCivil2", [2654.09, 5289.31, 0], [], 0, "CAN_COLLIDE"]; //zelenogosk magazin
_this = createVehicle ["Ural_CDF", [3711.64, 5969.98, 0], [], 0, "CAN_COLLIDE"]; //zelenaea gora
_this = createVehicle ["UAZ_CDF", [1672.24, 3843.93, 0], [], 0, "CAN_COLLIDE"]; //pavlovo gostinica
_this = createVehicle ["HMMWV", [2182.85, 3307.73, 0], [], 0, "CAN_COLLIDE"]; //military base zelenogorsk
_this = createVehicle ["UAZ_RU", [1878.72, 2254.03, 0], [], 0, "CAN_COLLIDE"]; //kamenka krasnii dom
_this = createVehicle ["Ural_INS", [3658.2, 2194.58, 0], [], 0, "CAN_COLLIDE"]; //komorovo factory
_this = createVehicle ["UralOpen_INS", [4334.19, 2462.08, 0], [], 0, "CAN_COLLIDE"]; //balota city
_this = createVehicle ["datsun1_civil_2_covered", [6855.9, 2471.24, 0], [], 0, "CAN_COLLIDE"]; //cherno hotel
_this = createVehicle ["HMMWV", [6565.06, 2547.52, 0], [], 0, "CAN_COLLIDE"]; //cherno prom zona
_this = createVehicle ["datsun1_civil_2_covered", [5691.65, 2579.14, 0], [], 0, "CAN_COLLIDE"]; //cepaevsk
_this = createVehicle ["UralOpen_CDF", [6255.8, 3256.48, 0], [], 0, "CAN_COLLIDE"]; //novoselki parkovka
_this = createVehicle ["datsun1_civil_2_covered", [6682.32, 3580.23, 0], [], 0, "CAN_COLLIDE"]; //dubki
_this = createVehicle ["hilux1_civil_2_covered", [7805.4, 3534.9, 0], [], 0, "CAN_COLLIDE"]; //ptigorodki naves(gora)

_this = createVehicle ["TentMedium_Pitchedred", [2220.71, 5120.27, 0.00143433], [], 0, "CAN_COLLIDE"]; //base test
_this = createVehicle ["TentLarge_Pitched", [2220.71, 5120.27, 0.00143433], [], 0, "CAN_COLLIDE"]; //base test
_this = createVehicle ["MH60S", [2240.83, 5117.39, 0.00192261], [], 0, "CAN_COLLIDE"]; //base test

_obj = createVehicle ["HMMWV", [2227.16, 5116.78, 0], [], 0, "CAN_COLLIDE"]; //base test

_agent = createAgent ["RedDeer", [2227.16, 5116.78, 0],[],0,"CAN_COLLIDE"];
diag_log "Land vehicles created.";

