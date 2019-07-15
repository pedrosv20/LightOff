import Foundation
import AVFoundation
import SpriteKit

public class Scene: SKScene {
    var listaQuarto = [Quarto]()
    var contador : Contador!
    var viewController : GameViewController!
    var fundo = SKSpriteNode()
    var comecou = false
    var points: Timer?
    var time = 0
    var somFundo = SKAudioNode(fileNamed: "LIGHT OFF GAME.m4a")
    var texto = SKLabelNode(text: "Keep the lights OFF!")
    var dedo = SKSpriteNode()
    var maxTicks = 30
    var tick = 0
    var node = SKSpriteNode()
    
    
    func cliqueDedo(andar: Int){
        if andar == 0{
            print("era pra ter ido")
            dedo = SKSpriteNode(imageNamed: "dedo2")
            dedo.zPosition = 21
            dedo.position = CGPoint(x:  300 + frame.midX, y: 270)
            texto.position = CGPoint(x:  300 + frame.midX, y: 350)
            texto.fontColor = .yellow
            texto.fontName = "PressStart2P-Regular"
            texto.fontSize = 24
            node.addChild(dedo)
            node.addChild(texto)
            node.zPosition = 30
            addChild(node)
            node.isHidden = false
        }
    }
    
    override public func willMove(from view: SKView) {
        comecou = false
    }
    
    
    
    func montaCena(){
        somFundo.autoplayLooped = true
        somFundo.run(SKAction.changeVolume(to: Float(0.2), duration: 0))
        somFundo.run(SKAction.play())
        
        self.addChild(self.somFundo)
        time = 0
        fundo.zPosition = 0
        
        switch(Andar.shared.andar){
        case 0:
            fundo = SKSpriteNode(imageNamed: "fase1")
        case 1:
            fundo = SKSpriteNode(imageNamed: "fase2")
        case 2:
            fundo = SKSpriteNode(imageNamed: "fase3C")
        case 3:
            fundo = SKSpriteNode(imageNamed: "fase4")
        default:
            print("")
            
        }
        fundo.position = CGPoint(x: frame.midX, y: frame.midY)
        self.addChild(fundo)
        
        if Andar.shared.andar == 3{
            for i in 0...Andar.shared.andar {
                let quartoEsquerda = Quarto()
                quartoEsquerda.setScale(0.73)
                quartoEsquerda.position = CGPoint(x: frame.midX - 190 , y: -1050 + frame.midY + CGFloat(300 + i * 300))
                quartoEsquerda.zPosition = 1
                addChild(quartoEsquerda)
                let quartoDireita = Quarto()
                quartoDireita.setScale(0.73)
                quartoDireita.position = CGPoint(x: frame.midX + 185, y: -1050 +  frame.midY + CGFloat(300 + i * 300))
                quartoDireita.zPosition = 1
                addChild(quartoDireita)
                listaQuarto.append(quartoEsquerda)
                listaQuarto.append(quartoDireita)
                
            }
        }
        else{
            for i in 0...Andar.shared.andar {
                let quartoEsquerda = Quarto()
                quartoEsquerda.setScale(0.73)
                quartoEsquerda.position = CGPoint(x: frame.midX - 190 , y: -800 + frame.midY + CGFloat(300 + i * 300))
                quartoEsquerda.zPosition = 1
                addChild(quartoEsquerda)
                let quartoDireita = Quarto()
                quartoDireita.setScale(0.73)
                quartoDireita.position = CGPoint(x: frame.midX + 185, y: -800 +  frame.midY + CGFloat(300 + i * 300))
                quartoDireita.zPosition = 1
                addChild(quartoDireita)
                listaQuarto.append(quartoEsquerda)
                listaQuarto.append(quartoDireita)
                
            }
        }
        contador = Contador(scene: self)
    }
    
    
    func setViewController(viewController : GameViewController){
        self.viewController = viewController
    }
    
    func startContador(){
        if comecou != true{
            points = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timer), userInfo: nil, repeats: true)
            contador.timeRectLabel.isHidden = false
            comecou = true
        }
    }
    
    func apertaBotao(){
        print("vamo")
        let clica = SKAction.rotate(byAngle: 0.5, duration: 0.2)
        let volta = SKAction.rotate(byAngle: -0.5, duration: 0.2)
        clica.timingMode = .easeInEaseOut
        dedo.run(clica) {
            self.dedo.run(volta)
        }
    }
    public func gameOver(){
        
        somFundo.removeFromParent()
        somFundo.removeAllActions()
        viewController.gameOver()
        node.removeAllChildren()
        node.removeFromParent()
        Andar.shared.tempo = time
        points?.invalidate()
        listaQuarto.removeAll()
        comecou = false
        listaQuarto.forEach { (q) in
            q.removeFromParent()
        }
    }
    
    @objc func timer(){
        time += 1
        Andar.shared.pontuacao += 12
        Andar.shared.money += 12
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        for quarto in listaQuarto{
            if quarto.contains(pos){
                startContador()
                node.isHidden = true
                quarto.switchLight(teste: "toqueNormal")
                //                    if (quarto.background.texture!.description.contains("Prancheta 48")){
                //                        print("maluco")
                //                        quarto.switchLight(teste: 1)
                //                    }
                //                    else{
                //                        quarto.switchLight(teste: "oi")
                //                    }
                //
                //                print("doidao")
            }
        }
    }
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
       
        
        
    }
    
    
    override public func update(_ currentTime: TimeInterval) {
        if Andar.shared.andar == 0{
            tick += 1
            if tick >= maxTicks{
                apertaBotao()
                tick = 0
            }
        }
        if comecou != false{
            contador.timeRect.isHidden = false
            var quartoAceso = 0
            for quarto in listaQuarto{
                if quarto.buttonOn == true {
                    quartoAceso += 1
                }
            }
            
            contador.update(quartoAceso: quartoAceso)
            
        }
        else{
            contador.timeRect.isHidden = true
        }
    }
    
}

