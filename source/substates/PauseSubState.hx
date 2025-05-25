package substates;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import flixel.addons.transition.FlxTransitionableState;

import flixel.util.FlxStringUtil;

import states.PlayState;
import states.SelectStorylineState;
import states.FreeplayState;
import options.OptionsState;

class PauseSubState extends MusicBeatSubstate
{

	public static var songName:String = null;

	var res:FlxSprite;
	var exitGame:FlxSprite;
	var opt:FlxSprite;
	var restart:FlxSprite;

	var curChange:Int = 0;

	

	override function create() {

		var fade:FlxSprite = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
		fade.scale.set(FlxG.width, FlxG.height);
		fade.scrollFactor.set();
		fade.alpha = 0;
		fade.updateHitbox();
		fade.screenCenter();
        add(fade);

		var dark1:FlxSprite = new FlxSprite(0, 800).makeGraphic(FlxG.width, 54, FlxColor.BLACK);
		dark1.scrollFactor.set();
		dark1.updateHitbox();
        add(dark1);

		var dark2:FlxSprite = new FlxSprite(0, -60).makeGraphic(FlxG.width, 54, FlxColor.BLACK);
		dark2.scrollFactor.set();
		dark2.updateHitbox();
        add(dark2);

		var guide:FlxSprite = new FlxSprite(11, -27).loadGraphic(Paths.image('pauseMenu'));
		guide.scrollFactor.set();
		guide.updateHitbox();
		guide.alpha = 0;
        add(guide);

		exitGame = new FlxSprite(1119, 672).loadGraphic(Paths.image('PauseMenu/EXIT'));
		exitGame.scrollFactor.set();
		exitGame.antialiasing = false;
		exitGame.updateHitbox();
		exitGame.alpha = 0;
        add(exitGame);

		opt = new FlxSprite(964, 672).loadGraphic(Paths.image('PauseMenu/OPTIONS'));
		opt.scrollFactor.set();
		opt.antialiasing = false;
		opt.updateHitbox();
		opt.alpha = 0;
        add(opt);

		restart = new FlxSprite(805, 672).loadGraphic(Paths.image('PauseMenu/RESTART'));
		restart.scrollFactor.set();
		restart.antialiasing = false;
		restart.updateHitbox();
		restart.alpha = 0;
        add(restart);

		res = new FlxSprite(650, 672).loadGraphic(Paths.image('PauseMenu/RESUME'));
		res.scrollFactor.set();
		res.antialiasing = false;
		res.updateHitbox();
		res.alpha = 0;
        add(res);


		FlxTween.tween(fade, {alpha: 0.4}, 0.4,
			{ease: FlxEase.cubeOut});

		FlxTween.tween(dark1, {x: 0, y: 666}, 0.4,
			{ease: FlxEase.cubeOut});

		FlxTween.tween(dark2, {x: 0, y: 0}, 0.4,
			{ease: FlxEase.cubeOut});

			FlxTween.tween(guide, {alpha: 1}, 0.4,
				{ease: FlxEase.cubeOut});

				FlxTween.tween(exitGame, {alpha: 1.0}, 0.4,
					{ease: FlxEase.cubeOut});
					
					FlxTween.tween(opt, {alpha: 0.4}, 0.4,
						{ease: FlxEase.cubeOut});

						FlxTween.tween(restart, {alpha: 0.4}, 0.4,
							{ease: FlxEase.cubeOut});

							FlxTween.tween(res, {alpha: 0.4}, 0.4,
								{ease: FlxEase.cubeOut});
	

	
	

		
		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
	}

	override function update(elapsed:Float) {

		exitGame.updateHitbox();



				
		if (FlxG.keys.justPressed.LEFT)
			{
				curChange++;
			}

			if (FlxG.keys.justPressed.RIGHT)
				{
					curChange--;
				}

				if(curChange == 5)
				{
					curChange = 1;
				}

				if(curChange == 0)
					{
						curChange = 4;
						
					}

					if (curChange == 1)
					{
						exitGame.alpha = 1;
						res.alpha = 0.4;
						opt.alpha = 0.4;
					}

					if (curChange == 2)
					{
						exitGame.alpha = 0.4;
						opt.alpha = 1;
						restart.alpha = 0.4;
					}

					if (curChange == 3)
					{
						restart.alpha = 1;
						opt.alpha = 0.4;
						res.alpha = 0.4;
					}

					if (curChange == 4)
					{
						restart.alpha = 0.4;
						exitGame.alpha = 0.4;
						res.alpha = 1;	
					}

					if (FlxG.keys.justPressed.ENTER)
						{
							if (curChange == 1)
								{
									EndGame();
								}
								if (curChange == 3)
									{
										restartSong();
									}
								if (curChange == 4)
								{
									close();
								}
						}



				
				
		
	}

	public static function restartSong(noTrans:Bool = false)
		{
			PlayState.instance.paused = true; // For lua
			FlxG.sound.music.volume = 0;
			PlayState.instance.vocals.volume = 0;
	
			if(noTrans)
			{
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
			}
			MusicBeatState.resetState();
		}

		public static function EndGame() {
			#if DISCORD_ALLOWED DiscordClient.resetClientID(); #end
			PlayState.deathCounter = 0;
			PlayState.seenCutscene = false;

			
			if(PlayState.isStoryMode)
				MusicBeatState.switchState(new SelectStorylineState());
			else 
				MusicBeatState.switchState(new FreeplayState());

			FlxG.sound.playMusic(Paths.music('mainmenu'));
			PlayState.changedDifficulty = false;
			PlayState.chartingMode = false;
			FlxG.camera.followLerp = 0;
		}

		public static function Settings() {
			
		}
	}
