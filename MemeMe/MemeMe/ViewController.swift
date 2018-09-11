//
//  ViewController.swift
//  MemeMe
//
//  Created by radhika santapuri on 9/10/18.
//  Copyright © 2018 radhika santapuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Label
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        view.addSubview(label)
        self.label = label
        
        //Button
        let button = UIButton()
        button.frame = CGRect(x: 150, y: 250, width: 60, height: 60)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(button)
    }
    
    func incrementCount() {
        self.count = self.count+1
        self.label?.text = "\(self.count)"
    }
}

