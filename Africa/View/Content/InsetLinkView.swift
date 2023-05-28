//
//  InsetLinkView.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import SwiftUI

struct InsetLinkView: View {

    // MARK: - Properties

    let animal: AnimalModel

    // MARK: - Body

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()

                Group {
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.com")!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)

            } //: HStack
        } //: Box
    }
}

// MARK: - Previews

struct InsetLinkView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetLinkView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
