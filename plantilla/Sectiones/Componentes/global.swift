//
//  global.swift
//  plantilla
//
//  Created by Omar Hernandez on 26/06/18.
//  Copyright © 2018 Omar Hernandez. All rights reserved.
//

import Foundation
import UIKit
let appDelegate:AppDelegate=UIApplication.shared.delegate as! AppDelegate
var userDataApp = UserModel()
struct Horar {
    var num: Int
    var Horario : String
}
var horariosA = [Horar(num: 0, Horario: "A"),
                Horar(num: 0, Horario: "A"),
                Horar(num: 0, Horario: "A"),
                Horar(num: 0, Horario: "A"),
                Horar(num: 0, Horario: "A"),
                Horar(num: 0, Horario: "A"),
                Horar(num: 0, Horario: "A")]

var horariosB = [Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "B"),
                 Horar(num: 0, Horario: "B"),
                 Horar(num: 0, Horario: "B"),
                 Horar(num: 0, Horario: "A")]

var horariosC = [Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "B"),
                 Horar(num: 0, Horario: "B"),
                 Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "A")]

var horariosD = [Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "B"),
                 Horar(num: 0, Horario: "B"),
                 Horar(num: 0, Horario: "A"),
                 Horar(num: 0, Horario: "B")]



func compara(array:[Horar],titulo:String){
    print("---------  \(titulo)  ---------\n")

    var horarios = array
    var x = 0
    a1: for _ in 0...6 {
        var cont = 0
        b1: for b in x...6{
            if horarios[x].Horario == horarios[b].Horario{
                cont += 1
                if b == 6 {
                    if x != 0 {
                        if horarios[0].Horario == horarios[6].Horario {
                            horarios[x].num = horarios[0].num
                        }else {
                            horarios[x].num = x
                        }
                    }else{
                        if cont > 1 {
                            horarios[0].num = cont-1
                        }else{
                            horarios[0].num = cont
                        }
                    }
                    
                }
            }else{
                if x == 6 {
                    if horarios[0].Horario == horarios[6].Horario {
                        horarios[6].num = 6
                    }else {
                        horarios[6].num = horarios[0].num + 6
                    }
                }else{
                    if cont > 1 {
                        horarios[x].num = cont-1 + x
                    }else{
                        horarios[x].num = x
                    }
                }
                
                x = b
                
                if x == 6 {
                    if horarios[0].Horario == horarios[6].Horario {
                        horarios[6].num = horarios[0].num + 6
                    }else {
                        horarios[6].num = 6
                    }
                }
                break b1
            }
        }

    }
    
    for x in 0...6 {
     print("Horario numero: \(horarios[x].num) -> Horarios: \(horarios[x].Horario)")
    }
    
    for x in 0...6 {
        if (x + horarios[x].num) > 6 {
            if x > horarios[x].num {
                horarios[0].num = 0
            }
        }
    }
    
    let diasString = ["Lun","Mar","Mie","Jue","Vie","Sab","Dom","Lun","Mar","Mie","Jue","Vie","Sab","Dom"]
    let diasStringCompletos = ["Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo"]
    
    var diasArreglados:[String] = []
    for x in 0...6 {
        let suma = horarios[x].num
        if suma > 6 {
            if diasArreglados.count > 0 {
                diasArreglados[0] = "\(diasString[x]) - \(diasString[horarios[x].num])"
            }else{
                diasArreglados.append("\(diasString[x]) - \(diasString[horarios[x].num])")
            }
        }else{
            if horarios[x].num != 0 {
                
                if horarios[x].num > 1 && horarios[x].num != x {
                    diasArreglados.append("\(diasString[x]) - \(diasString[horarios[x].num]) -> \(horarios[x].Horario)")
                }else {
                    diasArreglados.append("\(diasStringCompletos[horarios[x].num]) -> \(horarios[x].Horario)")
                }
            }
        }
    }
    
    for dA in diasArreglados {
        print("\(dA)")
    }
    
}

func fontSystem(tamano:CGFloat, bold: Bool) -> UIFont {
    if bold {
        return UIFont.boldSystemFont(ofSize:tamano)
    }else {
        return UIFont.systemFont(ofSize: tamano)
    }
}


