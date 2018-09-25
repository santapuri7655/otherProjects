//
//  ViewController.swift
//  ColorMaker
//
//  Created by radhika santapuri on 9/24/18.
//  Copyright © 2018 radhika santapuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var red: UISlider?
    @IBOutlet weak var green: UISlider?
    @IBOutlet weak var blue: UISlider?
    @IBOutlet weak var colorChangeView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func colorChangeComponent(_ sender: Any) {
        let r: CGFloat = CGFloat(self.red?.value ?? 0)
        let g: CGFloat = CGFloat(self.green?.value ?? 0)
        let b: CGFloat = CGFloat(self.blue?.value ?? 0)
        
        colorChangeView?.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
}

