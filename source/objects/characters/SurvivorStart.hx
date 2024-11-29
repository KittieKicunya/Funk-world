package objects.characters;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.util.FlxTimer;

class SurvivorStart extends FlxSprite {
    private static inline final ACCELERATION:Int = 800;
	private static inline final DRAG:Int = 800;
	private static inline final GRAVITY:Int = 1400;
	private static inline final JUMP_FORCE:Int = -600;
	private static inline final WALK_SPEED:Int = 300;
	private static inline final RUN_SPEED:Int = 350;
	private static inline final FALLING_SPEED:Int = 800;

    public var direction:Int = 1;

    var plr:FlxSprite;

    public function new(?x:Float = 0, ?y:Float = 0)
        {
            super(x, y);
            drag.x = DRAG;
            acceleration.y = GRAVITY;
            maxVelocity.set(WALK_SPEED, FALLING_SPEED);
            
            antialiasing = ClientPrefs.data.antialiasing;
            frames = Paths.getSparrowAtlas('platformerCharacter/survivor_platformer');
            scale.set(0.7,0.7);
            animation.addByPrefix('idle', "idle", 24);
            animation.addByPrefix('walk', "walk", 24);
            animation.addByPrefix('jump', "jump", 24);
            animation.addByPrefix('lay', "laying", 24);
            animation.addByPrefix('startl', "goinlay", 24);
            animation.addByPrefix('crawl', "crawl", 24);
            animation.addByPrefix('fall', "fall", 24);
            animation.addByPrefix('jump', "jump", 24);
            animation.play('idle');
            updateHitbox();
        }



    override public function update(elapsed:Float)
        {
            move();
    
    
            super.update(elapsed);
        }

        private function move()
            {
                acceleration.x = 0;
        
                if (FlxG.keys.pressed.LEFT)
                {
                    flipX = true;
                    direction = -1;
                    acceleration.x -= ACCELERATION;
                    if (velocity.y == 0)
                        {
                            animation.play('walk');
                        }
                }
                else if (FlxG.keys.pressed.RIGHT)
                {
                    flipX = false;
                    direction = 1;
                    acceleration.x += ACCELERATION;
                    if (velocity.y == 0)
                    {
                        animation.play('walk');
                    }
                    
                }
                else
                {
                    if (!FlxG.keys.justPressed.SPACE && velocity.y == 0)
                    {
                        animation.play('idle');
                    }
                    
                }
        
                if (velocity.y == 0)
                {
                    if (FlxG.keys.justPressed.SPACE)
                    {
                        jump();
                    }
        
                    if (FlxG.keys.pressed.SHIFT)
                    {
                        maxVelocity.x = RUN_SPEED;
                    }
                    else
                    {
                        maxVelocity.x = WALK_SPEED;
                    }
                }
        
            }
        
            public function jump()
            {
                if (FlxG.keys.pressed.SPACE)
                {
                    velocity.y = JUMP_FORCE;
                    animation.play('jump');
                }
                else
                {
                    velocity.y = JUMP_FORCE / 2;
                    animation.play('fall');
                }
            }
}