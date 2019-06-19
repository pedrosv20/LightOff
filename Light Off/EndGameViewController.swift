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
        
        #if DEBUG
        Andar.shared.pontuacao = 10000
        #endif
        
        lblPoints.text = "$\(Andar.shared.pontuacao)"
        lblTempo.text = "\(Andar.shared.tempo)s Saving energy"
        
        switch(Andar.shared.andar){
        case 0:
            fundo.image = UIImage(named: "fase1")
            if Andar.shared.pontuacao < 200{
                rectBuy.text = "+1 Floor \("\n") $200"
                buyLbl.isHidden = true
            }
            else{
                rectBuy.backgroundColor = .clear
                rectBuy.text = "Buy 1+ Floor"
                buyLbl.isHidden = false
                
            }

        case 1:
            fundo.image = UIImage(named: "fase2")
            if Andar.shared.pontuacao < 300{
                rectBuy.text = "+1 Floor \("\n") $300"
                buyLbl.isHidden = true
            }
            else{
                rectBuy.backgroundColor = .clear
                rectBuy.text = "Buy 1+ Floor"
                buyLbl.isHidden = false
            }
        case 2:
            fundo.image = UIImage(named: "fase3C")
            if Andar.shared.pontuacao < 600{
                rectBuy.text = "+1 Floor \("\n") $600"
                buyLbl.isHidden = true
            }
            else{
                rectBuy.backgroundColor = .clear
                rectBuy.text = "Buy 1+ Floor"
                buyLbl.isHidden = false
            }
            
        default:
            fundo.image = UIImage(named: "fase4")
            rectBuy.isHidden = true
            nextButton.isHidden  = true
            buyLbl.isHidden = true
            
            
        }
        
    }
    
    @IBAction func restart(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextLevel(_ sender: Any) {
        switch(Andar.shared.andar){
        case 0:
            if Andar.shared.pontuacao >= 200{
                Andar.shared.pontuacao -= 200
                lblPoints.text = "$\(Andar.shared.pontuacao)"
                self.fundo.image = UIImage(named: "fase2")
                Andar.shared.andar += 1
                Andar.shared.dificuldade -= 30
            }
            else{
                return
            }
        case 1:
            if Andar.shared.pontuacao >= 300{
                Andar.shared.pontuacao -= 300
                fundo.image = UIImage(named: "fase3C")
                Andar.shared.andar += 1
                Andar.shared.dificuldade -= 30
                lblPoints.text = "$\(Andar.shared.pontuacao)"
                
            }
            else{
                return
            }
        case 2:
            if Andar.shared.pontuacao >= 600{
                Andar.shared.pontuacao -= 600
                fundo.image = UIImage(named: "fase4")
                Andar.shared.andar += 1
                Andar.shared.dificuldade = 20
                lblPoints.text = "$\(Andar.shared.pontuacao)"
            }
            else{
                return
            }
            
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
