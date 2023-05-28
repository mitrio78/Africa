//
//  InsetGalleryView.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import SwiftUI

struct InsetGalleryView: View {

    // MARK: - Properties

    let animal: AnimalModel

    // MARK: - Body

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            } //: HStack
        } //: Scroll
    }
}

// MARK: - Preview

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")

    static var previews: some View {
        InsetGalleryView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
