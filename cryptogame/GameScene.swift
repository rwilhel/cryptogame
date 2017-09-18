//
//  GameScene.swift
//  cryptogame
//
//  Created by Rhonda Wilhelmson on 9/17/17.
//  Copyright © 2017 Rhonda Wilhelmson. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var sky: EndlessBackground!
    var forest: EndlessBackground!
    var fence: EndlessBackground!
    var cryptkeeper: SKSpriteNode!
    var hand: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        sky = EndlessBackground(parent: self, sprite: self.childNode(withName: "sky") as! SKSpriteNode, speed: 1)
        forest = EndlessBackground(parent: self, sprite: self.childNode(withName: "forest") as! SKSpriteNode, speed: 3)
        fence = EndlessBackground(parent: self, sprite: self.childNode(withName: "fence") as! SKSpriteNode, speed: 6)
        
        cryptkeeper = self.childNode(withName: "cryptkeeper") as! SKSpriteNode!
        hand = self.childNode(withName: "hand") as! SKSpriteNode!
        
        physicsWorld.contactDelegate = self
    }
    
    override func update(_ currentTime: TimeInterval) {
        sky.update()
        forest.update()
        fence.update()
        updateHand() 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if cryptkeeper.physicsBody?.velocity.dy == 0 {
            cryptkeeper.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 900))
        }
    }
    
    func updateHand() {
        if hand.position.x + hand.size.width < 0 {
            hand.position.x = self.size.width
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask == 2 | 4 {
            gameOver()
        }
    }
    
    func gameOver () {
        hand.removeAllActions()
        cryptkeeper.removeAllActions()
        
        fence.stop()
        forest.stop()
        sky.stop()
    }
}
