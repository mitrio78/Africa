//
//  CoverImageView.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import SwiftUI

struct CoverImageView: View {

    // MARK: - Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")

    // MARK: - Body

    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            } //: Repeat
        } //: Tab
        .tabViewStyle(.page)
    }
}

// MARK: - Preview

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
