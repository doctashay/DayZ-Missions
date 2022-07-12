// diag_log "Weather change start";

// [] spawn {
//     while {true} do {
//         sleep 30;
        
//         diag_log "added simple weather sync from server to cliets, with timer so it wont be too obvious";
//         {[_x select 0,date,1,1,1] spawnforclient {setdate (_this select 1); 0 setovercast (_this select 2); 0 setrain (_this select 3);0 setfog (_this select 4)};} foreach netPlayersInfo;
//     };
// // };