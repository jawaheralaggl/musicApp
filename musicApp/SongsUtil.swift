//
//  SongsUtil.swift
//  musicApp
//
//  Created by Jawaher Alagel on 7/16/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import Foundation
struct SongUtil {
    
    static func getSongs () -> [Song]{
        
        var songs = [Song]()
        songs.append(Song(name: "Background music",
                          albumName: "123 Other",
                          artistName: "Rnado",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Havana",
                          albumName: "Havana album",
                          artistName: "Camilla Cabello",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Viva La Vida",
                          albumName: "123 Something",
                          artistName: "Coldplay",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "Background music",
                          albumName: "123 Other",
                          artistName: "Rnado",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Havana",
                          albumName: "Havana album",
                          artistName: "Camilla Cabello",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Viva La Vida",
                          albumName: "123 Something",
                          artistName: "Coldplay",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "Background music",
                          albumName: "123 Other",
                          artistName: "Rnado",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Havana",
                          albumName: "Havana album",
                          artistName: "Camilla Cabello",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Viva La Vida",
                          albumName: "123 Something",
                          artistName: "Coldplay",
                          imageName: "cover3",
                          trackName: "song3"))
        return songs
    }
    
}
