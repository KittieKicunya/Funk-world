package states.locations;

import objects.characters.SurvivorStart;

import states.PlayState;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.display.FlxTiledSprite;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

import flixel.util.FlxTimer;



import flixel.input.keyboard.FlxKey;


class OutskirtsState extends MusicBeatState {

    public var player(default, null):FlxSprite;

    var locFloor:FlxTypedGroup<FlxSprite>;
    
    var location:FlxSprite;

    var floor:FlxSprite;
    var floor2:FlxSprite;
    var floor3:FlxSprite;
    var floor4:FlxSprite;
    var floor5:FlxSprite;
    var floor6:FlxSprite;
    var floor7:FlxSprite;
    var floor8:FlxSprite;
    var floor9:FlxSprite;
    var floor10:FlxSprite;
    var floor11:FlxSprite;
    var floor12:FlxSprite;

    public var tp:FlxSprite;

    public var blek:FlxSprite;
    public var guide:FlxSprite;

    var alphaDir:Int = -1;
    var alphaDir2:Int = -1;
    

    override function create() {

        super.create();

        FlxG.sound.playMusic(Paths.music('mainmenu'), 1);
        
        FlxG.camera.zoom = 1.0;

        locFloor = new FlxTypedGroup<FlxSprite>();
        add(locFloor);
        
        location = new FlxSprite(-310,-480).loadGraphic((Paths.image("platLocations/outskirts/bg")));
		location.updateHitbox();
		location.antialiasing = ClientPrefs.data.antialiasing;
        location.scrollFactor.set(1.0, 1.0);
        add(location);

        player = new SurvivorStart(50, 500);
        add(player);

        guide = new FlxSprite(369, 17).loadGraphic((Paths.image("guide")));
        guide.antialiasing = false;
        guide.scrollFactor.set(1.0, 1.0);
        add(guide);

        tp = new FlxSprite(1174,514).makeGraphic(81, 135, FlxColor.WHITE);
		tp.updateHitbox();
        tp.scrollFactor.set(1.0, 1.0);
        add(tp);

        
        floor = new FlxSprite(-321,649).makeGraphic(1900, 178, FlxColor.WHITE);
		floor.updateHitbox();
		floor.antialiasing = ClientPrefs.data.antialiasing;
        floor.scrollFactor.set(1.0, 1.0);
        floor.alpha = 0;
        locFloor.add(floor);

        floor2 = new FlxSprite(275,593).makeGraphic(60, 18, FlxColor.WHITE);
		floor2.updateHitbox();
		floor2.antialiasing = ClientPrefs.data.antialiasing;
        floor2.scrollFactor.set(1.0, 1.0);
        floor2.alpha = 0;
        locFloor.add(floor2);

        floor3 = new FlxSprite(435,497).makeGraphic(357, 141, FlxColor.WHITE);
		floor3.updateHitbox();
		floor3.antialiasing = ClientPrefs.data.antialiasing;
        floor3.scrollFactor.set(1.0, 1.0);
        floor3.alpha = 0;
        locFloor.add(floor3);

        floor4 = new FlxSprite(463,457).makeGraphic(257, 22, FlxColor.WHITE);
		floor4.updateHitbox();
		floor4.antialiasing = ClientPrefs.data.antialiasing;
        floor4.scrollFactor.set(1.0, 1.0);
        floor4.alpha = 0;
        locFloor.add(floor4);
        
        floor5 = new FlxSprite(917,360).makeGraphic(81, 16, FlxColor.WHITE);
		floor5.updateHitbox();
		floor5.antialiasing = ClientPrefs.data.antialiasing;
        floor5.scrollFactor.set(1.0, 1.0);
        floor5.alpha = 0;
        locFloor.add(floor5);

        floor6 = new FlxSprite(234,360).makeGraphic(81, 16, FlxColor.WHITE);
		floor6.updateHitbox();
		floor6.antialiasing = ClientPrefs.data.antialiasing;
        floor6.scrollFactor.set(1.0, 1.0);
        floor6.alpha = 0;
        locFloor.add(floor6);

        floor11 = new FlxSprite(1033,77).makeGraphic(99, 379, FlxColor.WHITE);
		floor11.updateHitbox();
		floor11.antialiasing = ClientPrefs.data.antialiasing;
        floor11.scrollFactor.set(1.0, 1.0);
        floor11.alpha = 0;
        locFloor.add(floor11);

        floor7 = new FlxSprite(28,118).makeGraphic(168, 379, FlxColor.WHITE);
		floor7.updateHitbox();
		floor7.antialiasing = ClientPrefs.data.antialiasing;
        floor7.scrollFactor.set(1.0, 1.0);
        floor7.alpha = 0;
        locFloor.add(floor7);

        floor8 = new FlxSprite(-272,118).makeGraphic(253, 120, FlxColor.WHITE);
		floor8.updateHitbox();
		floor8.antialiasing = ClientPrefs.data.antialiasing;
        floor8.scrollFactor.set(1.0, 1.0);
        floor8.alpha = 0;
        locFloor.add(floor8);

        floor9 = new FlxSprite(869,57).makeGraphic(164, 41, FlxColor.WHITE);
		floor9.updateHitbox();
		floor9.antialiasing = ClientPrefs.data.antialiasing;
        floor9.scrollFactor.set(1.0, 1.0);
        floor9.alpha = 0;
        locFloor.add(floor9);

        floor10 = new FlxSprite(193,77).makeGraphic(164, 41, FlxColor.WHITE);
		floor10.updateHitbox();
		floor10.antialiasing = ClientPrefs.data.antialiasing;
        floor10.scrollFactor.set(1.0, 1.0);
        floor10.alpha = 0;
        locFloor.add(floor10);

        floor12 = new FlxSprite(1155,135).makeGraphic(257, 379, FlxColor.WHITE);
		floor12.updateHitbox();
		floor12.antialiasing = ClientPrefs.data.antialiasing;
        floor12.scrollFactor.set(1.0, 1.0);
        floor12.alpha = 0;
        locFloor.add(floor12);

        blek = new FlxSprite(0, 0).makeGraphic(1280, 720, FlxColor.BLACK);
        blek.scrollFactor.set(0.0, 0.0);
        add(blek);

        floor.immovable = true;
        floor2.immovable = true;
        floor3.immovable = true;
        floor4.immovable = true;
        floor5.immovable = true;
        floor6.immovable = true;
        floor7.immovable = true;
        floor8.immovable = true;
        floor9.immovable = true;
        floor10.immovable = true;
        floor11.immovable = true;
        floor12.immovable = true;

        
        var timer:FlxTimer = new FlxTimer();
		timer.start(3, showGuide, 1);

    }



