/// FUNCTIONS

function get_custom_stage_config(stage)
{
    var _path = "modmanager/stages/" + stage + "/config.json";
    if (!file_exists(_path)) return undefined;

    var _file = file_text_open_read(_path);
    var _text = "";
    while (!file_text_eof(_file))
    {
        _text += file_text_read_string(_file);
        file_text_readln(_file);
    }
    file_text_close(_file);

    var _data;
    try {
        _data = json_parse(_text);
    }
    catch (e) {
        _data = undefined;
    }

    if (is_array(_data)) {
        _data = undefined;
    }

    return _data;
}


function load_customstages_default_sprites() {
    if (!variable_global_exists("customstages_default_icon")) {
        var _default_icon_path = "modmanager/mods/custom_stage_loader/default_icon.png"
        global.customstages_default_icon = sprite_add(_default_icon_path, 1, 0, 0, 0, 0);
        sprite_set_offset(global.customstages_default_icon, sprite_get_width(global.customstages_default_icon) / 2, sprite_get_height(global.customstages_default_icon) / 2);
    }
}

function load_customstages_stage_sprite(path)
{
    if (!variable_global_exists("customstages_sprites")) {
        global.customstages_sprites = [];
    }

    var _spr = sprite_add(path, 1, 0, 0, 0, 0);
    if (_spr != -1)
    {
        sprite_set_offset(_spr, sprite_get_width(_spr) / 2, sprite_get_height(_spr) / 2);
        array_push(global.customstages_sprites, _spr);
    }

    return _spr;
}

function unload_customstages_sprites()
{
    if (variable_global_exists("customstages_sprites")) {
        for (var _i = 0; _i < array_length(global.customstages_sprites); _i++)
        {
            if (sprite_exists(global.customstages_sprites[_i]))
            {
                sprite_delete(global.customstages_sprites[_i]);
            }
        }
        global.customstages_sprites = [];
    }
}

function cache_all_customstages_names()
{
    // Delete previous custom stages
    if (variable_global_exists("customstages_stages")) {
        ds_list_destroy(global.customstages_stages);
        global.customstages_stages = undefined;
    }
    
    // Cache new custom stages
    var _stages = ds_list_create();
    var _stage = file_find_first(working_directory + "modmanager/stages/*", fa_directory);

    while (_stage != "") {
        ds_list_add(_stages, _stage);
        _stage = file_find_next();
    }

    file_find_close();
    ds_list_sort(_stages, true); // sort alphabetically
    
    global.customstages_stages = _stages;
}

function get_custom_stage_name_by_zone_stage(stage)
{
    // Lazy way to get the stage the stage is based on
    return ds_list_find_value(global.customstages_stages, stage - 1000);
}

function get_stage_id_by_custom_stage_name(name)
{
    for (var i = 0; i < ds_list_size(global.customstages_stages); i++) {
        if (ds_list_find_value(global.customstages_stages, i) == name) {
            return 1000 + i;
        }
    }
    return -1;
}

function anim_stage_custom(_name)
{
    return [[[
        load_customstages_stage_sprite("modmanager/stages/" + _name + "/thumbnail.png"),
        0,
        [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, -168.9, -62.05, 0, 1]
    ]]];
}

/// END