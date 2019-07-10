//
//  ViewController.swift
//  Light Off
//
//  Created by Pedro Vargas on 12/06/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
class ViewController: UIViewController{

    @IBOutlet weak var brigthness: UIImageView!
    let somFundo = URL(fileURLWithPath: Bundle.main.path(forResource: "LIGHT OFF MENU", ofType: "m4a")!)
    var audioPlayer = AVAudioPlayer()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        playSound()
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func playSound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: somFundo)
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            audioPlayer.volume = 0.2
        } catch {
            // couldn't load file :(
        }
    }
    
    @IBAction func tapSwitch(_ sender: Any) {
        audioPlayer.stop()
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
