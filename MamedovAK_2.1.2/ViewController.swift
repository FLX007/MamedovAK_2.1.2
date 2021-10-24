//
//  ViewController.swift
//  MamedovAK_2.1.2
//
//  Created by FR on 20.10.2021.
//

import UIKit

enum CorrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {

    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CorrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        print("Размер стороны, доступный в методе viewDidLoad: \(redLight.frame.height)")
        // Do any additional setup after loading the view.
    }

    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.width / 2
        greenLight.layer.cornerRadius = redLight.frame.width / 2
        
        print("Размер стороны, доступный в методе viewWillLayoutSubviews: \(redLight.frame.height)")
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOff
            currentLight = .red
        }
    }
}

