/// PATCH

/// REPLACE
            setting().match_stage = _struct.stage;
/// CODE
            setting().match_stage = _struct.stage;

            if (variable_struct_exists(_struct, "csl_name"))
            {
                var _custom_match_stage = get_stage_id_by_custom_stage_name(_struct.csl_name);
                if (_custom_match_stage != -1)
                {
                    setting().match_stage = _custom_match_stage;
                }
            }
/// END
