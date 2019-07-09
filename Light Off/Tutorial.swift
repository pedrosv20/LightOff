import Foundation
import AVFoundation
import SpriteKit

public class Tutorial: SKScene {
    
    var fundo = SKSpriteNode()
    var listaQuarto = [Quarto]()
    var texto = SKLabelNode(text: "You have to keep the lights off")
    var dedo = SKSpriteNode()
    
    var maxTicks = 60
    var currentTick = 0
    
    override public func didMove(to view: SKView) {
        montaCena()
        dedo = SKSpriteNode(imageNamed: "dedo1")
        dedo.zPosition = 20
        dedo.position = CGPoint(x:  200 + frame.midX, y: 250)
        addChild(dedo)
    }
    
    
    func montaCena(){
        
        
        
        fundo = SKSpriteNode(imageNamed: "tutorial")
        fundo.zPosition = 0
        fundo.setScale(0.5)
        fundo.position = CGPoint(x: frame.midX, y: frame.midY)
        self.addChild(fundo)
        
        
        let quartoDireita = Quarto()
        quartoDireita.setScale(1)
        quartoDireita.position = CGPoint(x: frame.midX, y: -1050 +  frame.midY + CGFloat(550))
        quartoDireita.zPosition = 1
        addChild(quartoDireita)
        listaQuarto.append(quartoDireita)
        
    }
    
    func apertaBotao(){
        let clica = SKAction.rotate(byAngle: 0.5, duration: 0.2)
        let volta = SKAction.rotate(byAngle: -0.5, duration: 0.2)
        clica.timingMode = .easeInEaseOut
        dedo.run(clica) {
            self.dedo.run(volta)
        }
    }
    
    
    func setViewController(viewController : GameViewController){
        
    }
    
    func startContador(){
        texto.fontColor = .black


        texto.position = CGPoint(x: frame.midX, y: 1200)
        texto.fontSize = 24
        texto.fontName = "PressStart2P-Regular"
        texto.zPosition = 2

        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        for i in listaQuarto{
            if i.contains(pos){
                i.switchLight(teste: "teste")
            }
        }
    }
    
    
    
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
        
        
    }

    
    
    override public func update(_ currentTime: TimeInterval) {
        if listaQuarto[0].buttonOn == true{
            UIView.animate(withDuration: 0.2) {
                self.dedo.isHidden = false
            }
            currentTick += 1
            if currentTick >= maxTicks {
                apertaBotao()
                currentTick = 0
            }
        }
        else{
            UIView.animate(withDuration: 0.4) {
               self.dedo.isHidden = true
            }
            
        }
    }
    
}

