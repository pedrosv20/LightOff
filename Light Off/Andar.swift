//
//  Andar.swift
//  Light Off
//
//  Created by Pedro Vargas on 08/05/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation
import UIKit

class Andar {
    static let shared = Andar()

    private init(){
        pontuacao = UserDefaults.standard.integer(forKey: "pontuacao")
        andar = UserDefaults.standard.integer(forKey: "andar")
    }
    var dificuldade: Double = 90
    var tempo: Int = 0
    var money = 0
    var nivel = 1
    var andar: Int {
        didSet{
            UserDefaults.standard.set(self.andar, forKey: "andar")
        }
    }
    var pontuacao: Int{
        didSet{
            UserDefaults.standard.set(self.pontuacao, forKey: "pontuacao")
        }
    }
}
