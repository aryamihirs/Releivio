//
//  PlayMeditation.swift
//  Relevio
//
//  Created by Arya Mihir Singh on 11/14/22.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer!

func playSound()
{
    let url = Bundle.main.url(forResource: "meditation", withExtension: "mp3")
    
    // Do nothing if empty URL
    guard url != nil else {
        return
    }
    
    do{
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    }catch{
        print("\(error)")
    }
}

