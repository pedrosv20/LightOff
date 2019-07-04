//
//  contador.swift
//  Light Off
//
//  Created by Pedro Vargas on 23/04/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation
import SpriteKit

public class Contador {
    var teste = false
    var altura = 0
    var actualSize = CGFloat(0.0)
    var desireSize = CGFloat(0.0)
    var increaseHeight = CGFloat(0)
    var increaseHeightofHeight : CGFloat!
    var gameOver = false
    var timeRect = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 1, height: 100))
    var timeRectLabel : SKShapeNode!
    var oldSize = CGFloat(1)
    var scene : Scene!
    var timer1 = false
    
    init(scene: Scene){
        
        increaseHeightofHeight = CGFloat(Andar.shared.dificuldade / 60.0)
        timeRectLabel = SKShapeNode(rect: CGRect(x: 40, y: CGFloat(1640), width: 742, height: 50))
        self.scene = scene
        timeRect.fillColor = .green
        timeRect.zPosition = 15
        
        timeRectLabel.fillColor = .white
        timeRectLabel.zPosition = 5
        
        increaseHeight = increaseHeightofHeight
        timeRectLabel.isHidden = true
        scene.addChild(timeRect)
        scene.addChild(timeRectLabel)
    }
    
    
    
    func update(quartoAceso: Int) {
        
        if quartoAceso == 0{
            
        }
        else{
            
            actualSize = oldSize
            desireSize = CGFloat(actualSize + (increaseHeight * CGFloat(quartoAceso)))
            if(timeRect.frame.size.width < 400){
                timeRect.removeFromParent()
                timeRect = SKShapeNode(rect: CGRect(x: 40, y: CGFloat(1640), width: desireSize, height: 50))
                timeRect.fillColor = SKColor.green
                timeRect.zPosition = 15
                scene.addChild(timeRect)
                oldSize = desireSize
                
            }
            else if(timeRect.frame.size.width < 620){
                timeRect.removeFromParent()
                
                timeRect = SKShapeNode(rect: CGRect(x: 40, y: CGFloat(1640), width: desireSize, height: 50))
                timeRect.fillColor = SKColor.yellow
                timeRect.zPosition = 15
                scene.addChild(timeRect)
                oldSize = desireSize
                
            }
            else if(timeRect.frame.size.width < 750){
                timeRect.removeFromParent()
                
                timeRect = SKShapeNode(rect: CGRect(x: 40, y: CGFloat(1640), width: desireSize, height: 50))
                timeRect.fillColor = SKColor.red
                timeRect.zPosition = 15
                scene.addChild(timeRect)
                oldSize = desireSize
                
            }
            else if !gameOver{
                scene.fundo.removeFromParent()
                timeRect.removeFromParent()
                gameOver = true
                scene.gameOver()
                
            }
        }
        
        
    }
    
}
