package states;

import states.PlayState;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.graphics.FlxGraphic;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup.FlxTypedGroup;

import objects.MenuItem;
import objects.MenuCharacter;

import options.GameplayChangersSubstate;
import substates.ResetScoreSubState;

import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.geom.Matrix;

class SelectStorylineState extends MusicBeatState
{

    public static var weekCompleted:Map<String, Bool> = new Map<String, Bool>();

    private static var curWeek:Int = 0;

    public var bgbf:FlxSprite;
    public var karma:FlxSprite;
    public var sambf:FlxSprite;
    public var gbf:FlxSprite;
    public var fgbf:FlxSprite;

    public var bgsurv:FlxSprite;
    public var wat:FlxSprite;
    public var grasss:FlxSprite;
    public var samsurv:FlxSprite;
    public var gsurv:FlxSprite;
    public var fgsurv:FlxSprite;

    public var playButton:FlxSprite;


    public var bf:FlxTypedGroup<FlxSprite>;
    public var surv:FlxTypedGroup<FlxSprite>;

    public var CharacterName:FlxText;
    public var desc:FlxText;

    private var nextButton:FlxSprite;
    private var backButton:FlxSprite;


    public var camScroll:FlxSprite;

    public var canScroll:Bool = true;

    public var weekCount:Int = 1;
    var curDifficulty:Int = -1;

    public var selectedWeek:Bool = false;

    var loadedWeeks:Array<WeekData> = [];

    var stopspamming:Bool = false;

    
	override function create() 
	{

        Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

        PlayState.isStoryMode = true;
        WeekData.reloadWeekFiles(true);
		if(curWeek >= WeekData.weeksList.length) curWeek = 0;
        for (i in 0...WeekData.weeksList.length)
        {
            var weekFile:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
        }

        var leWeek:WeekData = loadedWeeks[curWeek];
        WeekData.setDirectoryFromWeek(loadedWeeks[0]);

        DiscordClient.changePresence("Selecting Storyline", null);

        var num:Int = 0;
		for (i in 0...WeekData.weeksList.length)
		{
			var weekFile:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			var isLocked:Bool = weekIsLocked(WeekData.weeksList[i]);
			if(!isLocked || !weekFile.hiddenUntilUnlocked)
			{
				loadedWeeks.push(weekFile);
				WeekData.setDirectoryFromWeek(weekFile);
				if (isLocked)
				{
                    
				}
				num++;
			}
		}
        
		

        bf = new FlxTypedGroup<FlxSprite>();
        surv = new FlxTypedGroup<FlxSprite>();


		bgbf = new FlxSprite(0, -60).loadGraphic(Paths.image('selectStoryline/bf/bg'));
        bgbf.scale.set(0.6, 0.6);
        bgbf.updateHitbox();
        bgbf.screenCenter();
        bgbf.antialiasing = true;
        bgbf.scrollFactor.set(1.0, 1.0);
        bf.add(bgbf);

        karma = new FlxSprite(0, -60).loadGraphic(Paths.image('selectStoryline/bf/karma'));
        karma.scale.set(0.6, 0.6);
        karma.updateHitbox();
        karma.screenCenter();
        karma.antialiasing = true;
        karma.scrollFactor.set(1.0, 1.0);
        bf.add(karma);

        sambf = new FlxSprite(0, -60).loadGraphic(Paths.image('selectStoryline/bf/bf'));
        sambf.scale.set(0.6, 0.6);
        sambf.updateHitbox();
        sambf.screenCenter();
        sambf.antialiasing = true;
        sambf.scrollFactor.set(1.0, 1.0);
        bf.add(sambf);

        gbf = new FlxSprite(0, -60).loadGraphic(Paths.image('selectStoryline/bf/grass'));
        gbf.scale.set(0.6, 0.6);
        gbf.updateHitbox();
        gbf.screenCenter();
        gbf.antialiasing = true;
        gbf.scrollFactor.set(1.0, 1.0);
        bf.add(gbf);

        fgbf = new FlxSprite(0, -60).loadGraphic(Paths.image('selectStoryline/bf/lines'));
        fgbf.scale.set(0.6, 0.6);
        fgbf.updateHitbox();
        fgbf.screenCenter();
        fgbf.antialiasing = true;
        fgbf.scrollFactor.set(1.0, 1.0);
        bf.add(fgbf);

        bgsurv = new FlxSprite(1291, -125).loadGraphic(Paths.image('selectStoryline/Surviror/bg'));
        bgsurv.updateHitbox();
        bgsurv.antialiasing = true;
        bgsurv.scrollFactor.set(1.0, 1.0);
        surv.add(bgsurv);

        wat = new FlxSprite(1357, 22).loadGraphic(Paths.image('selectStoryline/Surviror/haze'));
        wat.updateHitbox();
        wat.antialiasing = true;
        wat.scrollFactor.set(1.0, 1.0);
        surv.add(wat);

        grasss = new FlxSprite(2001, 230).loadGraphic(Paths.image('selectStoryline/Surviror/bkplants'));
        grasss.updateHitbox();
        grasss.antialiasing = true;
        grasss.scrollFactor.set(1.0, 1.0);
        //surv.add(grasss);

        samsurv = new FlxSprite(1501, 87).loadGraphic(Paths.image('selectStoryline/Surviror/slugcat'));
        samsurv.updateHitbox();
        samsurv.antialiasing = true;
        samsurv.scrollFactor.set(1.0, 1.0);
        surv.add(samsurv);

        gsurv = new FlxSprite(1319, 30).loadGraphic(Paths.image('selectStoryline/Surviror/grass'));
        gsurv.updateHitbox();
        gsurv.antialiasing = true;
        gsurv.scrollFactor.set(1.0, 1.0);
        surv.add(gsurv);

        fgsurv = new FlxSprite(4000, -68).loadGraphic(Paths.image('selectStoryline/Surviror/vines'));
        fgsurv.updateHitbox();
        fgsurv.antialiasing = true;
        fgsurv.scrollFactor.set(1.0, 1.0);
        surv.add(fgsurv);

        add(bf);
        add(surv);

        playButton = new FlxSprite(445, 612).loadGraphic(Paths.image('selectStoryline/buttonPlay'));
        playButton.scale.set(0.6, 0.6);
        playButton.updateHitbox();
        playButton.antialiasing = false;
        playButton.scrollFactor.set(0.0, 0.0);
        playButton.screenCenter(X);
        add(playButton);

        CharacterName = new FlxText(439,458);
        CharacterName.text = "Boyfriend";
        CharacterName.color = FlxColor.WHITE;
        CharacterName.size = 64;
        CharacterName.alignment = FlxTextAlign.CENTER;
        CharacterName.scrollFactor.set(0.0, 0.0);
        add(CharacterName);

        desc = new FlxText(223,548);
        desc.text = "Slugcat who is not part of this world but is also looking for a way to find peace,
 his strength is singing, his enemies can't kill him unless they win him in a rap battle ";
        desc.color = FlxColor.WHITE;
        desc.size = 16;
        desc.alignment = FlxTextAlign.CENTER;
        desc.screenCenter(X);
        desc.scrollFactor.set(0.0, 0.0);
        add(desc);
        
        nextButton = new FlxSprite(1180, 248);
        nextButton.makeGraphic(100, 100, FlxColor.WHITE);
        nextButton.scrollFactor.set(0.0, 0.0);
        add(nextButton);

        backButton = new FlxSprite(0, 248);
        backButton.makeGraphic(100, 100, FlxColor.WHITE);
        backButton.scrollFactor.set(0.0, 0.0);
        add(backButton);

        camScroll = new FlxSprite(613, 345);
        camScroll.makeGraphic(29, 29, FlxColor.WHITE);
        add(camScroll);

        super.create();
	}

