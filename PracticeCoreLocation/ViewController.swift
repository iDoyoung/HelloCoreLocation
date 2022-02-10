//
//  ViewController.swift
//  PracticeCoreLocation
//
//  Created by Doyoung on 2021/10/18.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    var latitude: Double? = nil {
        didSet {
            self.label.text = "위도: \(latitude)\n경도: \(longitude)"
        }
    }
    var longitude: Double? = nil {
        didSet {
            self.label.text = "위도: \(latitude)\n경도: \(longitude)"
        }
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .systemBackground
    }
    
    private lazy var label: UILabel = {
        var label = UILabel()
        label.textColor = .label
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // 위치 서비스를 사용하기 위한 사용자 권한 요청
        locationManager.requestLocation() // 사용자의 현재 위치에 대한 일회성 전달을 요청
    }

    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}
