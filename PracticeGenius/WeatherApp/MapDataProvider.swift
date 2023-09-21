//
//  MapDataProvider.swift
//  PracticeGenius
//
//  Created by Balita on 9/19/23.
//

import SwiftUI
import MapKit

class MapDataProvider : NSObject, ObservableObject {
    @Published var locality: String = "XXXXXX"
    @Published var location: [Double] = [0.0, 0.0]
    
    var locationManager: CLLocationManager = CLLocationManager()
    var geoCoder: CLGeocoder = CLGeocoder()

    override init(){
        super.init()
        locationManager.delegate = self
      //  fromPlace(area: "Antananarivo")
     //   locationManager.requestWhenInUseAuthorization()
        
    }
    
    func CheckLocation(){
        locationManager.requestWhenInUseAuthorization()
    }
    
    func fromCoords(lat: Double, lon: Double){
        geoCoder.reverseGeocodeLocation(CLLocation(latitude: lat, longitude: lon)) { places, error in
            places?.forEach({ place in
                print("ville: \(String(describing: place.locality)),\npays: \(String(describing: place.country)), \ncode postal \(String(describing: place.postalCode))")
                self.location = [place.location!.coordinate.latitude, place.location!.coordinate.longitude]
                self.locality = place.locality ?? "zzz"
            })
            
            if error != nil {
                print("There was an error with GeoCoder reverse : \(error!.localizedDescription)")
            }
        }
    }
    
    func fromPlace(area: String){
        geoCoder.geocodeAddressString(area){places, error in
            places?.forEach({ place in
                print("J'ai trouvé via cette adresse :\nville: \(String(describing: place.locality)),\npays: \(String(describing: place.country)) - region: \(String(describing: place.region)), \nCoords \(String(describing: place.location))")
            })
            
            if error != nil {
                print("There was an error with GeoCoder geocodeAddressString : \(error!.localizedDescription)")
            }
        }
    }
    
    
}

extension MapDataProvider: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
  //      print("Location manager has failed\n\(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
   //     print("Location manager succeeded\n\(locations)")
        if let first = locations.first {
  //          print("Our current position is \(first)")
            fromCoords(lat: first.coordinate.latitude, lon: first.coordinate.longitude)
            
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse: manager.requestLocation()
        case .authorizedAlways: manager.requestLocation()
        case .denied: print("Authorization denied")
        case .restricted: print("Authorization restricted")
        case .notDetermined : print("Authorization not determined")
            
        @unknown default:
            print("Authorization default not covered")
        }
    }
    
}
