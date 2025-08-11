/// PATCH

/// APPEND

cache_all_customstages_names();

for (var i = 0; i < ds_list_size(global.customstages_stages); i++)
{
    // Same as gml_RoomCC_rm_sss_0_PreCreate.gml, but the _x and _y's first number is different.
    var _x = 328 + (i mod 3) * (176 + 8);
    var _y = 424 + (floor(i / 3) + 1) * (256 + 20);

    var _zone = instance_create_layer(_x, _y, "Stage_Zones", obj_sss_zone);
    _zone._name = ds_list_find_value(global.customstages_stages, i);

    _zone.stage = 1000 + i;

    with (_zone)
    {
        var _name = self._name;
        hover_anim = function() { return anim_stage_custom(self._name); };
    }
}

if (ds_list_size(global.customstages_stages) != 0)
{
    with (all)
    {
        if (layer_get_id("Stage_Zones") == layer)
        {
            y -= 120 * (ceil(i / 3));
        }
    }
}

/// END
