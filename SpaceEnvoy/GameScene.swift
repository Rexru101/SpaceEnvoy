//
//  GameScene.swift
//  SpaceEnvoy
//
//  Created by Rexru101 on 11/12/14.
//  Copyright (c) 2014 Rexru101. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    //let spaceShip = SKSpriteNode(imageNamed:"spaceShipSpriteUp")
    //let spaceShip = SpaceShip(imageNamed: "spaceShipSpriteUp")//
    var movingSpaceShip: SpaceShip?
    var lastUpdateTime: NSTimeInterval = 0.0
    var dt: NSTimeInterval = 0.0

    override func didMoveToView(view: SKView) {
        let spaceShip = SpaceShip(imageNamed: "spaceShipSpriteUp")
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "Hello, World!";
        //myLabel.fontSize = 65;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        //self.addChild(myLabel)
        
        //let sprite = SKSpriteNode(imageNamed:"Spaceship")
        spaceShip.name = "spaceShip"
        let bg = SKSpriteNode(imageNamed: "starBGBlack")
        
        bg.position = CGPoint(x: 504.0, y: 428.39999999)
        bg.xScale = 0.3
        bg.yScale = 0.5
        self.addChild(bg)
        
        spaceShip.position = CGPoint(x:504.0, y:38.39999999)
        self.addChild(spaceShip)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        /*
        let location = touches.anyObject()!.locationInNode(self)
        let node = nodeAtPoint(location)
        
        if node.name? == "SpaceShip" {
        let spaceShip = node as SpaceShip
        spaceShip.addMovingPoint(location)
        movingSpaceShip = spaceShip
        }
        
        for touch: AnyObject in touches {
        let location = touch.locationInNode(self)
        
        //let sprite = SKSpriteNode(imageNamed:"Spaceship")
        //sprite.xScale = 1
        //sprite.yScale = 1
        //println(location)
        //sprite.position.x = 0
        //sprite.position.y = 0
        //sprite.position = CGPoint(x:472.0, y:281.600006103516)
        //sprite.position = location
        
        let action = SKAction.moveTo(location, duration: 2)
        
        sprite.runAction(SKAction.repeatActionForever(action))
        
        //self.addChild(sprite)
        }
        */
    }
   
    override func update(currentTime: CFTimeInterval)
    {
        dt = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        
        enumerateChildNodesWithName("spaceShip", usingBlock: {node, stop in
            let spaceShip = node as SpaceShip
            spaceShip.move(self.dt)
        })
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent)
    {
        let location = touches.anyObject()!.locationInNode(scene)
        
        if let spaceShip = movingSpaceShip
        {
            spaceShip.addMovingPoint(location)
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent)
    {
        movingSpaceShip = nil
    }
}