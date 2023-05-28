//
//  AnimalDetailView.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import SwiftUI

struct AnimalDetailView: View {

    // MARK: - Properties

    let animal: AnimalModel

    // MARK: - Body

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()

                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )

                // Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)

                // Gallery
                Group {
                    HeadingView(
                        headingImage: "photo.on.rectangle.angled",
                        headingText: "Wilderness in pictures"
                    )
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)

                // Facts
                Group {
                    HeadingView(
                        headingImage: "questionmark.circle",
                        headingText: "Did you know?"
                    )

                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)

                // Description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)

                // Map
                Group {
                    HeadingView(headingImage: "map", headingText: "National parks")
                }
                .padding(.horizontal)

                InsetMapView()

                // Link
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learc more")
                    InsetLinkView(animal: animal)
                }
                .padding(.horizontal)

            } //: VStack
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        } //: Scroll
    }
}

// MARK: - Previews

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalDetailView(animal: animals.first!)
    }
}
