//
//  MapView.swift
//  Africa
//
//  Created by anduser on 03.05.2023.
//

import MapKit
import SwiftUI

struct MapView: View {

    // MARK: - Properties

    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(
            latitude: 6.600286,
            longitude: 16.4377599
        )
        var mapZoomLevel = MKCoordinateSpan(
            latitudeDelta: 70.0,
            longitudeDelta: 70.0
        )
        var region = MKCoordinateRegion(
            center: mapCoordinates,
            span: mapZoomLevel
        )
        return region
    }()

    let locations: [LocationModel] = Bundle.main.decode(FileType.locations.filename)

    // MARK: - Body

    var body: some View {
        //MARK: - No1 Basic map
        Map(coordinateRegion: $region, annotationItems: locations) { item in
//           (always static) - > MapMarker(coordinate: item.location, tint: .accentColor)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            } //: Annotations
            // Complex Map Annotation:
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } //: Map
        .overlay(alignment: .top) {
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)

                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            } //: HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
        }
    }
}

// MARK: - Preview

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
