//
//  dashboardUIVC.swift
//  plantilla
//
//  Created by Omar Hernandez on 26/06/18.
//  Copyright © 2018 Omar Hernandez. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import SideMenu
import Alamofire
import SwiftyJSON

class dashboardUIVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        let play = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(self.abrirMenu))
        navigationItem.leftBarButtonItems = [play]
        defineMenu()
    }
    
    func defineMenu(){
        let sideMenu = menu()
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: sideMenu)
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuShadowOpacity = 50.0
        SideMenuManager.default.menuFadeStatusBar = false
        
        
    }
    @objc func abrirMenu() {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
