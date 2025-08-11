/// PATCH

/// APPEND

cache_all_customstages_names();

for (var i = 0; i < ds_list_size(global.customstages_stages); i++)
{
    var _x = 304 + (i mod 3) * (176 + 8);
    var _y = 544 + (floor(i / 3) + 1) * (256 + 20);

    var _zone = instance_create_layer(_x, _y, "Stage_Zones", obj_sss_zone);
    _zone._name = ds_list_find_value(global.customstages_stages, i);

    // The custom stage IDs will start from 1000 and go on from there.
    // The zone stage IDs are just supposed to be room IDs.
    // Zone stage ids: 29 = tower, 25 = woods, 30 = arena
    _zone.stage = 1000 + i;

    with (_zone)
    {
        var _name = self._name;
        hover_anim = function() { return anim_stage_custom(self._name); };
    }
}

// Move the main 3 stages up by 120 pixels
if (ds_list_size(global.customstages_stages) != 0) {
    with (all)
    {
        if (layer_get_id("Stage_Zones") == layer)
        {
            y -= 120 * (ceil(i / 3));
        }
    }
}

/// END
