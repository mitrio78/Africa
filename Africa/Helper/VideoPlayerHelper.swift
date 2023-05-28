//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, format: String) -> AVPlayer {
    if let url = Bundle.main.url(forResource: fileName, withExtension: format) {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer!
}
