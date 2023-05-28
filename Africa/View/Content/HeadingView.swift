//
//  HeadingView.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import SwiftUI

struct HeadingView: View {

    // MARK: - Properties
    var headingImage: String
    var headingText: String

    // MARK: - Body

    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)

            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)

        } //: HStack
        .padding(.vertical)
    }
}

// MARK: - Preview

struct HeadingView_Previews: PreviewProvider {

    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wolderness in pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
