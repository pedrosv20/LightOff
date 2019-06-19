import Foundation
import AVFoundation
import SpriteKit




public class Fase2: SKScene {

    var timeElapsed = 0

    var actualSize = CGFloat(0.0)
    var desireSize = CGFloat(0.0)
    let labelTimer = SKLabelNode()
    var increaseHeight = CGFloat(0)
    var increaseHeightofHeight = CGFloat(20/60.0)

    var timeTeste : Timer!
    var timeRect = SKShapeNode(rect: CGRect(x: -50, y: 0, width: 100, height: 1))
    var timeRectLabel = SKShapeNode(rect: CGRect(x: -320, y: 500, width: 700, height: 50))
    var oldSize = CGFloat(1)
    let node = SKNode()


    let timer1 = SKNode()
    let sound_switchOff1 = SKAudioNode(fileNamed: "soundOff.mp3")
    let sound_switchOn1 = SKAudioNode(fileNamed: "soundOn.mp3")
    var brightness1: SKSpriteNode!
    var light_off1: SKSpriteNode!
    var buttonOn1 = true
    var mini_switch1: SKSpriteNode!
    var boneco1: SKSpriteNode!
    var animationOn1 = false

    let timer2 = SKNode()
    let sound_switchOff2 = SKAudioNode(fileNamed: "soundOff.mp3")
    let sound_switchOn2 = SKAudioNode(fileNamed: "soundOn.mp3")
    var brightness2: SKSpriteNode!
    var light_off2: SKSpriteNode!
    var buttonOn2 = true
    var mini_switch2: SKSpriteNode!
    var boneco2: SKSpriteNode!
    var animationOn2 = false

    let timer3 = SKNode()
    let sound_switchOff3 = SKAudioNode(fileNamed: "soundOff.mp3")
    let sound_switchOn3 = SKAudioNode(fileNamed: "soundOn.mp3")
    var brightness3: SKSpriteNode!
    var light_off3: SKSpriteNode!
    var buttonOn3 = true
    var mini_switch3: SKSpriteNode!
    var boneco3: SKSpriteNode!
    var animationOn3 = false

    let timer4 = SKNode()
    let sound_switchOff4 = SKAudioNode(fileNamed: "soundOff.mp3")
    let sound_switchOn4 = SKAudioNode(fileNamed: "soundOn.mp3")
    var brightness4: SKSpriteNode!
    var light_off4: SKSpriteNode!
    var buttonOn4 = true
    var mini_switch4: SKSpriteNode!
    var boneco4: SKSpriteNode!
    var animationOn4 = false
    var jogando = false




