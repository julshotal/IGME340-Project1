//
//  MenuVC.swift
//  Hotaling_Magneto1
//
//  Created by Student on 9/30/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class MenuVC: UITableViewController {
    
    //MARK: - Variables and holding arrays
    var menuOptions = [Loader]()
    var allCats = [String]()
    
    var selectedSet:[String] = []

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Grab singleton
        let w = Words.shared
        
        //Set selectedSet to default, grab category names from singleton
        title = "Word Sets"
        selectedSet = w.getWords("Example Haiku");
        allCats = w.getCategoryNames()

        //Add each corresponding word set for each category to menu options
        for cat in allCats {
            menuOptions.append(Loader(name: cat, set: w.getWords(cat)))
        }
    }
    
    //MARK: - Storyboard Action
    @IBAction func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Table view data source and ovverides

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSet = menuOptions[indexPath.row].set;
        
        //Change set without done being hit on ipad due to popup size
        if isPad {
            let nc = NotificationCenter.default
            let data = ["set": selectedSet]
            
            nc.post(name: mySetChangedNotification, object: self, userInfo: data)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuOptions.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath)

        let t = menuOptions[indexPath.row]
        let name = t.name
        
        
        // Configure the cell...
        cell.textLabel?.text = name
        return cell
    }

}