	override public function update(elapsed:Float):Void {

        FlxG.camera.follow(camScroll, FlxCameraFollowStyle.LOCKON);

        if (FlxG.mouse.justReleased && backButton.overlapsPoint(FlxG.mouse.getScreenPosition()) && canScroll)
        {
            weekCount--;
            changeScroll();
        }

        if (FlxG.mouse.justReleased && nextButton.overlapsPoint(FlxG.mouse.getScreenPosition()) && canScroll)
        {
            weekCount++;
            changeScroll();
        }

        if (FlxG.mouse.justReleased && playButton.overlapsPoint(FlxG.mouse.getScreenPosition()) && canScroll)
        {
            var selectedWeek:Bool = false;
            if (weekCount == 1)
            {
                selectWeek();
            }
        }

        
        var mouseX:Float = FlxG.mouse.screenX;
        var mouseY:Float = FlxG.mouse.screenY;

        
        var bgbfP:Float = 0.01;
        var karmabfP:Float = 0.02;
        var bfP:Float = 0.03;
        var gbfP:Float = 0.04;
        var fbfP:Float = 0.05;

        bgbf.x = (FlxG.width - bgbf.width) / 2 + (mouseX - FlxG.width / 2) * bgbfP;
        bgbf.y = (FlxG.height - bgbf.height) / 2 + (mouseY - FlxG.height / 2) * bgbfP - 60;
        karma.x = (FlxG.width - bgbf.width) / 2 + (mouseX - FlxG.width / 2) * karmabfP;
        karma.y = (FlxG.height - bgbf.height) / 2 + (mouseY - FlxG.height / 2) * karmabfP - 60;
        sambf.x = (FlxG.width - bgbf.width) / 2 + (mouseX - FlxG.width / 2) * bfP;
        sambf.y = (FlxG.height - bgbf.height) / 2 + (mouseY - FlxG.height / 2) * bfP - 60;
        gbf.x = (FlxG.width - bgbf.width) / 2 + (mouseX - FlxG.width / 2) * gbfP;
        gbf.y = (FlxG.height - bgbf.height) / 2 + (mouseY - FlxG.height / 2) * gbfP - 60;
        fgbf.x = (FlxG.width - bgbf.width) / 2 + (mouseX - FlxG.width / 2) * fbfP;
        fgbf.y = (FlxG.height - bgbf.height) / 2 + (mouseY - FlxG.height / 2) * fbfP - 60;

        bgsurv.x = (FlxG.width - bgbf.width) / 2 + (mouseX - FlxG.width / 2) * bgbfP + 1561;
        bgsurv.y = (FlxG.height - bgbf.height) / 2 + (mouseY - FlxG.height / 2) * bgbfP - 125;
        wat.x = (FlxG.width - bgbf.width) / 2 + (mouseX - FlxG.width / 2) * karmabfP + 1627;
        wat.y = (FlxG.height - bgbf.height) / 2 + (mouseY - FlxG.height / 2) * karmabfP + 22;
        samsurv.x = (FlxG.width - bgbf.width) / 2 + (mouseX - FlxG.width / 2) * bfP + 1771;
        samsurv.y = (FlxG.height - bgbf.height) / 2 + (mouseY - FlxG.height / 2) * bfP + 87;
        gsurv.x = (FlxG.width - bgbf.width) / 2 + (mouseX - FlxG.width / 2) * gbfP + 1589;
        gsurv.y = (FlxG.height - bgbf.height) / 2 + (mouseY - FlxG.height / 2) * gbfP + 30;
        fgsurv.x = (FlxG.width - bgbf.width) / 2 + (mouseX - FlxG.width / 2) * fbfP + 1653;
        fgsurv.y = (FlxG.height - bgbf.height) / 2 + (mouseY - FlxG.height / 2) * fbfP - 68;

        

        super.update(elapsed);
    }

