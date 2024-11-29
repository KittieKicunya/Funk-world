package states;

import states.PlayState;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

import flixel.input.keyboard.FlxKey;

class RvMMenuState extends MusicBeatState {
    
    
    var menuBG:FlxSprite;
    var logo:FlxSprite;

    var playbutton:FlxSprite;
    var songs:FlxSprite;
    var sett:FlxSprite;
    var c:FlxSprite;



    private var isMouseOver:Bool = false;

    public static var bgPaths:Array<String> = 
	[
		'rwmmenu/backgrounds/01',
        'rwmmenu/backgrounds/01',
        'rwmmenu/backgrounds/01',
        'rwmmenu/backgrounds/01',
        'rwmmenu/backgrounds/02',
        'rwmmenu/backgrounds/02',
        'rwmmenu/backgrounds/03',
        'rwmmenu/backgrounds/03',
        'rwmmenu/backgrounds/03',
        'rwmmenu/backgrounds/03',
        'rwmmenu/backgrounds/04',
        'rwmmenu/backgrounds/04',
        'rwmmenu/backgrounds/04',
        'rwmmenu/backgrounds/04',
        'rwmmenu/backgrounds/04',
        'rwmmenu/backgrounds/05',
        'rwmmenu/backgrounds/05',
        'rwmmenu/backgrounds/05',
        'rwmmenu/backgrounds/05',
        'rwmmenu/backgrounds/05',
        'rwmmenu/backgrounds/05',
        'rwmmenu/backgrounds/05',
        'rwmmenu/backgrounds/06',
        'rwmmenu/backgrounds/06',
        'rwmmenu/backgrounds/06',
        'rwmmenu/backgrounds/06',
        'rwmmenu/backgrounds/06',
        'rwmmenu/backgrounds/creeep',
        'rwmmenu/backgrounds/pashalka1',
        'rwmmenu/backgrounds/uno',	
	];


    private var letters:String = '';


    override function create() {


        #if desktop
		DiscordClient.changePresence("In main menu", null);
		#end

        menuBG = new FlxSprite(0,0).loadGraphic(randomBG());
		menuBG.updateHitbox();
		menuBG.antialiasing = true;
        add(menuBG);

        logo = new FlxSprite(300, -35).loadGraphic(Paths.image('GameLogo'));
		logo.updateHitbox();
		logo.antialiasing = true;
        add(logo);

        FlxTween.tween(logo, {y: -24}, 3,
			{type: FlxTweenType.PINGPONG, ease: FlxEase.sineInOut});

        playbutton = new FlxSprite(490, 226);
        playbutton.antialiasing = ClientPrefs.data.antialiasing;
        playbutton.frames = Paths.getSparrowAtlas('rwmmenu/buttons/play_button');
        playbutton.animation.addByPrefix('idle', "Idle", 24);
        playbutton.animation.addByPrefix('loopin', "Loop", 24);
        playbutton.animation.play('idle');
		add(playbutton);
        playbutton.updateHitbox();
        playbutton.screenCenter(X);

        songs = new FlxSprite(490, 348);
        songs.antialiasing = ClientPrefs.data.antialiasing;
        songs.frames = Paths.getSparrowAtlas('rwmmenu/buttons/songs_button');
        songs.animation.addByPrefix('idle', "idle", 24);
        songs.animation.addByPrefix('loopin', "loop", 24);
        songs.animation.play('idle');
		add(songs);
        songs.updateHitbox();
        songs.screenCenter(X);

        sett = new FlxSprite(490, 592);
        sett.antialiasing = ClientPrefs.data.antialiasing;
        sett.frames = Paths.getSparrowAtlas('rwmmenu/buttons/options_button');
        sett.animation.addByPrefix('idle', "idle", 24);
        sett.animation.addByPrefix('loopin', "loop", 24);
        sett.animation.play('idle');
		add(sett);
        sett.updateHitbox();
        sett.screenCenter(X);

        c = new FlxSprite(490, 472);
        c.antialiasing = ClientPrefs.data.antialiasing;
        c.frames = Paths.getSparrowAtlas('rwmmenu/buttons/credits_button');
        c.animation.addByPrefix('idle', "idle", 24);
        c.animation.addByPrefix('loopin', "loop", 24);
        c.animation.play('idle');
		add(c);
        c.updateHitbox();
        c.screenCenter(X);


        super.create();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);


        if (FlxG.keys.justPressed.S)
        {
            letters += "s";
            trace(letters);
        }

        if (FlxG.keys.justPressed.O)
            {
                letters += "o";
                trace(letters);
            }

            if (FlxG.keys.justPressed.F)
                {
                    letters += "f";
                    trace(letters);
                }
                if (FlxG.keys.justPressed.A)
                    {
                        letters += "a";
                        trace(letters);
                    }
                    if (FlxG.keys.justPressed.N)
                        {
                            letters += "n";
                            trace(letters);
                        }
                        if (FlxG.keys.justPressed.T)
                            {
                                letters += "t";
                                trace(letters);
                            }
                            if (FlxG.keys.justPressed.H)
                                {
                                    letters += "h";
                                    trace(letters);
                                }
                                if (FlxG.keys.justPressed.I)
                                    {
                                        letters += "i";
                                        trace(letters);
                                    }
                                    if (FlxG.keys.justPressed.E)
                                        {
                                            letters += "e";
                                            trace(letters);
                                        }
                                        if (FlxG.keys.justPressed.L)
                                            {
                                                letters += "l";
                                                trace(letters);
                                            }
                                        



         if (letters == 'sofanthiel')
         {
            PlayState.isStoryMode = false;
            PlayState.SONG = Song.loadFromJson('sofanthiel', 'sofanthiel');
            LoadingState.loadAndSwitchState(new PlayState());
        }
       




        if (FlxG.mouse.overlaps(playbutton))
        {
                    playbutton.animation.play('loopin');
                    if (FlxG.mouse.justReleased)
                    {
                        FlxG.sound.play(Paths.sound('choose'));
                        MusicBeatState.switchState(new SelectStorylineState());
                    }
                    
        }
        else
        {       
                    playbutton.animation.play('idle'); 
        }

        if (FlxG.mouse.overlaps(songs))
            {
                songs.animation.play('loopin');
                if (FlxG.mouse.justReleased)
                    {
                        FlxG.sound.play(Paths.sound('choose'));
                        MusicBeatState.switchState(new RWFreeplayState());
                    }
            }
            else
            {       
                songs.animation.play('idle'); 
            }

            if (FlxG.mouse.overlaps(sett))
                {
                    sett.animation.play('loopin');
                    if (FlxG.mouse.justReleased)
                        {
                            FlxG.sound.play(Paths.sound('choose'));
                            MusicBeatState.switchState(new OptionsState());
                        }
                }
                else
                {       
                    sett.animation.play('idle'); 
                }

                if (FlxG.mouse.overlaps(c))
                    {
                        c.animation.play('loopin');
                    }
                    else
                    {       
                        c.animation.play('idle'); 
                    }
        

        if (controls.BACK)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitulState());
			}
    }


    public static function randomBG()
    {
            var chance:Int = FlxG.random.int(0, bgPaths.length - 1);
            return Paths.image(bgPaths[chance]);
    }
    }
