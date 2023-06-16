//
//  CalculatorBMI.swift
//  BMI Calculator
//
//  Created by Onur Fidan on 14.06.2023.
//

import Foundation
import UIKit


struct CalculatorBMI {
    
    var bmi: BMI?
    
    
    func bmiValue() -> String{
        let bmiValuee = String(format: "%.1f", bmi?.value ?? 0.1)
        return bmiValuee
    }
    
    func advice() -> String {
        return bmi?.advice ?? "There is no advice"
    }
    
    func color() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func song () -> String{
        return bmi?.song ?? ""
    }
    
    
    
    
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!.", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), song: "success")
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), song: nil)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), song: "negative")
        }
        
    }
    
    
    
    
    
    
    
}
