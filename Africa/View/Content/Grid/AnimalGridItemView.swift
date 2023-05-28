//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import SwiftUI

struct AnimalGridItemView: View {

    // MARK: - Properties

    let animal: AnimalModel

    // MARK: - Body

    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

// MARK: - Preview

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode(FileType.animals.filename)
    
    static var previews: some View {
        AnimalGridItemView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
