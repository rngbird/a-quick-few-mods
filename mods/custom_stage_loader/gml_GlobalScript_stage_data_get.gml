/// PATCH

/// REPLACE
    switch (_r)
    {
/// CODE
    switch (_r)
    {
        default:
            // Custom lobbies are IDs less than 1000
            if (_r < 1000) break;

            load_customstages_default_sprites();

            var _stage_name = get_custom_stage_name_by_zone_stage(_r);
            
            _data.name = _stage_name;
            _data.sprite = load_customstages_stage_sprite("modmanager/stages/" + _stage_name + "/icon.png");
            _data.frame = 0;

            break;
/// END
