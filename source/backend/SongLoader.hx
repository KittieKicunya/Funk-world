package backend;

import sys.FileSystem;
import tjson.TJSON;

class SongLoader {
    public static function loadSongsByCategory(category: String): Array<String> {
        return loadDataByCategory(category, "song");
    }

    public static function loadDescByCategory(category: String): Array<String> {
        return loadDataByCategory(category, "songDescription");
    }

    public static function loadSongsByCategoryInOrder(category: String): Array<String> {
        return loadDataByCategoryInOrder(category, "song");
    }

    public static function loadDescByCategoryInOrder(category: String): Array<String> {
        return loadDataByCategoryInOrder(category, "songDescription");
    }

    private static function loadDataByCategory(category: String, key: String): Array<String> {
        var dataList: Array<String> = [];
        var dataFolder: String = "assets/shared/data";
        var directories = FileSystem.readDirectory(dataFolder);

        for (folder in directories) {
            var folderPath = dataFolder + "/" + folder;
            if (FileSystem.isDirectory(folderPath)) {
                var dataFile = folderPath + "/SongData.json";
                if (FileSystem.exists(dataFile)) {
                    try {
                        var jsonContent = sys.io.File.getContent(dataFile);
                        var jsonData: Dynamic = TJSON.parse(jsonContent);
                        if (jsonData.category == category) {
                            dataList.push(Reflect.field(jsonData, key));
                        }
                    } catch (e: Dynamic) {
                        trace("Error reading or parsing file: " + dataFile);
                        trace(e);
                    }
                }
            }
        }

        return dataList;
    }

    private static function loadDataByCategoryInOrder(category: String, key: String): Array<String> {
        var dataList: Array<String> = [];
        var dataFolder: String = "assets/shared/weeks";
        var jsonFiles = FileSystem.readDirectory(dataFolder).filter(function(file: String): Bool {
            return file.endsWith(".json");
        });

        var orderedSongs: Array<String> = [];

        // Get the order of songs from the weeks JSON files
        for (jsonFile in jsonFiles) {
            var filePath = dataFolder + "/" + jsonFile;
            if (FileSystem.exists(filePath)) {
                try {
                    var jsonContent = sys.io.File.getContent(filePath);
                    var jsonData: Dynamic = TJSON.parse(jsonContent);
                    var songs: Array<Array<String>> = cast Reflect.field(jsonData, "songs");
                    for (song in songs) {
                        orderedSongs.push(song[0]);
                    }
                } catch (e: Dynamic) {
                    trace("Error reading or parsing file: " + filePath);
                    trace(e);
                }
            }
        }

        // Get the song data from the data folder
        var dataFolder: String = "assets/shared/data";
        var directories = FileSystem.readDirectory(dataFolder);

        var allSongs: Map<String, Dynamic> = new Map();
        for (folder in directories) {
            var folderPath = dataFolder + "/" + folder;
            if (FileSystem.isDirectory(folderPath)) {
                var dataFile = folderPath + "/SongData.json";
                if (FileSystem.exists(dataFile)) {
                    try {
                        var jsonContent = sys.io.File.getContent(dataFile);
                        var jsonData: Dynamic = TJSON.parse(jsonContent);
                        if (jsonData.category == category) {
                            var songName = Reflect.field(jsonData, "song");
                            allSongs.set(songName, Reflect.field(jsonData, key));
                        }
                    } catch (e: Dynamic) {
                        trace("Error reading or parsing file: " + dataFile);
                        trace(e);
                    }
                }
            }
        }

        for (song in orderedSongs) {
            if (allSongs.exists(song)) {
                dataList.push(allSongs.get(song));
                allSongs.remove(song);
            }
        }

        for (song in allSongs.keys()) {
            dataList.push(allSongs.get(song));
        }

        trace("All songs: " + dataList);
        return dataList;
    }
}