//
//  GameViewController.swift
//  Light Off
//
//  Created by APPLE DEVELOPER ACADEMY on 10/04/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let view = self.view as! SKView? {
            let scene = Scene(size: CGSize(width: 828, height:  1792))
            scene.setViewController(viewController: self)
            scene.scaleMode = .aspectFit
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            
        }

    }

    override var shouldAutorotate: Bool {
        return true
    }
    func gameOver(){
        performSegue(withIdentifier: "endGameSegue", sender: self)
    }

    @IBAction func exit(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
