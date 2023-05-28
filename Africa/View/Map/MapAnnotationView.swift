//
//  MapAnnotationView.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import SwiftUI

struct MapAnnotationView: View {

    // MARK: - Properties

    var location: LocationModel
    @State private var animation: Double = 0.0

    // MARK: - Body

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)

            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)

            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        } //: ZStack
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

// MARK: - Previews

struct MapAnnotationView_Previews: PreviewProvider {

    static var locations: [LocationModel] = Bundle.main.decode(FileType.locations.filename)
    
    static var previews: some View {
        MapAnnotationView(location: locations.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
