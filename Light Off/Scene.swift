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
    var texto = SKLabelNode(text: "You have to keep the lights off")
    var texto2 = SKLabelNode(text: "Tap the rooms to see what happens")
    var texto3 = SKLabelNode(text: "Try as hard as you can!!")
    
    
    override public func didMove(to view: SKView) {

        
     
        
        self.montaCena(andar: 1)
        
        
        if Andar.shared.andar == 0{
            texto.fontColor = .black
            texto3.fontColor = .black
            texto2.fontColor = .black
            
            texto2.position = CGPoint(x: frame.midX, y: 1300)
            texto.position = CGPoint(x: frame.midX, y: 1200)
            texto3.position = CGPoint(x: frame.midX, y: 1100)
            
            texto.fontSize = 25
            texto2.fontSize = 25
            texto3.fontSize = 25
            
            texto.fontName = "8-bit pusab"
            texto2.fontName = "8-bit pusab"
            texto3.fontName = "8-bit pusab"
            
            texto.zPosition = 2
            texto2.zPosition = 2
            texto3.zPosition = 2
            self.addChild(texto)
            self.addChild(texto2)
            self.addChild(texto3)
            
        }
        

        
    }
    
    
    
    func montaCena(andar: Int){
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
    
    func touchDown(atPoint pos : CGPoint) {
        for quarto in listaQuarto{
            if quarto.contains(pos){
                quarto.switchLight()
                
            }
        }
    }
    public func gameOver(){
        viewController.gameOver()
        Andar.shared.tempo = time
        points?.invalidate()
        listaQuarto.forEach { (q) in
            q.removeFromParent()
        }
        listaQuarto.removeAll()
    }
    
    @objc func timer(){
        time += 1
        Andar.shared.pontuacao += 12
        
    }
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
        if comecou != true{
            points = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timer), userInfo: nil, repeats: true)
        }
        comecou = true
        if Andar.shared.andar == 0{
            texto.removeFromParent()
            texto2.removeFromParent()
            texto3.removeFromParent()
        }
        
    }
    
    
    override public func update(_ currentTime: TimeInterval) {
        if comecou != false{
            var quartoAceso = 0
            for quarto in listaQuarto{
                if quarto.buttonOn == true {
                    quartoAceso += 1
                }
            }
            contador.update(quartoAceso: quartoAceso)
            
        }
    }
    
}