    private function scroll(_):Void
    {
        canScroll = true;
    }

    public function changeScroll()
    {
        if (weekCount == 1)
            {
                CharacterName.text = "Boyfriend";
                FlxTween.tween(camScroll, { x: 613 }, 2, { type: FlxTween.PERSIST, ease: FlxEase.sineInOut });
                desc.text = "Slugcat who is not part of this world but is also looking for a way to find peace,
 his strength is singing, his enemies can't kill him unless they win him in a rap battle ";
            }
            else if (weekCount == 2)
            {
                CharacterName.text = "Survivor";
                FlxTween.tween(camScroll, { x: 2177 }, 2, { type: FlxTween.PERSIST, ease: FlxEase.sineInOut });
                desc.text = "A nimble omnivore, both predator and prey. Lost in a harsh and indifferent land
 you must make your own way with wit and caution as your greatest assets";
            }
            else if (weekCount == 3)
            {
                CharacterName.text = "Boyfriend";
                weekCount = 1;
                FlxTween.tween(camScroll, { x: 613 }, 2, { type: FlxTween.PERSIST, ease: FlxEase.sineInOut });
                desc.text = "Slugcat who is not part of this world but is also looking for a way to find peace,
 his strength is singing, his enemies can't kill him unless they win him in a rap battle ";
            }
            else if (weekCount == 0)
                {
                    CharacterName.text = "Survivor";
                    weekCount = 2;
                    FlxTween.tween(camScroll, { x: 2177 }, 2, { type: FlxTween.PERSIST, ease: FlxEase.sineInOut });
                    desc.text = "A nimble omnivore, both predator and prey. Lost in a harsh and indifferent land
 you must make your own way with wit and caution as your greatest assets";

                }
    }

    function selectWeek()
        {
            if (!weekIsLocked(loadedWeeks[curWeek].fileName))
            {
                // We can't use Dynamic Array .copy() because that crashes HTML5, here's a workaround.
                var songArray:Array<String> = [];
                var leWeek:Array<Dynamic> = loadedWeeks[curWeek].songs;
                for (i in 0...leWeek.length) {
                    songArray.push(leWeek[i][0]);
                }
    
                // Nevermind that's stupid lmao
                try
                {
                    PlayState.storyPlaylist = songArray;
                    PlayState.isStoryMode = true;
                    selectedWeek = true;
        
                    PlayState.storyDifficulty = curDifficulty;
        
                    PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase(), PlayState.storyPlaylist[0].toLowerCase());
                    PlayState.campaignScore = 0;
                    PlayState.campaignMisses = 0;
                }
                catch(e:Dynamic)
                {
                    trace('ERROR! $e');
                    return;
                }
                
                if (stopspamming == false)
                {
                    FlxG.sound.play(Paths.sound('choose'));
                    stopspamming = true;
                }
    
                new FlxTimer().start(1, function(tmr:FlxTimer)
                {
                    LoadingState.loadAndSwitchState(new PlayState(), true);
                    FreeplayState.destroyFreeplayVocals();
                });
                
                #if (MODS_ALLOWED && DISCORD_ALLOWED)
                DiscordClient.loadModRPC();
                #end
            }
            else FlxG.sound.play(Paths.sound('cancelMenu'));
        }

        function weekIsLocked(name:String):Bool {
            var leWeek:WeekData = WeekData.weeksLoaded.get(name);
            return (!leWeek.startUnlocked && leWeek.weekBefore.length > 0 && (!weekCompleted.exists(leWeek.weekBefore) || !weekCompleted.get(leWeek.weekBefore)));
        }


}