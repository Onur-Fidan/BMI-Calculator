//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Onur Fidan on 14.06.2023.
//

import UIKit
import AVFoundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    var song: String?
    
    var player: AVAudioPlayer!
    
    
    
    @IBOutlet weak var bmiValueLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiValueLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        playSound(name: song)
        
        
        
    }
    
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
        
        
        let firestoreDatabase = Firestore.firestore()
        
        var firestoreReference : DocumentReference? = nil
        
        let firestoreBMI = ["postedBy": Auth.auth().currentUser!.email!, "date" : Timestamp(date: Date()), "BMIValue" : bmiValueLabel.text!, "advice" : adviceLabel.text! ] as [String : Any]
        
        firestoreReference = firestoreDatabase.collection("BMI").addDocument(data: firestoreBMI as [String : Any], completion: { error in
            if error != nil {
                self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error")
            }
        })
        
        
        
    }
    
    
   
    
    //FieldValue.serverTimestamp()
    
    
    func playSound(name: String?) {
        let url = Bundle.main.url(forResource: name , withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()

    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }


   

}
