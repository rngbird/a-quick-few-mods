/// PATCH

/// REPLACE
    if (variable_struct_exists(_struct, "match_stage"))
        setting().match_stage = _struct.match_stage;
/// CODE
    if (variable_struct_exists(_struct, "match_stage"))
    {
        setting().match_stage = _struct.match_stage;
        
        if (variable_struct_exists(_struct, "csl_name"))
        {
            var _stage_id = get_stage_id_by_custom_stage_name(_struct.csl_name);
            if (_stage_id != -1)
            {
                setting().match_stage = _stage_id;
            }
        }
    }
/// END
