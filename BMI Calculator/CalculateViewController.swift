//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Onur Fidan on 14.06.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class CalculateViewController: UIViewController {
    
    var calculatorBMI = CalculatorBMI()
    
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
//    private func calculateBMI (){
//        let bmiValue = weightLabel.text
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    @IBAction func heightUISlider(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    
    
    @IBAction func weightUISlider(_ sender: UISlider) {
        let weight = String(format: "%0.f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBMI.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: Constans.goToResult, sender: self)
        
//        let firestoreDatabase = Firestore.firestore()
//        
//        var firestoreReference : DocumentReference? = nil
//        
//        let firestoreBMI = ["postedBy": Auth.auth().currentUser!.email!, "date" : FieldValue.serverTimestamp(), "advice" : result.adviceLabel.text!] as [String : Any]
//        
//        firestoreReference = firestoreDatabase.collection("BMI").addDocument(data: firestoreBMI as [String : Any], completion: { error in
//            if error != nil {
//                self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error")
//            }
//        })
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constans.goToResult {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBMI.bmiValue()
            destinationVC.advice = calculatorBMI.advice()
            destinationVC.color = calculatorBMI.color()
            destinationVC.song = calculatorBMI.song()
            
            
        }
    }
    
    
    

    
        
    
        
    
    

}
