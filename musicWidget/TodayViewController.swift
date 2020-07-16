//
//  TodayViewController.swift
//  musicWidget
//
//  Created by Jawaher Alagel on 7/14/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import UIKit
import NotificationCenter
import AVFoundation


class TodayViewController: UIViewController, NCWidgetProviding {
    
    var player: AVAudioPlayer?
    var songs = [Song]()
    var position : Int = 0
    
    @IBOutlet weak var imageShow: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("viewDidLoad")
        songs = getSongs()
        position = UserDefaults.init(suiteName: "group.com.jawaher.widget")?.value(forKey: "trackPosition") as! Int
        configurePlayer()
        setTrackInfo()
    }
    
    
    func configurePlayer(){
        print ("configurePlayer")
        setTrackInfo()
        let track = songs[position].trackName
        let urlString = Bundle.main.path(forResource: track, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.5
            
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            player.play()
        }
        catch {
            print("error occurred")
        }
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        print ("viewDidAppear")
        songs = getSongs()
        position = UserDefaults.init(suiteName: "group.com.jawaher.widget")?.value(forKey: "trackPosition") as! Int
        configurePlayer()
    }
    
    
    func setTrackInfo() {
        let song = songs[position]
        label1.text = song.name
        label3.text = song.artistName
        
        if song.name == "Background music" {
            image.image = UIImage(named: "cover1")
        }else if song.name == "Havana" {
            image.image = UIImage(named: "cover2")
        } else {
            image.image = UIImage(named: "cover3")
            
        }
    }
    
    
    @IBAction func showButton(_ sender: Any) {
        if let url = URL(string: "musicWidget://recent") {
            extensionContext?.open(url, completionHandler: nil)
        }
        
    }
    
    
    
    @IBAction func nextAction(_ sender: UIButton) {
        if position < (songs.count - 1) {
            position = position + 1
            player?.stop()
            configurePlayer()
        }
    }
    
    @IBAction func baclAction(_ sender: Any) {
        if position > 0 {
            position = position - 1
            player?.stop()
            configurePlayer()
        }
    }
    
    
    @IBAction func pausAction(_ sender: Any) {
        if (player != nil){
            print ("Player initialized!")
            if (player?.isPlaying == true){
                print ("Pausing player ...")
                playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
                player?.pause()
            } else {
                print ("*** Playing player ...")
                playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
                player?.play()
            }
        } else {
            print ("Cannot play, player is nil")
        }
        
        
    }
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    
    
    func getSongs () -> [Song]{
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


struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
