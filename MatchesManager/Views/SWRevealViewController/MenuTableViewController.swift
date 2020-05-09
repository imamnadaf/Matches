//
//  MenuTableViewController.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menu"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigation = segue.destination as! UINavigationController
        let controller = navigation.viewControllers.first as! MatchesViewController
        if segue.identifier == "showall" {
            debugPrint("Show all")
            controller.shouldShowSavedMatches = false
            
        } else {
            controller.shouldShowSavedMatches = true
        }
    }


}
