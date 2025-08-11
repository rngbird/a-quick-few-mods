# Custom Stage Loader

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

## Limitations with custom stages

- You cannot add or remove maps while you are at the map selection screen. You'll need to get out of the map selection and go back to it, in order for the map list to update.
- If you change stage thumbnails while you're in the map selection screen, you need to hover out and back on top of the stage icon, in order to see the changes.
- For multiplayer, both users need the map downloaded to view them. Also, it's based on the folder name as well. If they don't have the map or play on an unmodded version, they will see the original map.
- Do not edit `stage.json` during a match or else problems may occur with replays.
