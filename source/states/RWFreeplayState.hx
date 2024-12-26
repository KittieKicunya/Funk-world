package states;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import objects.HealthIcon;
import objects.MusicPlayer;

import states.freeplaySongs.StorySongState;

import substates.GameplayChangersSubstate;
import substates.ResetScoreSubState;

import flixel.math.FlxMath;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.graphics.FlxGraphic;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup.FlxTypedGroup;

class RWFreeplayState extends MusicBeatState
{

    public var catName:FlxText;
    public var desc:FlxText;

    public var buttonRIGHT:FlxSprite;
    public var buttonLEFT:FlxSprite;

    public var categ1:FlxSprite;
    public var categ2:FlxSprite;
    public var categ3:FlxSprite;

    public var camScroll:FlxSprite;

    public var categoryCount:Int = 0;
    
    override function create() {

        #if desktop
		DiscordClient.changePresence("Choosing freeplay Category", null);
		#end
        
        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('rwmmenu/backgrounds/05'));
        bg.updateHitbox();
		bg.antialiasing = true;
        bg.scrollFactor.set(0.0, 0.0);
        add(bg);

        var blackBG:FlxSprite = new FlxSprite();
        blackBG.makeGraphic(1280, 720, FlxColor.BLACK);
        blackBG.alpha = 0.55;
        blackBG.scrollFactor.set(0.0, 0.0);
        add(blackBG);

        categ1 = new FlxSprite(340, 105).loadGraphic(Paths.image('freeplayCategories/story_cat'));
        categ1.updateHitbox();
		categ1.antialiasing = true;
        categ1.scrollFactor.set(1.0, 1.0);
        add(categ1);

        categ2 = new FlxSprite(1340, 105).loadGraphic(Paths.image('freeplayCategories/free_cat'));
        categ2.updateHitbox();
		categ2.antialiasing = true;
        categ2.scrollFactor.set(1.0, 1.0);
        add(categ2);

        categ3 = new FlxSprite(2340, 105).loadGraphic(Paths.image('freeplayCategories/cover_cat'));
        categ3.updateHitbox();
		categ3.antialiasing = true;
        categ3.scrollFactor.set(1.0, 1.0);
        add(categ3);

        buttonRIGHT = new FlxSprite(1130, 285).loadGraphic(Paths.image('selectStoryline/button'));
        buttonRIGHT.updateHitbox();
        buttonRIGHT.scrollFactor.set(0.0, 0.0);
		buttonRIGHT.antialiasing = true;
        add(buttonRIGHT);

        buttonLEFT = new FlxSprite(0, 285).loadGraphic(Paths.image('selectStoryline/buttonreverse'));
        buttonLEFT.updateHitbox();
		buttonLEFT.antialiasing = true;
        buttonLEFT.scrollFactor.set(0.0, 0.0);
        add(buttonLEFT);

        catName = new FlxText(544,476);
        catName.font = "fonts/Rodondo.otf";
        catName.text = "CAMPAIGN SONGS";
        catName.color = FlxColor.WHITE;
        catName.size = 64;
        catName.alignment = FlxTextAlign.CENTER;
        catName.screenCenter(X);
        catName.scrollFactor.set(0.0, 0.0);
        add(catName);

        desc = new FlxText(223,588);
        desc.font = "fonts/rain-world-menu.ttf";
        desc.text = "Here are the songs that were used in the campaign ";
        desc.color = FlxColor.WHITE;
        desc.size = 20;
        desc.alignment = FlxTextAlign.CENTER;
        desc.screenCenter(X);
        desc.scrollFactor.set(0.0, 0.0);
        add(desc);

        var sideText:FlxText = new FlxText(223,696);
        sideText.font = "fonts/rain-world-menu.ttf";
        sideText.text = "Press ENTER to choose category";
        sideText.color = FlxColor.WHITE;
        sideText.size = 20;
        sideText.alignment = FlxTextAlign.CENTER;
        sideText.screenCenter(X);
        sideText.scrollFactor.set(0.0, 0.0);
        add(sideText);

        

        camScroll = new FlxSprite(613, 345);
        camScroll.makeGraphic(29, 29, FlxColor.WHITE);
        camScroll.alpha = 0;
        add(camScroll);


        super.create();
        
    }

    override public function update(elapsed:Float):Void {

        super.update(elapsed);

        if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE)
            {
                UseCategory();
            }

        FlxG.camera.follow(camScroll, FlxCameraFollowStyle.LOCKON);

        if (categoryCount == 3)
        {
            categoryCount = 0;
            
        }
        if (categoryCount == -1)
            {
                categoryCount = 2;
            }

        if (FlxG.mouse.justReleased && buttonLEFT.overlapsPoint(FlxG.mouse.getScreenPosition()))
        {
            categoryCount--;
            changeCategory();
        }

        if (FlxG.mouse.justReleased && buttonRIGHT.overlapsPoint(FlxG.mouse.getScreenPosition()))
            {
                categoryCount++;
                changeCategory();
            }
    }

    public function changeCategory() {
        if (categoryCount == 0)
        {
            FlxTween.tween(camScroll, { x: 630 }, 1, { type: FlxTween.PERSIST, ease: FlxEase.sineInOut });
            catName.text = "CAMPAIGN SONGS";
            desc.text = "Here are the songs that were used in the campaign ";
            catName.alignment = FlxTextAlign.CENTER;
        catName.screenCenter(X);
        }
        else if (categoryCount == 1)
            {
                FlxTween.tween(camScroll, { x: 1630 }, 1, { type: FlxTween.PERSIST, ease: FlxEase.sineInOut });
                catName.text = "FREEPLAY SONGS";
            desc.text = "Third-party songs, may include non-campaign songs
as well as joke songs";
catName.alignment = FlxTextAlign.CENTER;
        catName.screenCenter(X);
            }
            else if (categoryCount == 2)
                {
                    FlxTween.tween(camScroll, { x: 2630 }, 1, { type: FlxTween.PERSIST, ease: FlxEase.sineInOut });
                    catName.text = "  COVER SONGS";
            desc.text = "Are not official songs, just covers from other fnf mods, 
            and so he doesn't have much of anything special";
catName.alignment = FlxTextAlign.CENTER;
        catName.screenCenter(X);
                }
    }

    public function UseCategory() {

        if(categoryCount == 0)
        {
            FreeplayState.category = "Campaign";
            MusicBeatState.switchState(new FreeplayState()); 
        }
        else if(categoryCount == 1)
        {
            FreeplayState.category = "Freeplay";
            MusicBeatState.switchState(new FreeplayState()); 
        }
        else if(categoryCount == 2)
        {
            FreeplayState.category = "Covers";
            MusicBeatState.switchState(new FreeplayState()); 
        }
                
    }
}