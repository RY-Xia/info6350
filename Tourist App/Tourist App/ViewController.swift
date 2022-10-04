//
//  ViewController.swift
//  Tourist App
//
//  Created by Runyao Xia on 10/3/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let touristPlaceNames = ["Space Needle", "Gas Work Park", "Lake Washington", "South Lake Union", "Discovery Park"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return touristPlaceNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = Bundle.main.loadNibNamed("TouristTableViewCell", owner: self)?.first as! TouristTableViewCell
        cell.imgTourist.image = UIImage(named: touristPlaceNames[indexPath.row])
        cell.labelTourist.text = touristPlaceNames[indexPath.row]
        // cell.textLabel?.text = touristPlaceNames[indexPath.row]
        return cell;
    }
}

