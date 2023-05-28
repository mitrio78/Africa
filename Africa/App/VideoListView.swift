//
//  VideoListView.swift
//  Africa
//
//  Created by anduser on 03.05.2023.
//

import SwiftUI

struct VideoListView: View {

    // MARK: - Properties

    @State var videos: [Video] = Bundle.main.decode(FileType.videos.filename)

    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - Body

    var body: some View {
        NavigationView {
            List(videos) { item in
                NavigationLink(
                    destination: VideoPlayerView(video: item.id, title: item.name)
                ) {
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                }
            } //: List
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        } //: Nav
    }
}

// MARK: - Preview

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
