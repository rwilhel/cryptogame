//
//  GameScene.swift
//  cryptogame
//
//  Created by Rhonda Wilhelmson on 9/17/17.
//  Copyright © 2017 Rhonda Wilhelmson. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var sky: EndlessBackground!
    var forest: EndlessBackground!
    var fence: EndlessBackground!
    var cryptkeeper: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        sky = EndlessBackground(parent: self, sprite: self.childNode(withName: "sky") as! SKSpriteNode, speed: 1)
        forest = EndlessBackground(parent: self, sprite: self.childNode(withName: "forest") as! SKSpriteNode, speed: 3)
        fence = EndlessBackground(parent: self, sprite: self.childNode(withName: "fence") as! SKSpriteNode, speed: 6)
        
        cryptkeeper = self.childNode(withName: "cryptkeeper") as! SKSpriteNode!
    }
    
    override func update(_ currentTime: TimeInterval) {
        sky.update()
        forest.update()
        fence.update()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if cryptkeeper.physicsBody?.velocity.dy == 0 {
            cryptkeeper.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 900))
        }
    }
}
