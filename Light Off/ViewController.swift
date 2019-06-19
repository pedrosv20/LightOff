//
//  ViewController.swift
//  Light Off
//
//  Created by Pedro Vargas on 12/06/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import SpriteKit
class ViewController: UIViewController {

    @IBOutlet weak var brigthness: UIImageView!
    @IBOutlet weak var imgSwitch: UIImageView!
    var TImer: Timer?
    override func viewDidLoad() {
        brigthness.isHidden = false
        navigationController?.navigationBar.tintColor = .black
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (Timer) in
            self.performSegue(withIdentifier: "startGame", sender: self)
        }
        
    }
    
    @IBAction func tapSwitch(_ sender: Any) {

       
        
        
    
            
        
        
        
        
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
