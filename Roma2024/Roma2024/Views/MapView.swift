//
//  MapView.swift
//  Roma2024
//
//  Created by Andrea Masturzo on 06/05/23.
//

import SwiftUI
import Map
import MapKit

struct MapView: View {
    
    @State var selectedLocations: Set<Int> = []
    @State var annotations: [Poi] = []
    @State var sortedAnnotations: [Poi] = []
    @State var tappedAnnotation = false
    @State var firstOpen = false
    
    @State var region = MKCoordinateRegion.init(center: CLLocationCoordinate2D(latitude: 41.897702, longitude: 12.482394), span: MKCoordinateSpan(latitudeDelta: 0.12, longitudeDelta: 0.12))
    
    @EnvironmentObject var locationManager : ViewModel
    
    
    
    
    //    init() {
    //        annotations = locationManager.$ListOfPoi
    //    }
    
    
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $region,
                pointOfInterestFilter: MKPointOfInterestFilter(including: [.airport, .atm, .bakery, .bank, .beach, .evCharger, .hospital, .hotel, .museum, .nationalPark, .park,.pharmacy, .police,.postOffice, .publicTransport, .stadium, .theater]),
                informationVisibility: .userLocation,
                annotationItems: locationManager.ListOfPoi,
                selectedItems: $selectedLocations,
                annotationContent: { location in
                ViewMapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude!, longitude: location.longitude!), title: location.name, subtitle: location.name, clusteringIdentifier: nil, content: {_ in
                    MapAnnotationView()
                        .shadow(radius: 10)
                        .fixedSize()
                }, clusterContent: {_,_  in
                    MapAnnotationView()
                        .fixedSize()
                })
            }, overlays: locationManager.ListOfPoi.map{ MKCircle(center: CLLocationCoordinate2D(latitude: $0.latitude!, longitude: $0.longitude!), radius: CLLocationDistance($0.geoFencingRadius))},
                overlayContent: { overlay in
                MapCircle(circle: overlay as! MKCircle, fillColor: Color("AccentColor").opacity(0.3), strokeColor: Color.clear)
            })
            .ignoresSafeArea()
        }
        
        .onChange(of: selectedLocations) { _ in
            if let selectedLocation = selectedLocations.first {
                tappedAnnotation = true
            }
        }
//        .overlay {
//            if tappedAnnotation == true {
//                ZStack {
//                    Color.black.opacity(0.2)
//                    PopUpView(location: locationManager.ListOfPoi.first(where: {$0.id == selectedLocations.first})!, tappedLocation: $tappedAnnotation)
//                        .previewLayout(.sizeThatFits)
//                        .onDisappear {
//                            selectedLocations = []
//                        }
//                }
//                .ignoresSafeArea()
//            } else {}
//        }
        .sheet(isPresented: $tappedAnnotation , content: {
            LocationDetails(location: locationManager.ListOfPoi.first(where: {$0.id == selectedLocations.first})!, tappedLocation: $tappedAnnotation)
        })
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


struct MapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.primaryBackground)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.primaryBackground)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
        }
    }
}