    override public func didMove(to view: SKView) {


        timeRect.fillColor = .green
        timeRect.isHidden = true
        node.position = CGPoint(x: 0, y: 0)
        self.node.addChild(self.timeRect)
        self.addChild(node)
        node.zPosition = 12
        node.zRotation = -3.14/2
        timeRectLabel.fillColor = .white
        timeRectLabel.zPosition = 10
        self.addChild(timeRectLabel)
        increaseHeight = 4 * increaseHeightofHeight
//
//        light_off1 = childNode(withName: "LuzDesligada") as? SKSpriteNode
//        brightness1 = childNode(withName: "brightness") as? SKSpriteNode
//        mini_switch1 = childNode(withName: "mini_switch") as? SKSpriteNode
//        boneco1 = childNode(withName: "Boneco1Fase2") as? SKSpriteNode
//        brightness1.isHidden = true
//        light_off1.isHidden = true
//        mini_switch1.isHidden = true
//        boneco1.position.x = CGFloat(-50)
//        self.addChild(timer1)
//
//        light_off2 = childNode(withName: "LuzDesligada2") as? SKSpriteNode
//        brightness2 = childNode(withName: "brightness2") as? SKSpriteNode
//        mini_switch2 = childNode(withName: "mini_switch2") as? SKSpriteNode
//        boneco2 = childNode(withName: "Boneco2Fase2") as? SKSpriteNode
//        brightness2.isHidden = true
//        light_off2.isHidden = true
//        mini_switch2.isHidden = true
//        boneco2.position.x = CGFloat(320)
//        self.addChild(timer2)
//
//        light_off3 = childNode(withName: "LuzDesligada3") as? SKSpriteNode
//        brightness3 = childNode(withName: "brightness3") as? SKSpriteNode
//        mini_switch3 = childNode(withName: "mini_switch3") as? SKSpriteNode
//        boneco3 = childNode(withName: "Boneco3Fase2") as? SKSpriteNode
//        brightness3.isHidden = true
//        light_off3.isHidden = true
//        mini_switch3.isHidden = true
//        boneco3.position.x = CGFloat(-365)
//        self.addChild(timer3)
//
//        light_off4 = childNode(withName: "LuzDesligada4") as? SKSpriteNode
//        brightness4 = childNode(withName: "brightness4") as? SKSpriteNode
//        mini_switch4 = childNode(withName: "mini_switch4") as? SKSpriteNode
//        boneco4 = childNode(withName: "Boneco4Fase2") as? SKSpriteNode
//        brightness4.isHidden = true
//        light_off4.isHidden = true
//        mini_switch4.isHidden = true
//        boneco4.position.x = CGFloat(385)
//        self.addChild(timer4)
//


        
//
//        self.timeTeste = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timeFase), userInfo: nil, repeats: true)
//


    }
    @objc public func timeFase(){
        timeElapsed += 1
        let min = timeElapsed / 60
        let sec = timeElapsed % 60
        labelTimer.fontName = "lucida console"
        labelTimer.fontSize = 60
        labelTimer.fontColor = .white
        labelTimer.text = "0\(min):\(sec)"
    }
    func startAnimation(boneco: SKSpriteNode, j: Int){
        switch(j){
        case 1:
            if animationOn1{
                return
            }
            let entra = SKAction.moveTo(x: -163, duration: 0.3)
            entra.timingMode = .easeInEaseOut
            let espera = SKAction.wait(forDuration: TimeInterval.random(in: 0...2))
            let sequence = SKAction.sequence([entra, espera])

            boneco.run(sequence){
                self.turnOn(i: 1)
                let sai = SKAction.moveTo(x: -50, duration: 0.3)
                sai.timingMode = .easeInEaseOut
                boneco.run(sai){
                }
            }
        case 2:
            if animationOn2{
                return
            }
            let entra = SKAction.moveTo(x: 206, duration: 0.5)
            entra.timingMode = .easeInEaseOut
            let espera = SKAction.wait(forDuration: TimeInterval.random(in: 0...1))
            let sequence = SKAction.sequence([entra, espera])
            print("foi")
            boneco.run(sequence){
                print("voltou")
                self.turnOn(i: 2)
                let sai = SKAction.moveTo(x: 320, duration: 0.5)
                sai.timingMode = .easeInEaseOut
                boneco.run(sai){
                }
            }
        case 3:
            if animationOn3{
                return
            }
            let entra = SKAction.moveTo(x: -234, duration: 0.5)
            entra.timingMode = .easeInEaseOut
            let espera = SKAction.wait(forDuration: TimeInterval.random(in: 0...1))
            let sequence = SKAction.sequence([entra, espera])

            boneco.run(sequence){
                self.turnOn(i: 3)
                let sai = SKAction.moveTo(x: -365, duration: 0.5)
                sai.timingMode = .easeInEaseOut
                boneco.run(sai){
                }
            }
        case 4:
            if animationOn4{
                return
            }
            let entra = SKAction.moveTo(x: 243, duration: 0.5)
            entra.timingMode = .easeInEaseOut
            let espera = SKAction.wait(forDuration: TimeInterval.random(in: 0...1))
            let sequence = SKAction.sequence([entra, espera])

            boneco.run(sequence){
                self.turnOn(i: 4)
                let sai = SKAction.moveTo(x: 383, duration: 0.5)
                sai.timingMode = .easeInEaseOut
                boneco.run(sai){
                }
            }

        default:
            print("")

        }

    }


