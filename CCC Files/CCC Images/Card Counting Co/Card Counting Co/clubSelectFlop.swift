import Foundation
import SpriteKit
import GameplayKit

class clubSelectFlop: SKScene
{
    let gameArea: CGRect
    let background = SKSpriteNode(imageNamed: "background")
    
    override init(size: CGSize)
    {
        let maxAspectRatio : CGFloat = 16.0/9.0
        let playableWidth = size.height/maxAspectRatio
        let margin = (size.width - playableWidth)/4
        gameArea = CGRect(x: margin, y: 0, width: playableWidth + margin, height: size.height)
        
        super.init(size: size)
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView)
    {
        //Background
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        Cards.cAce.setScale(0.10)
        Cards.cAce.position = CGPoint(x: 2 * self.size.width/16, y: self.size.height/2)
        Cards.cAce.zPosition = 1
        self.addChild(Cards.cAce)
        
        Cards.cTwo.setScale(0.10)
        Cards.cTwo.position = CGPoint(x:  3 * self.size.width/16, y: self.size.height/2)
        Cards.cTwo.zPosition = 1
        self.addChild(Cards.cTwo)
        
        Cards.cThree.setScale(0.10)
        Cards.cThree.position = CGPoint(x: 4 * self.size.width/16, y: self.size.height/2)
        Cards.cThree.zPosition = 1
        self.addChild(Cards.cThree)
        
        Cards.cFour.setScale(0.10)
        Cards.cFour.position = CGPoint(x: 5 * self.size.width/16, y: self.size.height/2)
        Cards.cFour.zPosition = 1
        self.addChild(Cards.cFour)
        
        Cards.cFive.setScale(0.10)
        Cards.cFive.position = CGPoint(x: 6 * self.size.width/16, y: self.size.height/2)
        Cards.cFive.zPosition = 1
        self.addChild(Cards.cFive)
        
        Cards.cSix.setScale(0.10)
        Cards.cSix.position = CGPoint(x: 7 * self.size.width/16, y: self.size.height/2)
        Cards.cSix.zPosition = 1
        self.addChild(Cards.cSix)
        
        Cards.cSeven.setScale(0.10)
        Cards.cSeven.position = CGPoint(x: 8 * self.size.width/16, y: self.size.height/2)
        Cards.cSeven.zPosition = 1
        self.addChild(Cards.cSeven)
        
        Cards.cEight.setScale(0.10)
        Cards.cEight.position = CGPoint(x: 9 * self.size.width/16, y: self.size.height/2)
        Cards.cEight.zPosition = 1
        self.addChild(Cards.cEight)
        
        Cards.cNine.setScale(0.10)
        Cards.cNine.position = CGPoint(x: 10 * self.size.width/16, y: self.size.height/2)
        Cards.cNine.zPosition = 1
        self.addChild(Cards.cNine)
        
        Cards.cTen.setScale(0.10)
        Cards.cTen.position = CGPoint(x: 11 * self.size.width/16, y: self.size.height/2)
        Cards.cTen.zPosition = 1
        self.addChild(Cards.cTen)
        
        Cards.cJack.setScale(0.10)
        Cards.cJack.position = CGPoint(x: 12 * self.size.width/16, y: self.size.height/2)
        Cards.cJack.zPosition = 1
        self.addChild(Cards.cJack)
        
        Cards.cQueen.setScale(0.10)
        Cards.cQueen.position = CGPoint(x: 13 * self.size.width/16, y: self.size.height/2)
        Cards.cQueen.zPosition = 1
        self.addChild(Cards.cQueen)
        
        Cards.cKing.setScale(0.10)
        Cards.cKing.position = CGPoint(x: 14 * self.size.width/16, y: self.size.height/2)
        Cards.cKing.zPosition = 1
        self.addChild(Cards.cKing)
    }
    
    func changeScene()
    {
        let sceneToMoveTo = GameSceneFlop(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration:  1.0)
        self.view!.presentScene(sceneToMoveTo, transition: myTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch: AnyObject in touches
        {
            let pointOfTouch = touch.location(in: view)
            //print("\(pointOfTouch.x)   \(pointOfTouch.y)")
            let cardWidth = Cards.hAce.size.width
            let cardHeight = Cards.hAce.size.height
            
            //Choose Clubs Card
            if (pointOfTouch.x > (2 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (2 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Ace", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Ace", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Ace", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cAce.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            //Two
            if (pointOfTouch.x > (3 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (3 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Two", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Two", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Two", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cTwo.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (4 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (4 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Three", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Three", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Three", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cThree.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (5 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (5 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Four", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Four", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Four", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cFour.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (6 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (6 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Five", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Five", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Five", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cFive.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (7 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (7 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Six", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Six", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Six", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cSix.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (8 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (8 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Seven", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Seven", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Seven", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cSeven.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (9 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (9 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Eight", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Eight", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Eight", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cEight.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (10 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (10 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Nine", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Nine", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Nine", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cNine.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (11 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (11 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Ten", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Ten", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Ten", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cTen.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (12 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (12 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Jack", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Jack", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Jack", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cJack.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (13 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (13 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - Queen", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - Queen", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - Queen", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cQueen.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
            if (pointOfTouch.x > (14 * self.size.width/16 - cardWidth/2) && pointOfTouch.x < (14 * self.size.width/16 + cardWidth/2)) && (pointOfTouch.y > (self.size.height/2 - cardHeight/2) && pointOfTouch.y < (self.size.height/2 + cardHeight/2))
            {
                
                if (defaults.string(forKey: "Flop1") == "None")
                {
                    defaults.set("Clubs - King", forKey: "Flop1")
                }else{
                    if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") == "None")
                    {
                        defaults.set("Clubs - King", forKey: "Flop2")
                    }else{
                        if(defaults.string(forKey: "Flop1") != "None" && defaults.string(forKey: "Flop2") != "None" && defaults.string(forKey: "Flop3") == "None" )
                        {
                            defaults.set("Clubs - King", forKey: "Flop3")
                        }
                    }
                }
                
                let moveCard = SKAction.moveTo(y: self.size.height/2 + 50, duration: 0.5)
                Cards.cKing.run(moveCard)
                
                let step1 = SKAction.run(changeScene)
                let step2 = SKAction.wait(forDuration:  0.5)
                let changeSequence = SKAction.sequence([step2, step1])
                self.run(changeSequence)
            }
            
        }
    }
}



