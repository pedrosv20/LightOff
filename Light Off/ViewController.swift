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
    var TImer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func tapSwitch(_ sender: Any) {
        self.performSegue(withIdentifier: "startGame", sender: self)
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