    func turnOn(i: Int) {
        switch(i){
        case 1:
            boneco1.color = .clear
            boneco1.colorBlendFactor = 0
            if buttonOn1{
                return
            }
            self.sound_switchOff1.removeAllActions()
            self.sound_switchOff1.removeFromParent()
            timer1.removeAllActions()

            self.brightness1.isHidden = true
            self.light_off1.isHidden = true
            self.mini_switch1.isHidden = true
            self.sound_switchOn1.autoplayLooped = false

            self.sound_switchOn1.run(SKAction.play())
            self.addChild(self.sound_switchOn1)
            increaseHeight += increaseHeightofHeight
            self.buttonOn1 = true
        case 2:
            print("ligou2")
            boneco2.color = .clear
            boneco2.colorBlendFactor = 0
            if buttonOn2{
                return
            }
            self.sound_switchOff2.removeAllActions()
            self.sound_switchOff2.removeFromParent()
            timer2.removeAllActions()


            self.brightness2.isHidden = true
            self.light_off2.isHidden = true
            self.mini_switch2.isHidden = true
            self.sound_switchOn2.autoplayLooped = false

            self.sound_switchOn2.run(SKAction.play())
            self.addChild(self.sound_switchOn2)
            increaseHeight += increaseHeightofHeight
            self.buttonOn2 = true

        case 3:
            boneco3.color = .clear
            boneco3.colorBlendFactor = 0
            if buttonOn3{
                return
            }
            self.sound_switchOff3.removeAllActions()
            self.sound_switchOff3.removeFromParent()
            timer3.removeAllActions()

            self.brightness3.isHidden = true
            self.light_off3.isHidden = true
            self.mini_switch3.isHidden = true
            self.sound_switchOn3.autoplayLooped = false

            self.sound_switchOn3.run(SKAction.play())
            self.addChild(self.sound_switchOn3)
            increaseHeight += increaseHeightofHeight
            self.buttonOn3 = true
        case 4:
            boneco4.color = .clear
            boneco4.colorBlendFactor = 0
            if buttonOn4{
                return
            }
            self.sound_switchOff4.removeAllActions()
            self.sound_switchOff4.removeFromParent()
            timer4.removeAllActions()

            self.brightness4.isHidden = true
            self.light_off4.isHidden = true
            self.mini_switch4.isHidden = true
            self.sound_switchOn4.autoplayLooped = false

            self.sound_switchOn4.run(SKAction.play())
            self.addChild(self.sound_switchOn4)
            increaseHeight += increaseHeightofHeight
            self.buttonOn4 = true
        default:
            print("")
        }
    }


