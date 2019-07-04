//
//  EndGameViewController.swift
//  Light Off
//
//  Created by Pedro Vargas on 24/04/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {
    
    @IBOutlet weak var lblPoints: UILabel!
    @IBOutlet weak var lblTempo: UILabel!
    @IBOutlet weak var rectBuy: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var buyLbl: UILabel!
    @IBOutlet weak var totalMoney: UILabel!
    
    @IBOutlet weak var fundo: UIImageView!
    @IBOutlet weak var restartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (Timer) in
            self.restartButton.isEnabled = true
            self.nextButton.isEnabled = true
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        restartButton.isEnabled = false
        nextButton.isEnabled = false
        buyLbl.alpha = 0
        
//        #if DEBUG
//        Andar.shared.pontuacao = 10000
//        #endif
        
        totalMoney.text = "$\(Andar.shared.pontuacao)"
        lblPoints.text = "+$\(Andar.shared.money)"
        lblTempo.text = "\(Andar.shared.tempo) seconds saving energy"
        verificaBotao()
        
        
    }
    
    func verificaBotao(){
        switch(Andar.shared.andar){
        case 0:
            fundo.image = UIImage(named: "fase1")
            if Andar.shared.pontuacao < 200{
                nextButton.tintColor = .gray
                nextButton.alpha = 0.5
                rectBuy.text = "+1 Floor \("\n") $200"
                
            }
            else{
                nextButton.tintColor = .black
                nextButton.alpha = 1
                rectBuy.text = "+1 Floor \("\n") $200"
                
            }
            
        case 1:
            fundo.image = UIImage(named: "fase2")
            if Andar.shared.pontuacao < 300{
                
                nextButton.tintColor = .gray
                nextButton.alpha = 0.5
                rectBuy.text = "+1 Floor \("\n") $300"
            }
            else{
                nextButton.tintColor = .black
                nextButton.alpha = 1
                rectBuy.text = "+1 Floor \("\n") $300"
                
            }
        case 2:
            fundo.image = UIImage(named: "fase3C")
            if Andar.shared.pontuacao < 600{
                nextButton.tintColor = .gray
                nextButton.alpha = 0.5
                rectBuy.text = "+1 Floor \("\n") $600"
                buyLbl.text = "You don't have money for this!"
            }
            else{
                nextButton.tintColor = .black
                nextButton.alpha = 1
                rectBuy.text = "+1 Floor \("\n") $600"
                
            }
        default:
            fundo.image = UIImage(named: "fase4")
            rectBuy.isHidden = true
            nextButton.isHidden  = true
            buyLbl.isHidden = true
            
            
        }
    }
    
    @IBAction func restart(_ sender: Any) {
        Andar.shared.money = 0
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextLevel(_ sender: Any) {
        
        switch(Andar.shared.andar){
        case 0:
            if Andar.shared.pontuacao >= 200{
                Andar.shared.pontuacao -= 200
                totalMoney.text = "$\(Andar.shared.pontuacao)"
                lblPoints.text = "+ $\(Andar.shared.money)"
                self.fundo.image = UIImage(named: "fase2")
                Andar.shared.andar += 1
                Andar.shared.dificuldade -= 30
                verificaBotao()
            }
            else{
                self.buyLbl.text = "You don't have money for this!"
                self.buyLbl.alpha = 0
                UIView.animate(withDuration: 0.4, animations: {
                    self.buyLbl.alpha  = 1
                }) { _ in
                    UIView.animate(withDuration: 1, animations: {
                        self.buyLbl.alpha  = 0
                        
                    })
                }
                return
            }
        case 1:
            if Andar.shared.pontuacao >= 300{
                Andar.shared.pontuacao -= 300
                fundo.image = UIImage(named: "fase3C")
                Andar.shared.andar += 1
                Andar.shared.dificuldade -= 30
                totalMoney.text = "$\(Andar.shared.pontuacao)"
                lblPoints.text = "+ $\(Andar.shared.money)"
                verificaBotao()
                
            }
            else{
                self.buyLbl.text = "You don't have money for this!"
                self.buyLbl.alpha = 0
                UIView.animate(withDuration: 0.4, animations: {
                    self.buyLbl.alpha  = 1
                }) { _ in
                    UIView.animate(withDuration: 1, animations: {
                        self.buyLbl.alpha  = 0
                        
                    })
                }
                return
            }
        case 2:
            if Andar.shared.pontuacao >= 600{
                Andar.shared.pontuacao -= 600
                fundo.image = UIImage(named: "fase4")
                Andar.shared.andar += 1
                Andar.shared.dificuldade = 20
                totalMoney.text = "$\(Andar.shared.pontuacao)"
                lblPoints.text = "+ $\(Andar.shared.money)"
                verificaBotao()
            }
            else{
                self.buyLbl.text = "You don't have money for this!"
                self.buyLbl.alpha = 0
                UIView.animate(withDuration: 0.4, animations: {
                    self.buyLbl.alpha  = 1
                }) { _ in
                    UIView.animate(withDuration: 1, animations: {
                        self.buyLbl.alpha  = 0
                        
                    })
                }
                return
            }
//        case 3:
//            if Andar.shared.pontuacao >= 1000{
//                Andar.shared.pontuacao -= 1000
//                fundo.image = UIImage(named: "fase3")
//                Andar.shared.andar = 0
//                Andar.shared.dificuldade = 80
//                totalMoney.text = "$\(Andar.shared.pontuacao)"
//                lblPoints.text = "+ $\(Andar.shared.money)"
//                Andar.shared.nivel = 2
//                verificaBotao()
//
//            }
        default:
            print("")
            
            
        }
    }

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
