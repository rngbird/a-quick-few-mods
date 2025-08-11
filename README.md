# A Few Quick Mods

This is mod manager for A Few Quick Matches using [UMP](https://github.com/nhaar/UMP).

To get started, add this folder "modmanager" into the Steam game directory.

To add mods, you can add mods by adding a folder to the mod in the "mods" folder.

After you add all of the mods, run the file "run.bat" and it'll automatically replace the data.win file.

When you update the game, make sure to delete the "original_data.win" file in the folder "modmanager". Why? The original "data.win" is copied over to the "modmanager" folder when the modmanager is installed.

Check out UMP's documentation here: <https://github.com/nhaar/UMP/blob/main/guide/guide.md>

## Built-in mods

|Name|Link|
|--|--|
|Custom Stage Loader|[/mods/custom_stage_loader](https://github.com/rngbird/a-quick-few-mods/tree/main/mods/custom_stage_loader)|

## Custom Stage Loader

There is a built-in mod called "" in this mod manager.

This mod allows you to add rethemed stages.

In the file, you need to add a `icon.png` and `thumbnail.png` for the icon and thumbnail shown in the selection screen.

Also, add a `stage.obj` for the actual retehemed stage.

In order to choose which stage the stage is based off of, create a `config.json` file and set the file to be either one of these:

Tower:

```json
{
  "stage": "tower"
}
```

Woods:

```json
{
  "stage": "woods"
}
```

Arena:

```json
{
  "stage": "arena"
}
```

If this file is missing or has an invalid stage name, it will automatically default to the "arena" stage.

### Limitations with custom stages

- You cannot add or remove maps while you are at the map selection screen. You'll need to get out of the map selection and go back to it, in order for the map list to update.
- If you change stage thumbnails while you're in the map selection screen, you need to hover out and back on top of the stage icon, in order to see the changes.
- For multiplayer, both users need the map downloaded to view them. Also, it's based on the folder name as well. If they don't have the map or play on an unmodded version, they will see the original map.
- Replays won't show the custom map. It will show the original map.