    func turnOff (i: Int)
    {

        switch(i){
        case 1:

            boneco1.color = .black
            boneco1.colorBlendFactor = 0.3
            let randomic1 = Double.random(in: 0...1)
            self.sound_switchOn1.removeAllActions()
            self.sound_switchOn1.removeFromParent()

            timer1.run(SKAction.wait(forDuration: randomic1)) {
                self.startAnimation(boneco: self.boneco1, j: 1)
            }
            self.mini_switch1.isHidden = false
            self.brightness1.isHidden = false
            self.light_off1.isHidden = false
            self.sound_switchOff1.autoplayLooped = false
            self.sound_switchOff1.run(SKAction.play())
            self.addChild(sound_switchOff1)
            increaseHeight -= increaseHeightofHeight
            self.buttonOn1 = false

        case 2:
            print("case 2")
            boneco2.color = .black
            boneco2.colorBlendFactor = 0.3
            let randomic2 = Double.random(in: 0...2)
            self.sound_switchOn2.removeAllActions()
            self.sound_switchOn2.removeFromParent()

            timer2.run(SKAction.wait(forDuration: randomic2)) {
                print("bosta")
                self.startAnimation(boneco: self.boneco2, j: 2)
            }
            self.mini_switch2.isHidden = false
            self.brightness2.isHidden = false
            self.light_off2.isHidden = false
            self.sound_switchOff2.autoplayLooped = false
            self.sound_switchOff2.run(SKAction.play())
            self.addChild(sound_switchOff2)
            increaseHeight -= increaseHeightofHeight
            self.buttonOn2 = false
        case 3:
            boneco3.color = .black
            boneco3.colorBlendFactor = 0.3
            let randomic3 = Double.random(in: 0...2)
            self.sound_switchOn3.removeAllActions()
            self.sound_switchOn3.removeFromParent()

            timer3.run(SKAction.wait(forDuration: randomic3)) {
                self.startAnimation(boneco: self.boneco3, j: 3)
            }
            self.mini_switch3.isHidden = false
            self.brightness3.isHidden = false
            self.light_off3.isHidden = false
            self.sound_switchOff3.autoplayLooped = false
            self.sound_switchOff3.run(SKAction.play())
            self.addChild(sound_switchOff3)
            increaseHeight -= increaseHeightofHeight
            self.buttonOn3 = false

        case 4:
            boneco4.color = .black
            boneco4.colorBlendFactor = 0.3
            let randomic4 = Double.random(in: 0...2)
            self.sound_switchOn4.removeAllActions()
            self.sound_switchOn4.removeFromParent()

            timer4.run(SKAction.wait(forDuration: randomic4)) {
                self.startAnimation(boneco: self.boneco4, j: 4)
            }
            self.mini_switch4.isHidden = false
            self.brightness4.isHidden = false
            self.light_off4.isHidden = false
            self.sound_switchOff4.autoplayLooped = false
            self.sound_switchOff4.run(SKAction.play())
            self.addChild(sound_switchOff4)
            increaseHeight -= increaseHeightofHeight
            self.buttonOn4 = false
        default:
            print("")

        }
    }


    func touchDown(atPoint pos : CGPoint) {
        self.jogando = true
        if brightness1.contains(pos){
            if buttonOn1 {
                turnOff(i: 1)
            }
            else {
                turnOn(i: 1)

            }
        }
        if brightness2.contains(pos){
            if buttonOn2 {
                turnOff(i: 2)
            }
            else{
                turnOn(i: 2)
            }

        }
        if brightness3.contains(pos){
            if buttonOn3 {
                turnOff(i: 3)
            }
            else{
                turnOn(i: 3)
            }

        }
        if brightness4.contains(pos){
            if buttonOn4 {
                turnOff(i: 4)
            }
            else{
                turnOn(i: 4)
            }

        }

    }






    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }


    override public func update(_ currentTime: TimeInterval) {

        if(self.jogando == true){
            timeRect.isHidden = false

            actualSize = oldSize
            desireSize = CGFloat(actualSize + increaseHeight)
            if(timeRect.frame.size.height < 250){
                timeRect.removeFromParent()
                timeRect = SKShapeNode(rect: CGRect(x: -550, y: -320, width: 50, height: desireSize))

                timeRect.fillColor = SKColor.green
                node.addChild(timeRect)
                oldSize = desireSize

            }
            else if(timeRect.frame.size.height < 620){
                timeRect.removeFromParent()
                timeRect = SKShapeNode(rect: CGRect(x: -550, y: -320, width: 50, height: desireSize))

                timeRect.fillColor = SKColor.yellow
                node.addChild(timeRect)
                oldSize = desireSize

            }

            else if(timeRect.frame.size.height < 705){
                timeRect.removeFromParent()
                timeRect = SKShapeNode(rect: CGRect(x: -550, y: -320, width: 50, height: desireSize))

                timeRect.fillColor = SKColor.red
                node.addChild(timeRect)
                oldSize = desireSize

            }
            else{
                //turn()

            }
        }

    }


//    public func turn(){
//      if let scene = GameOver(fileNamed:"GameScene2") {
//      /    // Set the scale mode to scale to fit the window
//       scene.scaleMode = .aspectFit
//
//     Present the scene
//     self.view!.presentScene(scene)
//    }
//    }

}

