//
//  MainView.swift
//  Africa
//
//  Created by anduser on 03.05.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                }
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                }

            MapView()
                .tabItem {
                    Image(systemName: "map")
                }

            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
