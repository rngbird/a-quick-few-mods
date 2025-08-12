/// IMPORT

// I provided the whole file because I couldn't get REPLACE to work.
// Check lines 141 and 143. Those lines are the reasons why it errors on UMT, unless I add the brackets ("{" and "}").

if (engine().online_is_leader && !stage_selected)
{
    var _confirm = false;
    var _confirm_hold = 0;
    var _back = false;
    var _start = false;
    var _gx = 0;
    var _gy = 0;
    var _array = mis_devices_get_array();
    
    for (var i = 0; i < array_length(_array); i++)
    {
        var _id = array_get(_array, i);
        var _values = mis_device_stick_values(_id);
        
        if (_values.hold > 0)
        {
            _gx += _values.x;
            _gy += _values.y;
        }
        
        if (!_confirm)
            _confirm = mis_device_input(_id, UnknownEnum.Value_0);
        
        if (_confirm_hold == 0)
            _confirm_hold = mis_device_input(_id, UnknownEnum.Value_0, true);
        
        if (!_back)
            _back = mis_device_input(_id, UnknownEnum.Value_1);
        
        if (!_start)
            _start = mis_device_input(_id, UnknownEnum.Value_6);
    }
    
    var _x = ui_cursor_x(0);
    var _y = ui_cursor_y(0);
    var _dir = point_direction(0, 0, _gx, _gy);
    var _len = ui_cursor_speed_calculate(_gx, _gy, 16);
    _gx = lengthdir_x(_len, _dir);
    _gy = lengthdir_y(_len, _dir);
    ui_cursor_update(0, clamp(_x + _gx, marker_bounds.x + _gx, marker_bounds.x + marker_bounds.sprite_width), clamp(_y + _gy, marker_bounds.y + _gy, marker_bounds.y + marker_bounds.sprite_height), false, _confirm, _confirm_hold);
    inst = instance_position(ui_cursor_x(0), ui_cursor_y(0), obj_sss_zone);
    
    if (previous_inst != -4 && previous_inst != inst)
        previous_inst.onUnhover();
    
    if (inst != -4)
    {
        inst.selected_animation_time = 1;
        
        if (previous_inst != inst)
            inst.onHover();
        
        var _data = stage_data_get(inst.stage);
        stage_name_label.text = _data.name;
        
        if (_confirm || _start)
        {
            menu_sound_play(213);
            setting().match_stage = inst.stage;
            stage_selected = true;
        }
    }
    
    previous_inst = inst;
}
else
{
    layer_set_visible("UI_Above_Layer", true);
    layer_set_visible("Stage_Zones", false);
    layer_set_visible("Assets", false);
}

if (stage_selected)
{
    // var _overall_struct = 
    // {
    //     packet_type: "stage_data",
    //     stage: setting().match_stage
    // };

    // Custom server code below:
    var _sent_match_stage = setting().match_stage;
    var _overall_struct = 
    {
        packet_type: "stage_data",
        stage: _sent_match_stage,
    };

    if (_sent_match_stage >= 1000)
    {
        var _name = get_custom_stage_name_by_zone_stage(_sent_match_stage);
        var _config = get_custom_stage_config(_name);

        _overall_struct.stage = get_stage_config_to_room(_config);
        
        // csl stands for "custom stage loader", name = map name in folder
        _overall_struct.csl_name = _name;
    }
    // Custom server code above:

    buffer_reset(packet, false);
    buffer_write(packet, buffer_string, json_stringify(_overall_struct));
    buffer_resize(packet, buffer_tell(packet));
    
    for (var i = 0; i < array_length(engine().client_data); i++)
    {
        var _client = array_get(engine().client_data, i);
        var _location = array_get(_client, UnknownEnum.Value_2);
        var _connection_id = array_get(_client, UnknownEnum.Value_1);
        
        if (_location != UnknownEnum.Value_0)
        {
            ggmr_net_send_double(UnknownEnum.Value_19, packet, _connection_id);
            log("Sent a stage data packet to connection number ", _connection_id);
        }
    }
    
    online_sss_start();
    exit;
}

stage_select_timer--;

if ((stage_select_timer % 60) == 0)
{ // added line so it works
    (100140).text = "Starting match in " + string(max(stage_select_timer div 60, 0)) + " seconds...";
} // another added line so it works

if (stage_select_timer == 0)
{
    if (engine().online_is_leader && !stage_selected)
    {
        menu_sound_play(213);
        setting().match_stage = stage_choose_random();
        stage_selected = true;
        exit;
    }
}

if (stage_select_timer <= -90)
{
    send_to_error_room("Disconnected!", "The lobby host was too slow to choose a map.", 20);
    client_data_clear();
    player_data_clear();
    exit;
}

if ((stage_select_timer % 60) == 0)
{
    for (var i = 0; i < array_length(engine().player_data); i++)
    {
        var _player = array_get(engine().player_data, i);
        var _custom = array_get(_player, UnknownEnum.Value_9);
        
        if (_custom.location == UnknownEnum.Value_1)
        {
            if (ggmr_net_connection_silence(_custom.connection) > 5000)
            {
                send_to_error_room("Disconnected!", "Timed out from the lobby host.", 20);
                client_data_clear();
                player_data_clear();
                exit;
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_6 = 6,
    Value_9 = 9,
    Value_19 = 19
}
/// END
