package substates;

import states.PlayState;


class ResetGameSubState extends MusicBeatSubstate
{

    var fade2:FlxSprite;

    var canPress:Bool = true;

    public static var karmaLevel:String = null;

    

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

        var gameOverTXT:FlxText = new FlxText(11, 672);
        gameOverTXT.text = "Game over - press ENTER to restart";
        gameOverTXT.font = Paths.font("rain-world-menu.ttf");
        gameOverTXT.alpha = 0;
        gameOverTXT.size = 36;
        gameOverTXT.scrollFactor.set();
        add(gameOverTXT);

        fade2 = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
		fade2.scale.set(FlxG.width, FlxG.height);
		fade2.scrollFactor.set();
		fade2.alpha = 0;
		fade2.updateHitbox();
		fade2.screenCenter();
        add(fade2);

        FlxTween.tween(fade, {alpha: 0.6}, 0.7,
			{ease: FlxEase.cubeOut});

		FlxTween.tween(dark1, {x: 0, y: 666}, 0.7,
			{ease: FlxEase.cubeOut});

		FlxTween.tween(dark2, {x: 0, y: 0}, 0.7,
			{ease: FlxEase.cubeOut});

            FlxTween.tween(gameOverTXT, {alpha: 1.0}, 0.7,
                {ease: FlxEase.cubeOut});

                cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
    }

    override function update(elapsed:Float) {
        if (FlxG.keys.justPressed.ENTER && canPress)
            {
                FlxTween.tween(fade2, {alpha: 1.0}, 0.7,
                    {ease: FlxEase.cubeOut});
                    var timer:FlxTimer = new FlxTimer();
		            timer.start(1.5, showPlrFata, 1);
                    canPress = false;
            }
    }


    function showPlrFata(_):Void
    {
        var timer:FlxTimer = new FlxTimer();

        var deed:FlxSprite = new FlxSprite(0, 70).loadGraphic(Paths.image('dreamScreens/gameOverScreen/gameOver'));
        deed.alpha = 0;
        add(deed);

        var txtScore:FlxText = new FlxText(-100, 24);
        txtScore.size = 96;
        txtScore.text = "GAME OVER";
        txtScore.font = "assets/fonts/Rodondo.otf";
        txtScore.alpha = 0;
        add(txtScore);

        FlxTween.tween(deed, {x: 0, y: 0}, 1.0,
			{ease: FlxEase.cubeOut});

        FlxTween.tween(deed, {alpha: 1.0}, 1.0,
            {ease: FlxEase.cubeOut});

            FlxTween.tween(txtScore, {x: 48, y: 24}, 1.0,
                {ease: FlxEase.cubeOut});
    
            FlxTween.tween(txtScore, {alpha: 1.0}, 1.0,
                {ease: FlxEase.cubeOut});
                timer.start(1.6, plrScore, 1);
            timer.start(1.6, songName, 1);

            
    }

    function songName(_):Void {
        var timer:FlxTimer = new FlxTimer();

        var txtScore:FlxText = new FlxText(48, 160);
        txtScore.size = 40;
        txtScore.text = "Song name: " + PauseSubState.songName;
        txtScore.font = "assets/fonts/rain-world-menu.ttf";
        txtScore.alpha = 0;
        add(txtScore);

        FlxTween.tween(txtScore, {x: 48, y: 148}, 1.0,
			{ease: FlxEase.cubeOut});

        FlxTween.tween(txtScore, {alpha: 1.0}, 1.0,
            {ease: FlxEase.cubeOut});
            timer.start(1.6, plrScore, 1);
    }

    function plrScore(_):Void {
        var timer:FlxTimer = new FlxTimer();

        var txtScore:FlxText = new FlxText(48, 240);
        txtScore.size = 36;
        txtScore.text = "Your score: " + PlayState.songScoreGM;
        txtScore.font = "assets/fonts/rain-world-menu.ttf";
        txtScore.alpha = 0;
        add(txtScore);

        FlxTween.tween(txtScore, {x: 48, y: 224}, 1.0,
			{ease: FlxEase.cubeOut});

        FlxTween.tween(txtScore, {alpha: 1.0}, 1.0,
            {ease: FlxEase.cubeOut});
            timer.start(1.6, plrMisses, 1);
    }

    function plrMisses(_):Void {
        var timer:FlxTimer = new FlxTimer();

        var txtScore:FlxText = new FlxText(48, 315);
        txtScore.size = 32;
        txtScore.text = "Your misses: " + PlayState.songMissesGM;
        txtScore.font = "assets/fonts/rain-world-menu.ttf";
        txtScore.alpha = 0;
        add(txtScore);

        FlxTween.tween(txtScore, {x: 48, y: 300}, 1.0,
			{ease: FlxEase.cubeOut});

        FlxTween.tween(txtScore, {alpha: 1.0}, 1.0,
            {ease: FlxEase.cubeOut});
            
            
            timer.start(1.6, plrTxtKarma, 1);
    }

    function plrTxtKarma(_):Void {
        var timer:FlxTimer = new FlxTimer();

        var txtScore:FlxText = new FlxText(48, 450);
        txtScore.size = 24;
        txtScore.text = "Karma got:";
        txtScore.font = "assets/fonts/rain-world-menu.ttf";
        txtScore.alpha = 0;
        add(txtScore);

        FlxTween.tween(txtScore, {x: 48, y: 435}, 1.0,
			{ease: FlxEase.cubeOut});

        FlxTween.tween(txtScore, {alpha: 1.0}, 1.0,
            {ease: FlxEase.cubeOut});
            timer.start(1.6, karma, 1);
    }

    function karma(_):Void {
        var timer:FlxTimer = new FlxTimer();

        var txtScore:FlxSprite = new FlxSprite(250, 440).loadGraphic(Paths.image('interface/health_karma/' + karmaLevel));
        txtScore.antialiasing = false;
        txtScore.scale.x = 3;
        txtScore.scale.y = 3;
        txtScore.alpha = 0;
        add(txtScore);

        FlxTween.tween(txtScore, {x: 250, y: 429}, 1.0,
			{ease: FlxEase.cubeOut});

        FlxTween.tween(txtScore, {alpha: 1.0}, 1.0,
            {ease: FlxEase.cubeOut});
            //timer.start(1.6, showPlrFata, 0);
    }
}