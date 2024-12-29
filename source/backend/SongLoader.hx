package backend;

import sys.FileSystem;
import tjson.TJSON;

class SongLoader {
    public static function loadSongsByCategory(category: String): Array<String> {
        var songList: Array<String> = [];
        var dataFolder: String = "assets/shared/data";

        var directories = FileSystem.readDirectory(dataFolder);
        
        for (folder in directories) {
            var folderPath = dataFolder + "/" + folder;

            if (FileSystem.isDirectory(folderPath)) {
                var songDataFile = folderPath + "/SongData.json";
                
                if (FileSystem.exists(songDataFile)) {
                    try {
                        var jsonContent = sys.io.File.getContent(songDataFile);
                        var jsonData: Dynamic = TJSON.parse(jsonContent);

                        if (jsonData.category == category) {
                            songList.push(jsonData.song);
                        }
                    } catch (e: Dynamic) {
                        trace("Error reading or parsing file: " + songDataFile);
                        trace(e);
                    }
                }
            }
        }

        return songList;
    }
    public static function loadDescByCategory(category: String): Array<String> {
        var songList: Array<String> = [];
        var dataFolder: String = "assets/shared/data";

        var directories = FileSystem.readDirectory(dataFolder);
        
        for (folder in directories) {
            var folderPath = dataFolder + "/" + folder;

            if (FileSystem.isDirectory(folderPath)) {
                var songDataFile = folderPath + "/SongData.json";
                
                if (FileSystem.exists(songDataFile)) {
                    try {
                        var jsonContent = sys.io.File.getContent(songDataFile);
                        var jsonData: Dynamic = TJSON.parse(jsonContent);

                        if (jsonData.category == category) {
                            songList.push(jsonData.songDescription);
                        }
                    } catch (e: Dynamic) {
                        trace("Error reading or parsing file: " + songDataFile);
                        trace(e);
                    }
                }
            }
        }

        return songList;
    }
}