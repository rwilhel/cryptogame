//
//  MenuScene.swift
//  cryptogame
//
//  Created by Rhonda Wilhelmson on 9/17/17.
//  Copyright © 2017 Rhonda Wilhelmson. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let scene = SKScene(fileNamed: "GameScene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
            
            // Present the scene
            self.view?.presentScene(scene, transition: .doorsOpenVertical(withDuration: 1))
        }
    }
}
