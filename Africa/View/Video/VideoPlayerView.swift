//
//  VideoPlayer.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {

    // MARK: - Properties

    var video: String
    var title: String

    // MARK: - Body

    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: video, format: "mp4")) { }
            .overlay(alignment: .topLeading) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            }
        } //: VStack
        .accentColor(.accentColor)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(video: "lion", title: "Lion")
    }
}