        override public function update(elapsed:Float):Void {
            super.update(elapsed);

            blek.alpha += 0.02 * alphaDir;

            FlxG.collide(player, floor);
            FlxG.collide(player, floor2);
            FlxG.collide(player, floor3);
            FlxG.collide(player, floor4);
            FlxG.collide(player, floor5);
            FlxG.collide(player, floor6);
            FlxG.collide(player, floor7);
            FlxG.collide(player, floor8);
            FlxG.collide(player, floor9);
            FlxG.collide(player, floor10);
            FlxG.collide(player, floor11);
            FlxG.collide(player, floor12);

            guide.alpha += 0.02 * alphaDir2;


            if (guide.alpha < 0)
            {
                guide.alpha == 0;
            }


            if (FlxG.overlap(player, tp, onCollision)) {
                PlayState.isStoryMode = false;
                PlayState.SONG = Song.loadFromJson('survivorship', 'survivorship');
                LoadingState.loadAndSwitchState(new PlayState());
            }
            
        }

        private function showGuide(_):Void {
            alphaDir2 = 1;
            var timer2:FlxTimer = new FlxTimer();
		    timer2.start(5, hideGuide, 1);
        }

        private function hideGuide(_):Void {
            alphaDir2 = -1;
        }

        function onCollision(obj1:FlxSprite, obj2:FlxSprite):Void {
                
        }

        

}