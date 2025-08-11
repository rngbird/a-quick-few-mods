/// PATCH

/// REPLACE
draw_sprite_ext(_data.sprite, _data.frame, x, y, scale, scale, 0, c_white, 1);
/// CODE
var _sprite = -1;

if (is_undefined(_data.sprite) || !sprite_exists(_data.sprite)) {
    load_customstages_default_sprites();
    if (variable_global_exists("customstages_default_icon") && sprite_exists(global.customstages_default_icon)) {
        _sprite = global.customstages_default_icon;
    }
}
else
{
    _sprite = _data.sprite;
}

if (sprite_exists(_sprite)) {
    draw_sprite_ext(_sprite, _data.frame, x, y, scale, scale, 0, c_white, 1);
}
/// END
