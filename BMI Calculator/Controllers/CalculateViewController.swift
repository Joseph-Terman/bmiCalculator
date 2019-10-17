//
//  ViewController.swift
//  BMI Calculator
//
//  
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var heightNum : Float = 0.0
    var weightNum : Float = 0.0
    var bmiValue : String = ""
    var calculatorBrain = CalculatorBrain()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let roundedHeight = String(format: "%.2f", sender.value)
        heightLabel.text = "\(roundedHeight)m"
        heightNum = sender.value
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
        weightNum = sender.value
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton)  {
        let height = heightSlider.value
        let weight = weightSlider.value
        //let bmi = (weight / (pow(height, 2)))
        //bmiValue = String(format: "%0.2f", bmi)
        calculatorBrain.calculateBMI(h: height, w: weight)
        
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    
}

