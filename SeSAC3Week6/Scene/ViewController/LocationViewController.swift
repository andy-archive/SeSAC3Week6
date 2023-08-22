//
//  LocationViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/22.
//

import UIKit
import CoreLocation // 1. 위치에 대한 임포트

class LocationViewController: UIViewController {

    //2. 위치에 대한 매니저를 생성 -> 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // 3. 위치 프로토콜을 연결
        locationManager.delegate = self
        
//        // Alert 띄우기 -> Info.plist에서 Privacy - Location When in Use Usage Description의 값을 띄우는 용도
//        locationManager.requestWhenInUseAuthorization()
        
        checkDeviceLocationAuthorization()
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
                print(authorization)
                self.checkCurrentLocationAuthorization(status: authorization)
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
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            // didUpdateLocation 메서드를 실행
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        }
    }
}

// 4. 프로토콜을 채택
extension LocationViewController: CLLocationManagerDelegate {
    
    // 5-1. 사용자의 위치를 성공적으로 가지고 온 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function, "LOCATION: \(locations)")
    }
    
    // 5-2. 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function, "ERROR: \(error)")
    }
    
    // 5-3. 사용자의 권한 상태가 바뀌었을 때를 알려 줌 (iOS 14 이상)
    /// 거부했다가 설정에서 변경을 하거나 혹은 notDetermined상태에서 허용을 하거나
    /// 허용해서 위치를 갖고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등등
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }
    
    // Deprecated in iOS 14
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        <#code#>
//    }
}
