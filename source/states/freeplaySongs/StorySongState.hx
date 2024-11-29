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

    var songs:Array<SongMetadata> = [];

    public var songCount:Int = 1;

    public var curChoose:Int = 1;

    private var grpSongs:FlxTypedGroup<Alphabet>;

    public var line:FlxSprite;

    public var songNametxt:FlxText;
    public var desctxt:FlxText;
    

    override function create() {

        #if desktop
		DiscordClient.changePresence("Choosing campaign song", null);
		#end

        for (i in 0...WeekData.weeksList.length) {

			var leWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			var leSongs:Array<String> = [];
			var leChars:Array<String> = [];

			for (j in 0...leWeek.songs.length)
			{
				leSongs.push(leWeek.songs[j][0]);
				leChars.push(leWeek.songs[j][1]);
			}

			WeekData.setDirectoryFromWeek(leWeek);
			for (song in leWeek.songs)
			{
				var colors:Array<Int> = song[2];
				if(colors == null || colors.length < 3)
				{
					colors = [146, 113, 253];
				}
				addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]));
			}
		}
        
        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('rwmmenu/backgrounds/05'));
        bg.updateHitbox();
		bg.antialiasing = true;
        add(bg);

        grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
		{
			var songText:Alphabet = new Alphabet(90, 320, songs[i].songName, true);
			//songText.targetY = i;
			grpSongs.add(songText);

			songText.scaleX = Math.min(1, 980 / songText.width);
			songText.snapToPosition();

			Mods.currentModDirectory = songs[i].folder;
		}
		WeekData.setDirectoryFromWeek();

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

        line = new FlxSprite(46, 60).loadGraphic(Paths.image('FreeplayMenu/freeplayLine'));
        line.updateHitbox();
		line.antialiasing = true;
        add(line);

        super.create();
    }

    public function addSong(songName:String, weekNum:Int, songCharacter:String, color:Int)
        {
            songs.push(new SongMetadata(songName, weekNum, songCharacter, color));
        }

    override function update(elapsed:Float) {
        super.update(elapsed);


        if (controls.BACK)
            {

                    MusicBeatState.switchState(new RWFreeplayState());
            }
    }
 

}

class SongMetadata
{
	public var songName:String = "";
	public var week:Int = 0;
	public var songCharacter:String = "";
	public var color:Int = -7179779;
	public var folder:String = "";
	public var lastDifficulty:String = null;

	public function new(song:String, week:Int, songCharacter:String, color:Int)
	{
		this.songName = song;
		this.week = week;
		this.songCharacter = songCharacter;
		this.color = color;
		this.folder = Mods.currentModDirectory;
		if(this.folder == null) this.folder = '';
	}
}



