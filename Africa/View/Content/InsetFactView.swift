//
//  InsetFactView.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import SwiftUI

struct InsetFactView: View {

    let animal: AnimalModel

    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: Tab
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: Box
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
