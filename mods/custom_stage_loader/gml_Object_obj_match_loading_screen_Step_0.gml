/// PATCH

/// REPLACE
    room_goto(setting().match_stage);
/// CODE
    if (setting().match_stage < 1000)
    {
        room_goto(setting().match_stage);
    }
    else
    {
        var _name = get_custom_stage_name_by_zone_stage(setting().match_stage);
        var _config = get_custom_stage_config(_name);

        if (_config != undefined) {
            switch(_config.stage) {
                case "woods":
                    room_goto(rm_woods);
                    return;
                case "arena":
                    room_goto(rm_arena);
                    return;
            }
        }
        
        // default stage is "arena"
        room_goto(rm_arena);
    }
/// END
