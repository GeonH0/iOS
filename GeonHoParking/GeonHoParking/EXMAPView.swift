//
//  EXMAPView.swift
//  GeonHoParking
//
//  Created by 김건호 on 11/20/23.
//
//
//import SwiftUI
//import NMapsMap
//import CoreLocation
//
//struct EXMAPView: View {
//    @StateObject var coordinator: Coordinator = Coordinator.shared
//    
//    var body: some View {
//        VStack{
//            NaverMap()
//                .ignoresSafeArea()
//        }
//        .onAppear {
//                    Coordinator.shared.checkIfLocationServiceIsEnabled()
//                }
//        
//    }
//}
//
//struct NaverMap : UIViewRepresentable {
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator.shared
//    }
//    
//    func makeUIView(context: Context) -> NMFNaverMapView {
//        context.coordinator.getNaverMapView()
//    }
//    
//    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {}
//    
//}
//
//final class Coordinator: NSObject, ObservableObject, NMFMapViewCameraDelegate, NMFMapViewTouchDelegate, CLLocationManagerDelegate {
//    static let shared = Coordinator()
//    
//    let view = NMFNaverMapView(frame: .zero)
//    
//    override init() {
//        super.init()
//        
//        view.mapView.positionMode = .direction
//        view.mapView.isNightModeEnabled = true
//        
//        view.mapView.zoomLevel = 15
//        view.mapView.minZoomLevel = 10 // 최소 줌 레벨
//        view.mapView.maxZoomLevel = 17 // 최대 줌 레벨
//        
//        view.showLocationButton = true
//        view.showZoomControls = true // 줌 확대, 축소 버튼 활성화
//        view.showCompass = false
//        view.showScaleBar = false
//        
//        view.mapView.addCameraDelegate(delegate: self)
//        view.mapView.touchDelegate = self
//    }
//    
//    func mapView(_ mapView: NMFMapView, cameraWillChangeByReason reason: Int, animated: Bool) {
//        // 카메라 이동이 시작되기 전 호출되는 함수
//    }
//    
//    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
//        // 카메라의 위치가 변경되면 호출되는 함수
//    }
//    
//    @Published var coord: (Double, Double) = (0.0, 0.0)
//    @Published var userLocation: (Double, Double) = (0.0, 0.0)
//    
//    var locationManager: CLLocationManager?
//    
//    // MARK: - 위치 정보 동의 확인
//    func checkLocationAuthorization() {
//        guard let locationManager = locationManager else { return }
//        
//        switch locationManager.authorizationStatus {
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            print("위치 정보 접근이 제한되었습니다.")
//        case .denied:
//            print("위치 정보 접근을 거절했습니다. 설정에 가서 변경하세요.")
//        case .authorizedAlways, .authorizedWhenInUse:
//            print("Success")
//            
//            coord = (Double(locationManager.location?.coordinate.latitude ?? 0.0), Double(locationManager.location?.coordinate.longitude ?? 0.0))
//            userLocation = (Double(locationManager.location?.coordinate.latitude ?? 0.0), Double(locationManager.location?.coordinate.longitude ?? 0.0))
//            
//            fetchUserLocation()
//            
//        @unknown default:
//            break
//        }
//    }
//    func checkIfLocationServiceIsEnabled() {
//        DispatchQueue.global().async {
//            if CLLocationManager.locationServicesEnabled() {
//                DispatchQueue.main.async {
//                    self.locationManager = CLLocationManager()
//                    self.locationManager!.delegate = self
//                    self.checkLocationAuthorization()
//                }
//            } else {
//                print("Show an alert letting them know this is off and to go turn i on")
//            }
//        }
//    }
//    func fetchUserLocation() {
//        if let locationManager = locationManager {
//            let lat = locationManager.location?.coordinate.latitude
//            let lng = locationManager.location?.coordinate.longitude
//            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: lat ?? 0.0, lng: lng ?? 0.0), zoomTo: 15)
//            cameraUpdate.animation = .easeIn
//            cameraUpdate.animationDuration = 1
//            
//            let locationOverlay = view.mapView.locationOverlay
//            locationOverlay.location = NMGLatLng(lat: lat ?? 0.0, lng: lng ?? 0.0)
//            locationOverlay.hidden = false
//            
//            locationOverlay.icon = NMFOverlayImage(name: "location_overlay_icon")
//            locationOverlay.iconWidth = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
//            locationOverlay.iconHeight = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
//            locationOverlay.anchor = CGPoint(x: 0.5, y: 1)
//            
//            view.mapView.moveCamera(cameraUpdate)
//        }
//    }
//    func getNaverMapView() -> NMFNaverMapView {
//            view
//        }
//}
//
//#Preview {
//    EXMAPView()
//}
