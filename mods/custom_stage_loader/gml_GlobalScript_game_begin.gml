/// PATCH

/// REPLACE
    assert(room_exists(setting().match_stage), "[game_begin] The match stage ", setting().match_stage, " does not exist!");
/// CODE
    if (setting().match_stage < 1000)
    {
        assert(room_exists(setting().match_stage), "[game_begin] The match stage ", setting().match_stage, " does not exist!");
    }
/// END
