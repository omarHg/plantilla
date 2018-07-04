//
//  controllerX.swift
//  plantilla
//
//  Created by Omar Hernandez on 26/06/18.
//  Copyright © 2018 Omar Hernandez. All rights reserved.
//

import Foundation
import UIKit

class controllerX: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(back))
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(back))
        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(back))

        navigationItem.leftBarButtonItems = [add, play]

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func back() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
