/// PATCH

/// REPLACE
    _struct.match_stage = setting().match_stage;
/// CODE
    if (setting().match_stage >= 1000)
    {
        var _name = get_custom_stage_name_by_zone_stage(setting().match_stage);
        var _config = get_custom_stage_config(_name);

        _struct.csl_name = _name; // custom map name stored in replay
        _struct.match_stage = get_stage_config_to_room(_config);
    }
    else
    {
        _struct.match_stage = setting().match_stage;
    }
/// END
