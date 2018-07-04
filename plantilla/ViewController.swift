//
//  ViewController.swift
//  plantilla
//
//  Created by Omar Hernandez on 26/06/18.
//  Copyright © 2018 Omar Hernandez. All rights reserved.
//

import UIKit
import UnderLineTextField
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()
    
    let viewBackFormLogin:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textUser:UnderLineTextField = {
        let text = UnderLineTextField()
        text.backgroundColor = .clear
        text.placeholder = stringUsuario
        text.returnKeyType = .next
        text.errorLineColor = .red
        text.errorTextColor = .red
        text.validationType = .always
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let textPsw:UnderLineTextField = {
        let text = UnderLineTextField()
        text.backgroundColor = .clear
        text.returnKeyType = .done
        text.placeholder = stringContrasena
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let btnAceptar:UIButton = {
        let button = UIButton()
        button.backgroundColor = gris
        button.setTitle(stringAcceder, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = gris.cgColor
        button.layer.cornerRadius = 2
        button.titleLabel?.font =  fontSystem(tamano: 15, bold: false)
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textUser.delegate = self
        textPsw.delegate = self
        
        
        self.view.addSubview(scrollView)
        self.view.addConstraintsWithFormat("V:|[v0]|", views: scrollView)
        self.view.addConstraintsWithFormat("H:|[v0]|", views: scrollView)
        scrollView.contentSize = self.view.frame.size
        
        scrollView.addSubview(viewBackFormLogin)
        
        scrollView.addConstraint(NSLayoutConstraint(item: viewBackFormLogin, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: scrollView, attribute: NSLayoutAttribute.width, multiplier: 0.9, constant: 0.0))
        
        
        
        scrollView.addConstraint(NSLayoutConstraint(item: viewBackFormLogin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: scrollView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
        
        
        if UIDevice().type == .iPhoneX {
            scrollView.addConstraint(NSLayoutConstraint(item: viewBackFormLogin, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: scrollView, attribute: NSLayoutAttribute.height, multiplier: 0.7, constant: 0.0))
            scrollView.addConstraint(NSLayoutConstraint(item: viewBackFormLogin, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: scrollView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0.0))
        }else{
            scrollView.addConstraint(NSLayoutConstraint(item: viewBackFormLogin, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: scrollView, attribute: NSLayoutAttribute.height, multiplier: 0.8, constant: 0.0))
            scrollView.addConstraint(NSLayoutConstraint(item: viewBackFormLogin, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: scrollView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0.0))
        }
        
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        draw()
        
        
        let dataSaved = UserSaved()
        dataSaved.GetUserDefaults()
        
        userDataApp.saved(dataSaved)
        print(userDataApp.nombre)
        print(userDataApp.idUsuario)
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if userDataApp.idUsuario != 0 {
            entrar()
        }
        
        compara(array: horariosA, titulo: "A")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            compara(array: horariosB, titulo: "B")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            compara(array: horariosC, titulo: "C")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            compara(array: horariosD, titulo: "D")
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
@objc extension ViewController {
    
    //=================
    // MARK: - Selectors
    //=================
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == Notification.Name.UIKeyboardWillHide {
            scrollView.contentInset = UIEdgeInsets.zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
    }
    
}

extension ViewController :UnderLineTextFieldDelegate, UITextFieldDelegate {
    
    func textFieldValidate(underLineTextField: UnderLineTextField) throws {
        switch underLineTextField {
        case textUser:
            if textUser.text!.count == 2 {
                throw UnderLineTextFieldErrors
                    .error(message: "need 2 more characters")
            }
        default:
            break
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textUser {
            _ = textPsw.becomeFirstResponder()
        }
        
        if textField == textPsw {
            _ = textPsw.resignFirstResponder()
        }
        return true
    }
    
}

extension ViewController {
    func draw() {
        
        
        viewBackFormLogin.addSubview(textUser)
        viewBackFormLogin.addSubview(textPsw)
        viewBackFormLogin.addSubview(btnAceptar)
        
        viewBackFormLogin.addConstraintsWithFormat("V:|[v0]-[v1]-[v2(40)]", views: textUser,textPsw,btnAceptar)
        
        
        
        viewBackFormLogin.addConstraint(NSLayoutConstraint(item: textUser, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: viewBackFormLogin, attribute: NSLayoutAttribute.width, multiplier: 0.8, constant: 0.0))
        viewBackFormLogin.addConstraint(NSLayoutConstraint(item: textUser, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: viewBackFormLogin, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
        
        viewBackFormLogin.addConstraint(NSLayoutConstraint(item: textPsw, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: viewBackFormLogin, attribute: NSLayoutAttribute.width, multiplier: 0.8, constant: 0.0))
        viewBackFormLogin.addConstraint(NSLayoutConstraint(item: textPsw, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: viewBackFormLogin, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
        
        viewBackFormLogin.addConstraint(NSLayoutConstraint(item: btnAceptar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: viewBackFormLogin, attribute: NSLayoutAttribute.width, multiplier: 0.6, constant: 0.0))
        viewBackFormLogin.addConstraint(NSLayoutConstraint(item: btnAceptar, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: viewBackFormLogin, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
        
        btnAceptar.addTarget(self, action:#selector(self.entrar), for: .touchUpInside)
        
    }
    
    @objc func entrar() {
        
        let dashboard = dashboardUIVC()
        dashboard.title = "plantilla"
        let navController = UINavigationController(rootViewController: dashboard)
        self.present(navController, animated:true, completion: nil)
    }
    
    @objc func login(){
        
        
        let url = ""
        Alamofire.request(url, method: .post, parameters: ["user":"\(textUser.text!)","contras":"\(textPsw.text!)"],encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                
                let json = JSON(response.result.value!)

                userDataApp.idUsuario = json["idUsuario"].intValue
                if userDataApp.idUsuario == 0 {
                   
                }else {
                    userDataApp.idUsuario = json["idUsuario"].intValue
                    userDataApp.nombre = json["nombre"].stringValue
                    
                    let Save = UserSaved(idUsuario: userDataApp.idUsuario,
                                         nombre: userDataApp.nombre)
                    
                    Save.saveUserDefaults()
                    self.entrar()
                }
                
                break
            case .failure(let error):
                
                print(error)
            }
        }
    }
}

