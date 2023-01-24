//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Nathan Kalala Lufuluabo on 2023-01-22.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
//    let names = ["Celestin", "Julie", "Freddy", "Serge", "Nathan", "Naomi", "Sarah", "Beni"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}

