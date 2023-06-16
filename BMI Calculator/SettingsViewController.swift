//
//  LogOutViewController.swift
//  BMI Calculator
//
//  Created by Onur Fidan on 14.06.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    @IBAction func logOutPressed(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: Constans.goToView, sender: nil)
        } catch {
            print("Error")
        }
        
    }
    
    

    

}
