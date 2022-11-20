//
//  ViewController.swift
//  Weather
//
//  Created by Runyao Xia on 11/19/22.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var txtSearch: UITextField!
    
    var locationManager = CLLocationManager()
    var addressStr = ""
    var myArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myArray[indexPath.row]
        return cell
    }
    @IBAction func getLocationAction(_ sender: Any) {
        locationManager.requestLocation()
        self.Fetch()
    }
    
    
    @IBAction func getWeatherAction(_ sender: Any) {
        self.addressStr = txtSearch.text ?? ""
        self.Fetch()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           guard let location = locations.last else { return }
           
           let lat = location.coordinate.latitude
           let lng = location.coordinate.longitude
           
           getAddressFromLocation(location: location)
           
       }

       
       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           print(error)
       }
       
       func getAddressFromLocation( location: CLLocation){
           
           let clGeoCoder = CLGeocoder()
           
           clGeoCoder.reverseGeocodeLocation(location) { placeMarks, error in
               
               if error != nil {
                   print(error?.localizedDescription)
                   return
               }
               var address = ""
               guard let place = placeMarks?.first else { return }
                           
                           if place.name != nil {
                               address += place.name! +  ","
                           }
                           
                           if place.locality != nil {
                               address += place.locality! +  ","
                           }
                           if place.subLocality != nil {
                               address += place.subLocality! +  ","
                           }
                           
                           if place.postalCode != nil {
                               address += place.postalCode! +  ","
                           }
                           
                           if place.country != nil {
                               address += place.country!
                           }
                           
               self.addressStr = address
       }
           
    }
    
    func Fetch() {
        let url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations=\(self.addressStr)&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key=mykey"

        var responseData = AF.request(url).responseJSON { responseData in

                 if responseData.error != nil {

                     print(responseData.error!)
                     return

                 }
            
            self.myArray.removeAll()
            let weatherData = JSON(responseData.data as Any)
            let forecastValues = weatherData["locations"][self.addressStr]["values"]
            
            for forecast in forecastValues {
                let forecastJSON = JSON(forecast.1)
                let temp = forecastJSON["temp"].floatValue
                let condition = forecastJSON["temp"].stringValue
                let res = "Temp：\(temp) and con: \(condition)"
                self.myArray.append(res)
             }
            
            
            self.tblView.reloadData()
            
     }

 }

}

