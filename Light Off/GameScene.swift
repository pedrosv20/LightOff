//import Foundation
//import AVFoundation
//import SpriteKit
//
//
//
//
//public class Fase1: SKScene {
//    
//    
//    
//    let timer1 = SKNode()
//    
//    
//    let node = SKNode()
//    let sound_switchOff1 = SKAudioNode(fileNamed: "soundOff.mp3")
//    let sound_switchOn1 = SKAudioNode(fileNamed: "soundOn.mp3")
//    
//    var brightness1: SKSpriteNode!
//    var light_off1: SKSpriteNode!
//    var buttonOn1 = true
//    var mini_switch1: SKSpriteNode!
//    var boneco1: SKSpriteNode!
//    var animationOn = false
//    
//    
//    
//    override public func didMove(to view: SKView) {
//        
//        light_off1 = childNode(withName: "LuzDesligada") as? SKSpriteNode
//        brightness1 = childNode(withName: "brightness") as? SKSpriteNode
//        mini_switch1 = childNode(withName: "mini_switch") as? SKSpriteNode
//        boneco1 = childNode(withName: "BobFase1") as? SKSpriteNode
//        brightness1.isHidden = true
//        light_off1.isHidden = true
//        mini_switch1.isHidden = true
//        boneco1.position.x = CGFloat(132)
//        self.addChild(timer1)
//        
//        
//        
//        
//    }
//    
//    func startAnimation(boneco: SKSpriteNode){
//        if buttonOn1{
//            return
//        }
//        let entra = SKAction.moveTo(x: 37, duration: 0.5)
//        entra.timingMode = .easeInEaseOut
//        let espera = SKAction.wait(forDuration: TimeInterval.random(in: 0...2))
//        let sequence = SKAction.sequence([entra, espera])
//        
//        boneco.run(sequence){
//            self.turnOn()
//            let sai = SKAction.moveTo(x: 132, duration: 0.5)
//            sai.timingMode = .easeInEaseOut
//            boneco.run(sai){
//                
//            }
//        }
//    }
//    func turnOn() {
//        boneco1.color = .clear
//        boneco1.colorBlendFactor = 0
//        if buttonOn1{
//            return
//        }
//        self.sound_switchOff1.removeAllActions()
//        self.sound_switchOff1.removeFromParent()
//        timer1.removeAllActions()
//        
//        self.brightness1.isHidden = true
//        self.light_off1.isHidden = true
//        self.mini_switch1.isHidden = true
//        self.sound_switchOn1.autoplayLooped = false
//        
//        self.sound_switchOn1.run(SKAction.play())
//        self.addChild(self.sound_switchOn1)
//        
//        self.buttonOn1 = true
//        
//    }
//    
//    
//    func turnOff ()
//    {
//        boneco1.color = .black
//        boneco1.colorBlendFactor = 0.3
//        //boneco1.texture = SKTexture(imageNamed: "boneco1shade.png")
//        let randomic1 = Double.random(in: 0...2)
//        self.sound_switchOn1.removeAllActions()
//        self.sound_switchOn1.removeFromParent()
//        
//        timer1.run(SKAction.wait(forDuration: randomic1)) {
//            self.startAnimation(boneco: self.boneco1)
//        }
//        self.mini_switch1.isHidden = false
//        self.brightness1.isHidden = false
//        self.light_off1.isHidden = false
//        self.sound_switchOff1.autoplayLooped = false
//        self.sound_switchOff1.run(SKAction.play())
//        self.addChild(sound_switchOff1)
//        self.buttonOn1 = false
//        
//        
//    }
//    
//    
//    func touchDown(atPoint pos : CGPoint) {
//        if buttonOn1 {
//            turnOff()
//        }
//        else if !buttonOn1 {
//            turnOn()
//            
//        }
//        
//        
//    }
//    
//    
//    
//    
//    
//    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { touchDown(atPoint: t.location(in: self)) }
//    }
//    
//    
//    override public func update(_ currentTime: TimeInterval) {
//        
//        
//    }
//    
//    
//    //public func turn(){
//      //  if let scene = GameOver(fileNamed:"GameScene2") {
//      //  /    // Set the scale mode to scale to fit the window
//         //   scene.scaleMode = .aspectFit
//            
//            // Present the scene
//           // self.view!.presentScene(scene)
//        //}
//    //}
//}
//
