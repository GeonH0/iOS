////
////  MapView.swift
////  GeonHoParking
////
////  Created by 김건호 on 11/20/23.
////
//
//import SwiftUI
//import NMapsMap
//import CoreLocation
//
//struct MapView: View {
//    @State private var currentLocation: CLLocationCoordinate2D?
//
//    var body: some View {
//        ZStack {
//            UIMapView(currentLocation: $currentLocation)
//                .edgesIgnoringSafeArea(.vertical)
//        }
//        .onAppear {
//            // 앱이 나타날 때 위치 업데이트를 시작합니다.
//            LocationManager.shared.startUpdatingLocation { location in
//                currentLocation = location
//            }
//        }
//    }
//}
//
//struct UIMapView: UIViewRepresentable {
//    @Binding var currentLocation: CLLocationCoordinate2D?
//
//    func makeUIView(context: Context) -> NMFNaverMapView {
//        let view = NMFNaverMapView()
//        view.showZoomControls = false
//        view.mapView.positionMode = .normal // positionMode를 .normal로 수정
//        view.mapView.zoomLevel = 17
//
//        if let location = currentLocation {
//            view.mapView.moveCamera(NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.latitude, lng: location.longitude)))
//        }
//
//        return view
//    }
//
//    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
//        if let location = currentLocation {
//            uiView.mapView.moveCamera(NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.latitude, lng: location.longitude)))
//        }
//    }
//}
//
//class LocationManager: NSObject, CLLocationManagerDelegate {
//    
//    static let shared = LocationManager()
//
//    private var locationManager = CLLocationManager()
//    private var locationUpdateCallback: ((CLLocationCoordinate2D) -> Void)?
//
//    private override init() {
//        super.init()
//        setupLocationManager()
//    }
//
//    private func setupLocationManager() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    }
//
//    func startUpdatingLocation(completion: @escaping (CLLocationCoordinate2D) -> Void) {
//        locationUpdateCallback = completion
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last?.coordinate {
//            locationUpdateCallback?(location)
//        }
//    }
//}
//
//
//
//#Preview {
//    MapView()
//}
