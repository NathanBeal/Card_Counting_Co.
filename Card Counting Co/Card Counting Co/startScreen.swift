//
//  gameScreen.swift
//  Card Counting Co.
//
//  Created by ADAMLANE on 6/7/19.
//  Copyright © 2019 WackyClown. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class startScreen: SKScene
{
    //Sprite Nodes
    let background = SKSpriteNode(imageNamed: "background")
    let author = SKSpriteNode(imageNamed: "StudioTitle")
    let mascot = SKSpriteNode(imageNamed: "SilhoutteClown")
    let chip1 = SKSpriteNode(imageNamed: "RedChip")
    let chip2 = SKSpriteNode(imageNamed: "RedChip")
    let chip3 = SKSpriteNode(imageNamed: "BlackChip")
    let chip4 = SKSpriteNode(imageNamed: "BlackChip")
    let chip5 = SKSpriteNode(imageNamed: "BlackChip")
    let chip6 = SKSpriteNode(imageNamed: "BlackChip")
    let chip7 = SKSpriteNode(imageNamed: "BlueChip")
    let aceHeart = SKSpriteNode(imageNamed: "Heart - 14")
    let aceDiamond = SKSpriteNode(imageNamed: "Diamond - 14")
    let aceSpade = SKSpriteNode(imageNamed: "Spades - 14")
    let aceClub = SKSpriteNode(imageNamed: "Clubs - 14")
    
    //
    var gameManual = CGRect(); var gManual = SKShapeNode()
    var gameSimulated = CGRect(); var gSimulated = SKShapeNode()
    
    //Unsubstantatiated Variables
    let ttpLabel = SKLabelNode()
    let manualPlay = SKLabelNode()
    let simulatedPlay = SKLabelNode()
    let gameTitle = SKLabelNode()
    let play = SKLabelNode()
    var card1 = SKSpriteNode()
    var card2 = SKSpriteNode()
    
    //Variables
    var aceSelect:[SKSpriteNode] = []
    var Scaler = CGFloat()
    var timesTapped = 0
    
    //Used for boundaries
    let gameArea: CGRect
    override init(size: CGSize)
    {
        gameArea = CGRect(x: 0, y: 0, width: defaults.double(forKey: "FrameWidth"), height: defaults.double(forKey: "FrameHeight"))
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView)
    {
        defaults.set(-1, forKey: "gameMode")
        defaults.set(-1, forKey: "bestHand")
        
        //Scalers
        if (defaults.double(forKey: "FrameWidth") == 896 && defaults.double(forKey: "FrameHeight") == 414) || (defaults.double(forKey: "FrameWidth") == 375 && defaults.double(forKey: "FrameHeight") == 812)
        {
            Scaler = 1
        }else{
            if (defaults.double(forKey: "FrameWidth") == 736 && defaults.double(forKey: "FrameHeight") == 414)
            {
                Scaler = CGFloat(0.86)
            }else{
                Scaler = CGFloat(scaleModifier)
            }
        }
        
        //Background
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        //Title
        gameTitle.fontName = "Copperplate-Light"
        gameTitle.fontColor = SKColor.white
        gameTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        gameTitle.text = "Card Counting Co."
        gameTitle.fontSize = CGFloat(60 * Scaler)
        gameTitle.position = CGPoint(x: self.size.width * 0.50, y: 7.75 * self.size.height/10)
        gameTitle.zPosition = 1
        self.addChild(gameTitle)
        
        //Tap to play
        ttpLabel.fontName = "Copperplate-Light"
        ttpLabel.text = "Tap to Progress"
        ttpLabel.fontSize = CGFloat(38 * Scaler)
        ttpLabel.fontColor = SKColor.white
        ttpLabel.position = CGPoint(x: self.size.width/2, y: 1.5 * self.size.height/10)
        ttpLabel.zPosition = 10
        ttpLabel.alpha = 0
        
        //Cards
        aceSelect = [aceHeart,aceClub,aceDiamond,aceSpade]
        card1 = aceSelect.randomElement()!
        card2 = aceSelect.randomElement()!
        while card1 == card2
        {
            print("here")
            card2 = aceSelect.randomElement()!
        }
        
        card1.setScale(CGFloat(0.20 * Scaler))
        card1.position = CGPoint(x: 7.4 * self.size.width/16, y: -1.5 * self.size.height/10)
        card1.zPosition = 1
        self.addChild(card1)
        
        card2.setScale(CGFloat(0.20 * Scaler))
        card2.position = CGPoint(x: 8.6 * self.size.width/16, y: -1.5 * self.size.height/10)
        card2.zPosition = 2
        self.addChild(card2)
        
        //Labels
        gameManual = CGRect(x: 3.75 * self.size.width/10, y: 2.25 * self.size.height/10, width: 2.5 * self.size.width/10, height: 0.8 * self.size.height/10)
        gameSimulated = CGRect(x: 3.5 * self.size.width/10, y: 1 * self.size.height/10, width: 3.0 * self.size.width/10, height: 0.8 * self.size.height/10)
        
        gManual = SKShapeNode.init(rect: gameManual)
        gManual.fillColor = SKColor.white
        gManual.zPosition = 5
        gManual.strokeColor = SKColor.black
        gManual.lineWidth = 1
        gManual.alpha = 0
        self.addChild(gManual)
        
        gSimulated = SKShapeNode.init(rect: gameSimulated)
        gSimulated.fillColor = SKColor.white
        gSimulated.zPosition = 5
        gSimulated.strokeColor = SKColor.black
        gSimulated.lineWidth = 1
        gSimulated.alpha = 0
        self.addChild(gSimulated)
        
        manualPlay.fontName = "Copperplate-Light"
        manualPlay.fontColor = SKColor.black
        manualPlay.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        manualPlay.text = "manual game"
        manualPlay.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        manualPlay.fontSize = CGFloat(30 * Scaler)
        manualPlay.position = CGPoint(x: self.size.width/2, y: gameManual.midY)
        manualPlay.zPosition = 6
        manualPlay.alpha = 0
        
        simulatedPlay.fontName = "Copperplate-Light"
        simulatedPlay.fontColor = SKColor.black
        simulatedPlay.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        simulatedPlay.text = "simulated game"
        simulatedPlay.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        simulatedPlay.fontSize = CGFloat(30 * Scaler)
        simulatedPlay.position = CGPoint(x: self.size.width/2, y: gameSimulated.midY)
        simulatedPlay.zPosition = 6
        simulatedPlay.alpha = 0
        
        self.addChild(manualPlay)
        self.addChild(simulatedPlay)
        
        //Chips
        chip1.setScale(CGFloat(0.5 * Scaler))
        chip1.position = CGPoint(x: 1 * self.size.width/10, y: 12 * self.size.height/10)
        chip1.zPosition = 2
        self.addChild(chip1)
        chip2.setScale(CGFloat(0.5 * Scaler))
        chip2.position = CGPoint(x: 1.4 * self.size.width/10, y: 12 * self.size.height/10)
        chip2.zPosition = 2
        self.addChild(chip2)
        chip3.setScale(CGFloat(0.5 * Scaler))
        chip3.position = CGPoint(x: 1.4 * self.size.width/10, y: 12 * self.size.height/10)
        chip3.zPosition = 2
        self.addChild(chip3)
        chip4.setScale(CGFloat(0.5 * Scaler))
        chip4.position = CGPoint(x: 1.4 * self.size.width/10, y: 12 * self.size.height/10)
        chip4.zPosition = 2
        self.addChild(chip4)
        chip5.setScale(CGFloat(0.5 * Scaler))
        chip5.position = CGPoint(x: 1.4 * self.size.width/10, y: 12 * self.size.height/10)
        chip5.zPosition = 2
        self.addChild(chip5)
        chip6.setScale(CGFloat(0.5 * Scaler))
        chip6.position = CGPoint(x: 1.4 * self.size.width/10, y: 12 * self.size.height/10)
        chip6.zPosition = 2
        self.addChild(chip6)
        chip7.setScale(CGFloat(0.5 * Scaler))
        chip7.position = CGPoint(x: 1.4 * self.size.width/10, y: 12 * self.size.height/10)
        chip7.zPosition = 3
        self.addChild(chip7)
        
        moveCards()
        
        //self.run(SKAction.wait(forDuration: 1.0))
    }
    
    func moveCards()
    {
        //Random X and Y Movements
        let randomX1 = CGFloat.random(in: -self.size.width/25 ... self.size.width/25)
        let randomX2 = CGFloat.random(in: -self.size.width/25 ... self.size.width/25)
        
        let randomY1 = 6.0/10 * self.size.height + CGFloat.random(in: -self.size.width/25 ... self.size.width/25)
        let randomY2 = 6.0/10 * self.size.height + CGFloat.random(in: -self.size.width/25 ... self.size.width/25)

        //Applies to Card
        let moveAce1 = SKAction.moveBy(x: randomX1, y: randomY1, duration: 0.75)
        let moveAce2 = SKAction.moveBy(x: randomX2, y: randomY2, duration: 0.75)
        
        //Moves card
        card1.run(moveAce1)
        card2.run(moveAce2)
        
        let waitForWin = SKAction.wait(forDuration: 1.4)
        let win = SKAction.run(winPot)
        let waitForNext = SKAction.wait(forDuration: 1.0)
        let next = SKAction.run(ableToTap)
        let winSequence = SKAction.sequence([waitForWin, win, waitForNext, next])
        self.run(winSequence)
    }
    
    func winPot()
    {
        //Random X Coordinate Generation
        let randomX1 = CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomX2 = CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomX3 = CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomX4 = CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomX5 = CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomX6 = CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomX7 = CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        
        //Random Y Coordinate Generation
        let randomY1 = -9/10 * self.size.height + CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomY2 = -9/10 * self.size.height + CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomY3 = -8.6/10 * self.size.height + CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomY4 = -8.7/10 * self.size.height + CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomY5 = -8.8/10 * self.size.height + CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomY6 = -9.4/10 * self.size.height + CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        let randomY7 = -9/10 * self.size.height + CGFloat.random(in: -self.size.width/18 ... self.size.width/18)
        
        //Move Chips according to Randomly Gnerated Coordinates
        let moveChip1 = SKAction.moveBy(x: randomX1, y: randomY1, duration: 0.8)
        let moveChip2 = SKAction.moveBy(x: randomX2, y: randomY2, duration: 0.8)
        let moveChip3 = SKAction.moveBy(x: randomX3, y: randomY3, duration: 0.8)
        let moveChip4 = SKAction.moveBy(x: randomX4, y: randomY4, duration: 0.8)
        let moveChip5 = SKAction.moveBy(x: randomX5, y: randomY5, duration: 0.8)
        let moveChip6 = SKAction.moveBy(x: randomX6, y: randomY6, duration: 0.8)
        let moveChip7 = SKAction.moveBy(x: randomX7, y: randomY7, duration: 0.8)
        
        chip1.run(moveChip1)
        chip2.run(moveChip2)
        chip3.run(moveChip3)
        chip4.run(moveChip4)
        chip5.run(moveChip5)
        chip6.run(moveChip6)
        chip7.run(moveChip7)
    }
    
    func ableToTap()
    {
        let fadeInFadeOut = SKAction.sequence([SKAction.fadeIn(withDuration: 1.0),SKAction.fadeOut(withDuration: 1.0)])
        ttpLabel.run(SKAction.repeatForever(fadeInFadeOut))
        
        if timesTapped < 1
        {
            self.addChild(ttpLabel)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch: AnyObject in touches
        {
            let pointOfTouch = touch.location(in: view)
            
            if timesTapped >= 1 &&  defaults.double(forKey: "gameMode") == -1
            {
                if (pointOfTouch.x > self.size.width/2 - gameManual.width/2 && pointOfTouch.x < self.size.width/2 + gameManual.width/2) && (pointOfTouch.y > 7.75 * self.size.height/10 - gameManual.height/2 && pointOfTouch.y < 7.75 * self.size.height/10 + gameManual.height/2)
                {
                    defaults.set(0, forKey: "gameMode")
                    defaults.set(0, forKey: "tempGameMode")
                    fadeOut()
                }
                
                if (pointOfTouch.x > self.size.width/2 - gameSimulated.width/2 && pointOfTouch.x < self.size.width/2 + gameSimulated.width/2) && (pointOfTouch.y > 9 * self.size.height/10 - gameSimulated.height/2 && pointOfTouch.y < 9 * self.size.height/10 + gameSimulated.height/2)
                {
                    defaults.set(1, forKey: "gameMode")
                    defaults.set(1, forKey: "tempGameMode")
                    fadeOut()
                }
            }
            
            //Times Tapped, 1 time speeds up process
            if timesTapped == 0
            {
                let fadeIn = SKAction.fadeIn(withDuration: 0.75)
                timesTapped += 1
                
                //Set up for
                ttpLabel.removeAllActions()
                ttpLabel.removeFromParent()
                manualPlay.run(fadeIn)
                simulatedPlay.run(fadeIn)
                gManual.run(fadeIn)
                gSimulated.run(fadeIn)
                
                //Prevent Multi tap processsing
                self.run(SKAction.wait(forDuration: 0.05))
            }
            
            
            self.run(SKAction.wait(forDuration: 0.05))
            //print(timesTapped)
        }
    }
    
    func fadeOut()
    {
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        gameTitle.run(fadeOut); ttpLabel.run(fadeOut)
        chip1.run(fadeOut); chip2.run(fadeOut); chip3.run(fadeOut); chip4.run(fadeOut); chip5.run(fadeOut); chip6.run(fadeOut); chip7.run(fadeOut)
        card1.run(fadeOut); card2.run(fadeOut)
        gManual.run(fadeOut); gSimulated.run(fadeOut); manualPlay.run(fadeOut); simulatedPlay.run(fadeOut)
        
        let seq = SKAction.sequence([SKAction.wait(forDuration: 0.5), SKAction.run(exit)])
        self.run(seq)
    }
    
    func exit()
    {
        let sceneToMoveTo = numberOfPlayers(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration:  0)
        self.view!.presentScene(sceneToMoveTo, transition: myTransition)
    }
}
