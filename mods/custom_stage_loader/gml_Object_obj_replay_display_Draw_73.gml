/// PATCH

/// REPLACE
    var stageMetadata = stage_data_get(metadata.match_stage);
    var stage_size = 1;
    var stageOffset = _pad_default * 0.5;
    draw_sprite_ext(stageMetadata.sprite, stageMetadata.frame, (_xx + stageOffset) - 100, 648, stage_size, stage_size, 0, c_white, 1);
/// CODE
    var stageMetadata = stage_data_get(metadata.match_stage);
    var stage_size = 1;
    var stageOffset = _pad_default * 0.5;

    cache_all_customstages_names();
    if (variable_struct_exists(metadata, "csl_name"))
    {
        var _stage_id = get_stage_id_by_custom_stage_name(metadata.csl_name);
        if (_stage_id != -1)
        {
            stageMetadata = stage_data_get(_stage_id);
        }
    }

    var _sprite = -1;

    if (is_undefined(stageMetadata.sprite) || !sprite_exists(stageMetadata.sprite)) {
        load_customstages_default_sprites();
        if (variable_global_exists("customstages_default_icon") && sprite_exists(global.customstages_default_icon)) {
            _sprite = global.customstages_default_icon;
        }
    }
    else
    {
        _sprite = stageMetadata.sprite;
    }

    if (sprite_exists(_sprite)) {
        draw_sprite_ext(_sprite, stageMetadata.frame, (_xx + stageOffset) - 100, 648, stage_size, stage_size, 0, c_white, 1);
    }
/// END
