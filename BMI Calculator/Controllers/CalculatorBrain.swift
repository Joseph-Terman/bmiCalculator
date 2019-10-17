//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Joe on 10/10/19.
//

import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
    
    mutating func calculateBMI(h height: Float, w weight: Float) {
        let calculatedBMIValue = (weight / (pow(height, 2)))
        if calculatedBMIValue < 18.5 {
            bmi = BMI(value: calculatedBMIValue, advice: "Eat more food" , color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) )
        } else if calculatedBMIValue < 24.9 {
            bmi = BMI(value: calculatedBMIValue, advice: "You're alright" , color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) )
        } else {
            bmi = BMI(value: calculatedBMIValue, advice: "Stop eating" , color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1) )
        }
        
    }
    
    func getBMIValue() -> String{
        let bmiValue = String(format: "%.2f", bmi?.value ?? 0)
            return bmiValue
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
   
    
}
