package funkworldsettings;

class BaseSettingsMenu extends MusicBeatSubstate
{
    override function create() {
        var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.images("rwmmenu/backgrounds/01"))
        bg.antialiasing = true;
        add(bg);


        
    }
}