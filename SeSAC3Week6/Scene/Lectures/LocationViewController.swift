//
//  LocationViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/22.
//

import UIKit
import CoreLocation
import MapKit
import SnapKit

//enum mapAnnotation {
//    case park,
//}

class LocationViewController: UIViewController {

    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    let parkButton = UIButton()
    let amusementButton = UIButton()
    
    let globalRandomNumber = Int.random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        configureMapView()
        configureLocationView()
        
        let center = CLLocationCoordinate2D(latitude: 37.512636, longitude: 127.102556)
        setRegionAndAnnotation(center: center)
    }
    
    @objc func parkButtonClicked() {
        print(#function)
        setAnonotations(type: 1)
        
        let localRandomNumber = Int.random(in: 1...100)
        print(globalRandomNumber, localRandomNumber) // 스코프에 따라 변수가 달라진다
    }
    
    func setAnonotations(type: Int) {
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 37.511081, longitude: 127.098167) // 롯데월드
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.501832, longitude: 127.102223) // 석촌고분공원
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2D(latitude: 37.519858, longitude: 127.122804) // 올림픽공원
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = CLLocationCoordinate2D(latitude: 37.508192, longitude: 127.100556) // 송파나루공원
        
        if type == 0 {
            mapView.addAnnotations([annotation1, annotation2])
        } else if type == 1{
            mapView.removeAnnotation(annotation1) // 동작하지 않음 -> 지역변수와 전역변수의 값이 다르기 때문
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation2, annotation3, annotation4])
        }
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        
        // 지도 중심 기반으로 보여질 범위를 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1200, longitudinalMeters: 1200)
        mapView.setRegion(region, animated: true)
        
        // 지도에 어노테이션 추가하기
        let annotation = MKPointAnnotation()
        annotation.title = "POINT ANNOTATION"
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
        
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보를 찾을 수 없습니다", message: "위치 서비스를 사용하려면 \n'설정 > 개인 정보 보호'에서 위치를 허용해 주세요.", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        present(alert, animated: true)

    }
    
    func configureMapView() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(30)
        }
        
        view.addSubview(parkButton)
        parkButton.backgroundColor = .green
        parkButton.addTarget(self, action: #selector(parkButtonClicked), for: .touchUpInside)
        parkButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(50)
            make.size.equalTo(30)
            make.leading.equalTo(view).offset(100)
        }
        
        view.addSubview(amusementButton)
        amusementButton.backgroundColor = .blue
        amusementButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(50)
            make.size.equalTo(30)
            make.trailing.equalTo(view).offset(-100)
        }
    }
    
    func configureLocationView() {
        locationManager.delegate = self
        
        /// Alert 띄우기 -> Info.plist에서 Privacy - Location When in Use Usage Description의 값을 띄우는 용도
        // locationManager.requestWhenInUseAuthorization()
        
        /// NavigationViewController에 담아서 할 경우에는 알아서 호출되지 않는 버그(?)가 있다
        /// 위치 일관적이지 않은 경우에 오류가 발생할 수 있기 때문
        checkDeviceLocationAuthorization() // viewDidLoad에 꼭 호출하자 (계층 구조마다 다르다)
    }
    
    func checkDeviceLocationAuthorization() {
        
        // iOS 위치 서비스에 대한 활성화 체크
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                
                let authorization: CLAuthorizationStatus
                
                // 현재 사용자의 위치 권한 상태를 갖고 오기
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                print("AUTHORIZATION: \(authorization)")
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            } else {
                print("위치 서비스가 꺼져 있어 위치 권한 요청을 할 수 없습니다")
            }
        }
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print(#function, status)
        
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // 각 기종에 맞게 최대한 정확한 위치를 잡음
            locationManager.requestWhenInUseAuthorization() // Alert을 띄워주는 역할
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showLocationSettingAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            // didUpdateLocation 메서드를 실행
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default: // case가 더 생길 것에 대한 대비
            print("default")
        }
    }
}

// MARK: LocationView

extension LocationViewController: CLLocationManagerDelegate {
    
    /// 사용자의 위치를 성공적으로 가지고 온 경우
    /// 한 번만 실행되지 않는다 -> 사용자의 위치에 따라 계속 변하기 때문 -> iOS 위치 업데이트가 필요한 시점에 알아서 여러 번 호출 된다
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let coordinate = locations.last?.coordinate {
            print("COORDINATE: \(coordinate)")
            setRegionAndAnnotation(center: coordinate)
            // API 호출
        }
        
        locationManager.stopUpdatingLocation() // 위치에 대한 업데이트를 더 이상 하지 않겠다 (러닝/네비게이션 앱이 아닌 이상 불필요한 위치 업데이트 방지)
    }
    
    /// 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function, "ERROR: \(error)")
    }
    
    /// 3. 사용자의 권한 상태가 바뀌었을 때를 알려 줌 (iOS 14 이상)
    /// 거부했다가 설정에서 변경을 하거나 혹은 notDetermined상태에서 허용을 하거나
    /// 허용해서 위치를 갖고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등등
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }
    
    /// Deprecated in iOS 14
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        <#code#>
//    }
}

extension LocationViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print(#function)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        print(#function)
//    }
}
