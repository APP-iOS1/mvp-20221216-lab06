//
//  FullMapView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/01.
//

import SwiftUI
import CoreLocation
import MapKit

struct FullMapView: View {
    
    @State var annotatedItem: [AnnotatedItem]
    @State var region: MKCoordinateRegion
    var places: Item
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: annotatedItem) { item in
                MapMarker(coordinate: item.coordinate, tint: .blue)
            }
        }
        .onAppear {
            region.center = CLLocationCoordinate2D(latitude: Double(places.mapY)!, longitude: Double(places.mapX)!)
        }
        .navigationTitle("\(places.facltNm)")
        .toolbar(.hidden, for: .tabBar)
    }
}

