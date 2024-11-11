package states.freeplaySongs;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import objects.HealthIcon;
import objects.MusicPlayer;

import substates.GameplayChangersSubstate;
import substates.ResetScoreSubState;

import flixel.math.FlxMath;

class StorySongState extends MusicBeatSubstate
{

    
    

    override function create() {
        
        
        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('rwmmenu/backgrounds/05'));
        bg.updateHitbox();
		bg.antialiasing = true;
        add(bg);

        var blackBG:FlxSprite = new FlxSprite(46, 0);
        blackBG.makeGraphic(391, 720, FlxColor.BLACK);
        blackBG.alpha = 0.55;
        add(blackBG);

        var white1:FlxSprite = new FlxSprite(42, 0);
        white1.makeGraphic(4, 720, FlxColor.WHITE);
        add(white1);

        var white2:FlxSprite = new FlxSprite(437, 0);
        white2.makeGraphic(4, 720, FlxColor.WHITE);
        add(white2);

        var stroka:FlxSprite = new FlxSprite();
        stroka.makeGraphic(1280, 720, FlxColor.BLACK);
        stroka.alpha = 0.55;
        add(stroka);

        super.create();
    }

    override function update(elapsed:Float) {
        super.update(elapsed);

        if (controls.BACK)
            {
                    MusicBeatState.switchState(new RWFreeplayState());
            }
    }
    

}

