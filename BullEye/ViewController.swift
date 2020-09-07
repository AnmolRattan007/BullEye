//
//  ViewController.swift
//  BullEye
//
//  Created by anmol rattan on 06/09/20.
//  Copyright © 2020 anmol rattan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var changingView: UIView!
    
    @IBOutlet weak var fixedView: UIView!{
        didSet{
            fixedView.backgroundColor = UIColor(red: generateRandomRGBValues().r, green: generateRandomRGBValues().g, blue: generateRandomRGBValues().b, alpha: 1.0)
        }
    }
    @IBOutlet weak var hitBtn: UIButton!{
        didSet{
            hitBtn.setTitle("HIT ME", for: .normal)
        }
    }
    @IBOutlet weak var rSlider: UISlider!{
        didSet{
            rSlider.value = defaultSliderValue
        }
    }
    @IBOutlet weak var gSlider: UISlider!{
        didSet{
            gSlider.value = defaultSliderValue
        }
        
    }
    @IBOutlet weak var bSlider: UISlider!{
        didSet{
            bSlider.value = defaultSliderValue
        }
    }
    
    //Properties
    
    let defaultSliderValue:Float = 0.5
    let scoreTitle = "Your Score Is"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        custamizeBtn()
        
        // Do any additional setup after loading the view.
    }
    
    private func custamizeBtn(){
        hitBtn.layer.cornerRadius = 24.0
        hitBtn.layer.masksToBounds = true
        hitBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        
        
    }
    
    
    
    
    //generate randon rgb values
    
    
    private func generateRandomRGBValues()->(r:CGFloat,g:CGFloat,b:CGFloat){
        let rValue:CGFloat = CGFloat(Double(arc4random_uniform(255))/255.0)
        let gValue:CGFloat = CGFloat(Double(arc4random_uniform(255))/255.0)
        let bValue:CGFloat = CGFloat(Double(arc4random_uniform(255))/255.0)
        return (rValue,gValue,bValue)
    }
    
    //Generate Score Method
    
    private func generateScore()->Double{
        let red = powf(Float(generateRandomRGBValues().r)-rSlider.value, 2.0)
        let blue = powf(Float(generateRandomRGBValues().b)-bSlider.value, 2.0)
        let green = powf(Float(generateRandomRGBValues().g)-gSlider.value, 2.0)
        let sum = red+blue+green
        let distance =  sqrt(Double(sum))*100
        let maxRange = sqrt(Double(pow(255.0, 2)*3))
        return (distance/maxRange)*100
    }
    
    
    
    
    @IBAction func rSliderValueChanged(_ sender: UISlider) {
        changingView.backgroundColor = UIColor(red: CGFloat(rSlider.value), green: CGFloat(gSlider.value), blue: CGFloat(bSlider.value), alpha: 1)
    }
    
    @IBAction func gSliderValueChanged(_ sender: UISlider) {
        changingView.backgroundColor = UIColor(red: CGFloat(rSlider.value), green: CGFloat(gSlider.value), blue: CGFloat(bSlider.value), alpha: 1)
    }
    
    @IBAction func bSliderValueChanged(_ sender: UISlider) {
        changingView.backgroundColor = UIColor(red: CGFloat(rSlider.value), green: CGFloat(gSlider.value), blue: CGFloat(bSlider.value), alpha: 1)
    }
    
    @IBAction func hitBtnPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: scoreTitle, message: String(generateScore()), preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true) {
                self.fixedView.backgroundColor = UIColor(red: self.generateRandomRGBValues().r, green: self.generateRandomRGBValues().g, blue: self.generateRandomRGBValues().b, alpha: 1.0)
            }
        }
        alert.addAction(action)
        present(alert,animated: true,completion:nil)
    }
    
    

}

