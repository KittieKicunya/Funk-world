package backend;

import sys.FileSystem;
import tjson.TJSON;
import backend.Mods;
import sys.io.File;
import haxe.io.Path;

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

    public static function getSongCoverImage(songName:String, ?modFolder:String):String {
        var songFolder = songName.toLowerCase();
        #if MODS_ALLOWED
        if (modFolder != null && modFolder != '') {
            var modDataFolder = 'mods/$modFolder/data/$songFolder/imgCover.png';
            if (FileSystem.exists(modDataFolder)) {
                return modDataFolder;
            }
        }
        for (mod in Mods.parseList().enabled) {
            var modDataFolder = 'mods/$mod/data/$songFolder/imgCover.png';
            if (FileSystem.exists(modDataFolder)) {
                return modDataFolder;
            }
        }
        #end
        var sharedDataFolder = 'assets/shared/data/$songFolder/imgCover.png';
        if (FileSystem.exists(sharedDataFolder)) {
            return sharedDataFolder;
        }
        return '';
    }

    private static function loadDataByCategory(category: String, key: String): Array<String> {
        var dataList: Array<String> = [];
        var dataFolders:Array<String> = ['assets/shared/data'];
        #if MODS_ALLOWED
        for (mod in Mods.parseList().enabled)
            dataFolders.push('mods/$mod/data');
        #end

        for (dataFolder in dataFolders) {
            if (!FileSystem.exists(dataFolder)) continue;
            var directories = FileSystem.readDirectory(dataFolder);
            for (folder in directories) {
                var folderPath = dataFolder + "/" + folder;
                if (FileSystem.isDirectory(folderPath)) {
                    var dataFile = folderPath + "/SongData.json";
                    if (FileSystem.exists(dataFile)) {
                        try {
                            var jsonContent = File.getContent(dataFile);
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
        }
        return dataList;
    }

    private static function loadDataByCategoryInOrder(category: String, key: String): Array<String> {
        var dataList: Array<String> = [];
        var weekFolders:Array<String> = ['assets/shared/weeks'];
        #if MODS_ALLOWED
        for (mod in Mods.parseList().enabled)
            weekFolders.push('mods/$mod/weeks');
        #end

        var orderedSongs: Array<String> = [];
        for (dataFolder in weekFolders) {
            if (!FileSystem.exists(dataFolder)) continue;
            var jsonFiles = FileSystem.readDirectory(dataFolder).filter(function(file: String): Bool {
                return file.endsWith(".json");
            });
            for (jsonFile in jsonFiles) {
                var filePath = dataFolder + "/" + jsonFile;
                if (FileSystem.exists(filePath)) {
                    try {
                        var jsonContent = File.getContent(filePath);
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
        }

        var dataFolders:Array<String> = ['assets/shared/data'];
        #if MODS_ALLOWED
        for (mod in Mods.parseList().enabled)
            dataFolders.push('mods/$mod/data');
        #end

        var allSongs: Map<String, Dynamic> = new Map();
        for (dataFolder in dataFolders) {
            if (!FileSystem.exists(dataFolder)) continue;
            var directories = FileSystem.readDirectory(dataFolder);
            for (folder in directories) {
                var folderPath = dataFolder + "/" + folder;
                if (FileSystem.isDirectory(folderPath)) {
                    var dataFile = folderPath + "/SongData.json";
                    if (FileSystem.exists(dataFile)) {
                        try {
                            var jsonContent = File.getContent(dataFile);
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