//
//  MeasurementsViewController.swift
//  BMI Calculator
//
//  Created by Onur Fidan on 14.06.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class MeasurementsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var userName = [String]()
    var adviceText = [String]()
    var bmiValue = [String]()
   
    
    
    
    override func viewDidLoad() {
        
        
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()

        data()
    }
    
    func data() {
            
        let fireStoreDatabase = Firestore.firestore()
        
        fireStoreDatabase.collection("BMI")
            .order(by: "date", descending: true)
            .addSnapshotListener { snapshot, error in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    if snapshot?.isEmpty != true && snapshot != nil {
                        
                        self.userName.removeAll(keepingCapacity: false)
                        self.adviceText.removeAll(keepingCapacity: false)
                        self.bmiValue.removeAll(keepingCapacity: false)
                        
                        for document in snapshot!.documents {
                            
                            if let postedBy = document.get("postedBy") as? String {
                                self.userName.append(postedBy)
                            }
                            
                            if let advice = document.get("advice") as? String {
                                self.adviceText.append(advice)
                            }
                            
                            if let BMIValue = document.get("BMIValue") as? String {
                                self.bmiValue.append(BMIValue)
                            }
                              
                            
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                    
                }
            }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userName.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MeasurementsCell
        cell.postedByLabel.text = userName[indexPath.row]
        cell.BMIValueLabel.text = bmiValue[indexPath.row]
        cell.adviceLabel.text = adviceText[indexPath.row]
        
        
        return cell
    }
    


}
