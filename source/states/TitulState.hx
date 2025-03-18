package states;

import backend.WeekData;
import backend.Highscore;

import openfl.filters.ShaderFilter;
import shaders.RainShader;


import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import haxe.Json;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

import shaders.ColorSwap;
import openfl.filters.ShaderFilter;

import states.StoryMenuState;
import states.OutdatedState;
import states.MainMenuState;
import states.RvMMenuState;

class TitulState extends MusicBeatState 
{

    public static var logoPaths:Array<String> = 
	[
		'titleScreen/characters/1',
		'titleScreen/characters/2',
		'titleScreen/characters/3',
        'titleScreen/characters/4',
        'titleScreen/characters/5',
        'titleScreen/characters/6'
	];


    public static var initialized:Bool = false;

    public var creator:FlxSprite;
    public var modders:FlxSprite;
    public var kek:FlxSprite;
    public var logo:FlxSprite;

    public var canShowFirst:Bool = false;
    public var logotip:Bool = false;
    public var close:Bool = false;


    var alphaDir:Int = -1;
    var alpha:Float = 0;

    var rainShader:RainShader;


	override public function create():Void 
	{

        FlxG.save.bind('funkin', CoolUtil.getSavePath());

        ClientPrefs.loadPrefs();

        Highscore.load();
        

        if(!initialized)
            {
                if(FlxG.save.data != null && FlxG.save.data.fullscreen)
                {
                    FlxG.fullscreen = FlxG.save.data.fullscreen;
                    //trace('LOADED FULLSCREEN SETTING!!');
                }
                persistentUpdate = true;
                persistentDraw = true;
            }
    
            if (FlxG.save.data.weekCompleted != null)
            {
                StoryMenuState.weekCompleted = FlxG.save.data.weekCompleted;
            }

        var timer:FlxTimer = new FlxTimer();

        rainShader = new RainShader();
        rainShader.time = 0;
        rainShader.uIntensity.value = [1.0];

        //FlxG.camera.setFilters([new ShaderFilter(rainShader)]);
		

        creator = new FlxSprite().loadGraphic(Paths.image('titleScreen/logos/cult'));
        creator.scale.set(1,1);
        creator.updateHitbox();
        creator.setPosition(0,0);
        creator.screenCenter();
        creator.antialiasing = true;
        creator.alpha = 0;
        creator.visible = true;
        add(creator);

        modders = new FlxSprite().loadGraphic(Paths.image('titleScreen/logos/creator'));
        modders.scale.set(1,1);
        modders.updateHitbox();
        modders.setPosition(0,0);
        modders.screenCenter();
        modders.antialiasing = true;
        modders.alpha = 0;
        modders.visible = false;
        add(modders);

        logo = new FlxSprite(359,175).loadGraphic(randomLOGO());
		logo.updateHitbox();
        logo.screenCenter();
        logo.scale.set(0.7,0.7);
		logo.antialiasing = true;
        logo.alpha = 0;
        add(logo);
		


        kek = new FlxSprite().loadGraphic(Paths.image('wat'));
        kek.scale.set(1.4,1.4);
        kek.updateHitbox();
        kek.setPosition(0,0);
        kek.screenCenter();
        kek.antialiasing = true;
        kek.alpha = 0;
        add(kek);

        if(FlxG.sound.music == null) {
            FlxG.sound.playMusic(Paths.music('mainmenu'), 1);
        }

        FlxG.camera.fade(0xFF000000, 5, true, null, false);

        timer.start(2, bounce, 0);

    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        rainShader.time += elapsed;

        alpha += 0.02 * alphaDir;

        if (FlxG.keys.justPressed.ENTER)
        {
            if (!close)
            {
                close = true;
                FlxG.sound.play(Paths.sound('choose'), 0.7);
            }
        }
        
        if (close)
        {
            var timer:FlxTimer = new FlxTimer();
            FlxG.camera.fade(0xFF000000, 2, false, TP, false);
        }

		
		if (canShowFirst)
        {
            alphaDir = 1;
        }	

        if (!canShowFirst)
        {
           alphaDir = -1;
        }	
		creator.alpha = alpha;
        modders.alpha = alpha;

        if (FlxG.keys.justPressed.SEVEN)
        {
            kek.alpha = 1;
            FlxG.sound.play(Paths.sound('cheat'), 0.7);
        }


            kek.alpha += 0.02 * -1;
            
                

                if (logo.alpha == 1)
                {
                    logo.alpha = 0.9;
                }

                if (logotip)
                {
                    logo.alpha += 0.01;
                }
            


    }

    

    private function bounce(_):Void
    {
        var timer:FlxTimer = new FlxTimer();
        canShowFirst = true;
        timer.start(4, creend, 0);
    }

    private function creend(_):Void
    {
        var timer:FlxTimer = new FlxTimer();
        canShowFirst = false;
        timer.start(4, makers, 0);
    }

    private function makers(_):Void
        {
            creator.visible = false;
            modders.visible = true;
            var timer:FlxTimer = new FlxTimer();
            canShowFirst = true;
            timer.start(4, endkers, 0);
        }
    
        private function endkers(_):Void
        {
            var timer:FlxTimer = new FlxTimer();
            canShowFirst = false;
            timer.start(3, playlogo, 0);
        }

        private function playlogo(_):Void
        {
            logotip = true;  
        }

        public function TP() 
        {
            creator.kill();
            modders.kill();
            logo.kill();
            MusicBeatState.switchState(new RvMMenuState());    
        }

        public static function randomLOGO()
        {
            var chance:Int = FlxG.random.int(0, logoPaths.length - 1);
            return Paths.image(logoPaths[chance]);
        }

        

}
