/// PATCH

/// APPEND

if (setting().match_stage >= 1000)
{
    var _name = get_custom_stage_name_by_zone_stage(setting().match_stage);
    if (file_exists("modmanager/stages/" + _name + "/stage.obj"))
    {
        obj_name = "modmanager/stages/" + _name + "/stage.obj";
    }
    
    setting().match_stage = rm_woods; // to fix replays (won't show custom bg)
}

/// END
