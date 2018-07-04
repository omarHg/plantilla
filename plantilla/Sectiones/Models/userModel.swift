//
//  userModel.swift
//  plantilla
//
//  Created by Omar Hernandez on 26/06/18.
//  Copyright © 2018 Omar Hernandez. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class UserModel: NSObject {
    var idUsuario = 0
    var nombre = ""

    override init() {
        super.init()
    }
    
    func saved(_ dataSaved: UserSaved) {
        self.idUsuario = dataSaved.idUsuario
        self.nombre = dataSaved.nombre
        
    }
    
}

class UserSaved: NSObject, NSCoding {
    
    var idUsuario = 0
    var nombre = ""
    
    // Memberwise initializer
    init(idUsuario: Int, nombre:String) {
        self.idUsuario = idUsuario
        self.nombre = nombre
    }
    
    // MARK: NSCoding
    func saveUserDefaults() {
        UserDefaults.standard.set(self.idUsuario, forKey: "idUsuario")
        UserDefaults.standard.set(self.nombre, forKey: "nombre")
        UserDefaults.standard.synchronize()
    }
    
    func GetUserDefaults() {
        self.idUsuario = UserDefaults.standard.integer(forKey: "idUsuario")
        self.nombre = UserDefaults.standard.string(forKey: "nombre") ?? ""
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let idUsuario = decoder.decodeObject(forKey: "idUsuario") as? Int,
            let nombre = decoder.decodeObject(forKey: "nombre") as? String
            else { return nil }
        
        self.init(idUsuario: idUsuario,
                  nombre: nombre)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.idUsuario, forKey: "idUsuario")
        coder.encode(self.nombre, forKey: "nombre")
    }
    
    override init(){
        
    }
}
