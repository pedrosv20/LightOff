//
//  classe.swift
//  Light Off
//
//  Created by Apple Developer Academy on 2/04/9.
//  Copyright © 209 Pedro Vargas. All rights reserved.
//

import Foundation
import AVFoundation
import SpriteKit

public class Quarto: SKSpriteNode{
    
    
    let timer = SKNode()
    let sound_switchOff = SKAudioNode(fileNamed: "soundOff.mp3")
    let sound_switchOn = SKAudioNode(fileNamed: "soundOn.mp3")
    var brightness: SKSpriteNode
    var light_off: SKSpriteNode
    var background: SKSpriteNode
    var light: SKSpriteNode
    var mini_switch: SKSpriteNode
    var boneco: SKSpriteNode
    var animationOn = false
    var buttonOn = true
    let on = UIImpactFeedbackGenerator(style: .heavy)
    let off = UIImpactFeedbackGenerator(style: .light)
    var item = 0
    
    public override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        
        background = SKSpriteNode(imageNamed: ["quarto1",  "sala1", "banheiro1", "cozinha1"].randomElement()!)
        brightness = SKSpriteNode(imageNamed: "intro")
        light_off = SKSpriteNode(imageNamed: "light_off")
        light = SKSpriteNode(imageNamed: "light")
        mini_switch = SKSpriteNode(imageNamed: "switch_off1")
        boneco = SKSpriteNode(imageNamed: ["boneco1", "boneco2", "boneco3", "boneco4", "boneco5", "boneco6"].randomElement()!)
        
        
        background.position = CGPoint(x: 0, y: 0)
        light.position = CGPoint(x: light.frame.midX, y: 120)
        boneco.position = CGPoint(x: boneco.frame.midX + 140, y: -117)
        light_off.position = CGPoint(x: light.frame.midX, y: 75)
        brightness.size.width = 503
        background.zPosition = 0
        light.zPosition = 1
        brightness.zPosition = 1
        light_off.zPosition = 2
        boneco.zPosition = 2
        
        
        
        brightness.alpha = 0.8
        brightness.isHidden = true
        light_off.isHidden = true
        mini_switch.isHidden = true
        super.init(texture: texture, color: color, size: size)
        
        addChild(background)
        addChild(light)
        addChild(brightness)
        addChild(light_off)
        addChild(mini_switch)
        addChild(boneco)
        addChild(timer)
        
    }
    
    
    private func startAnimation(){
        if buttonOn{
            return
        }
        let entra = SKAction.moveTo(x: 40, duration: 0.5)
        entra.timingMode = .easeInEaseOut
        let espera = SKAction.wait(forDuration: TimeInterval.random(in: 0...1))
        let sequence = SKAction.sequence([entra, espera])
        
        boneco.run(sequence){
            self.turnOn()
            self.on.impactOccurred()
            let sai = SKAction.moveTo(x: 140, duration: 0.5)
            sai.timingMode = .easeInEaseOut
            self.boneco.run(sai){
                
            }
        }
    }
    
    private func turnOn() {
        boneco.color = .clear
        boneco.colorBlendFactor = 0
        if buttonOn{
            return
        }
        self.sound_switchOff.removeAllActions()
        self.sound_switchOff.removeFromParent()
        timer.removeAllActions()
        
        self.brightness.isHidden = true
        self.light_off.isHidden = true
        self.mini_switch.isHidden = true
        self.sound_switchOn.autoplayLooped = false
        
        self.sound_switchOn.run(SKAction.play())
        self.addChild(self.sound_switchOn)
        buttonOn = true
        
    }
    
    
    private func turnOff ()
    {
        boneco.color = .black
        boneco.colorBlendFactor = 0.3
        let randomic = Double.random(in: 0...0.5)
        self.sound_switchOn.removeAllActions()
        self.sound_switchOn.removeFromParent()
        timer.run(SKAction.wait(forDuration: randomic)) {
            self.startAnimation()
        }
        self.mini_switch.isHidden = true
        self.brightness.isHidden = false
        self.light_off.isHidden = false
        self.sound_switchOff.autoplayLooped = false
        self.sound_switchOff.run(SKAction.play())
        self.addChild(sound_switchOff)
        buttonOn = false
        off.impactOccurred()
        
        
    }
    
    public func switchLight(teste: String){
        
        if buttonOn{
            turnOff()
        }
        else{
            turnOn()
        }
    }
    
    public func switchLight(teste: Int){
        if item >= 1{
            item = 0
            if buttonOn{
                turnOff()
            }
        }
        else{
            if !buttonOn{
                turnOn()
            }
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (Timer) in
                self.item = 0
            }
            item += 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    
    
}
