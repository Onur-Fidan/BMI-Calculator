//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Onur Fidan on 14.06.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        emailTextField.setupUpImage(ImageName: "email")
        passwordTextField.setupUpImage(ImageName: "password")
    }
    
    
    @IBAction func signInPressed(_ sender: Any) {
        
        if emailTextField.text != "" &&  passwordTextField.text != "" {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {authResult, error in
                if let e = error {
                    self.makeAlert(title: "Error", message: e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: Constans.goToTabBar, sender: nil)
                }
            }
            
        } else {
            makeAlert(title: "Attention!", message: "Email or Password field cannot be empty.")
        }
        
    }
    
    
    
    
    @IBAction func signUpPressed(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
                if let e = error {
                    self.makeAlert(title: "Error", message: e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier:Constans.goToTabBar , sender: nil)
                }
            }
        } else {
            makeAlert(title: "Attention!", message: "Email or Password field cannot be empty.")
        }
    }
    
    
    
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    

}





extension UITextField {
    
    func setupUpImage(ImageName : String) {
        
        let imageView = UIImageView(frame: CGRect(x: 17, y: 17, width: 20, height: 20))
        imageView.image = UIImage(named: ImageName)
        let imageViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        imageViewContainer.addSubview(imageView)
        leftView = imageViewContainer
        leftViewMode = .always
        self.tintColor = .lightGray
    }
}





