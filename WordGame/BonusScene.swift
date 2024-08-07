//
//  BonusScene.swift
//  WordGame
//
//  Created by Philip Werner on 2024-07-17.
//

import SpriteKit

class BonusScene: SKScene {
    
    var startButton = SKShapeNode(rectOf: CGSize(width: 300, height: 100))
    
    override func didMove(to view: SKView) {
        
        print("Welcome to BonusScene")
        
        let wait = SKAction.wait(forDuration: 0.5)
        let wait2 = SKAction.wait(forDuration: 0.7)
        
        backgroundColor = .blue
        
        let intro = SKLabelNode(fontNamed: "Chalkduster")
        intro.text = "For this game, get a bonus star"
        intro.fontSize = 30
        intro.fontColor = SKColor.black
        intro.position = CGPoint(x: 0, y: 450)
        addChild(intro)
        
        let intro2 = SKLabelNode(fontNamed: "Chalkduster")
        intro2.text = "every time you..."
        intro2.fontSize = 30
        intro2.fontColor = SKColor.black
        intro2.position = CGPoint(x: -130, y: 400)
        addChild(intro2)
        
        self.run(wait, completion: {
            
            
            let intro3 = SKLabelNode(fontNamed: "Chalkduster")
            intro3.text = "* Use a "
            intro3.fontSize = 30
            intro3.fontColor = SKColor.black
            intro3.position = CGPoint(x: -130, y: 300)
            self.addChild(intro3)
            
            bonusLetter = self.selectBonusLetter()
        //    bonusLetter = "A"
            
            self.run(wait2, completion: {
                
                let intro4 = SKLabelNode(fontNamed: "Chalkduster")
                intro4.text = bonusLetter
                intro4.fontSize = 30
                intro4.fontColor = SKColor.black
                intro4.position = CGPoint(x: -50, y: 300)
                self.addChild(intro4)
                
                self.run(wait2, completion: {
                    
                    let intro5 = SKLabelNode(fontNamed: "Chalkduster")
                    intro5.text = "* Use a word "
                    intro5.fontSize = 30
                    intro5.fontColor = SKColor.black
                    intro5.position = CGPoint(x: -80, y: 240)
                    
                    self.addChild(intro5)
                    
                    self.run(wait2, completion: {
                        
                        secondBonusAsInt = self.selectSecondBonus()
                       // secondBonusAsInt = 0
                        
                        print("second bonus as int = ", secondBonusAsInt)
                        
                        let intro6 = SKLabelNode(fontNamed: "Chalkduster")
                        
                        if (secondBonusAsInt == 0) {
                            intro6.text = "with three vowels!"
                        }
                        
                        if (secondBonusAsInt == 1) {
                            intro6.text = "with a double consonant!"
                        }
                        
                        if (secondBonusAsInt == 2) {
                            intro6.text = "starts/ends with same letter!"
                        }
                        
                        if (secondBonusAsInt == 3) {
                            intro6.text = "with a double vowel!"
                        }
                        
                        if (secondBonusAsInt == 4) {
                            intro6.text = "with four consonants!"
                        }
                        
                        intro6.fontSize = 30
                        intro6.fontColor = SKColor.black
                        intro6.position = CGPoint(x: 0, y: 200)
                        
                        self.addChild(intro6)
                        
                        self.run(wait2, completion: {
                            
                            let intro7 = SKLabelNode(fontNamed: "Chalkduster")
                            intro7.text = "* Use a word that's "
                            intro7.fontSize = 30
                            intro7.fontColor = SKColor.black
                            intro7.position = CGPoint(x: -30, y: 150)
                            
                            self.addChild(intro7)
                            
                            self.run(wait2, completion: {
                                
                                thirdBonusAsInt = self.selectThirdBonus()
                                print("third bonus as int = ", thirdBonusAsInt)
                                
                                let intro8 = SKLabelNode(fontNamed: "Chalkduster")
                                
                                if (thirdBonusAsInt == 0) {
                                    intro8.text = "5"
                                }
                                
                                if (thirdBonusAsInt == 1) {
                                    intro8.text = "6"
                                }
                                
                                if (thirdBonusAsInt == 2) {
                                    intro8.text = "7"
                                }
                                
                                
                                intro8.fontSize = 30
                                intro8.fontColor = SKColor.black
                                intro8.position = CGPoint(x: -145, y: 110)
                                
                                self.addChild(intro8)
                                
                                let intro9 = SKLabelNode(fontNamed: "Chalkduster")
                                intro9.text = "letters long!"
                                intro9.fontSize = 30
                                intro9.fontColor = SKColor.black
                                intro9.position = CGPoint(x: -10, y: 110)
                                
                                self.addChild(intro9)
                                
                                self.run(wait2, completion: {
                                    
                                    
                                    
                                    self.startButton.fillColor = .white
                                    self.startButton.position = CGPoint(x: 0, y: -200)
                                    self.startButton.strokeColor = .black
                                    self.startButton.lineWidth = 3
                                    self.addChild(self.startButton)
                                    
                                    let startString = SKLabelNode(fontNamed: "Chalkduster")
                                    startString.text = "Start"
                                    startString.fontSize = 65
                                    startString.fontColor = SKColor.black
                                    startString.position = CGPoint(x: 5, y: -220)
                                    self.addChild(startString)
                                    
                                    
                                    
                                    
                                })
                                
                            })
                        })
                        
                    })
                })
                
            })
            
            //print(bonusLetter)
            
        })
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("got over here")
        
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            if startButton.contains(location) {
                print("Start button was pressed")
              //  startButton.fillColor = .red
                
                let scene = GameScene(fileNamed: "GameScene")!
                scene.scaleMode = .aspectFill
               // scene.size = (CGSize(width: 10, height: 50))
              //  scene.scaleMode = SKSceneScaleMode.resizeFill
                let transition = SKTransition.doorway(withDuration: 2)
                self.view?.presentScene(scene, transition: transition)
                
            }
        }
    }
    
    func selectSecondBonus() -> Int {
        let random = arc4random_uniform(5)
        return Int(random)
    }
    
    func selectThirdBonus() -> Int {
        let random = arc4random_uniform(3)
        return Int(random)
    }
    
    func selectBonusLetter() -> String {
        
        let choicesForBonusLetter = ["J", "K", "Z", "X", "Q"]
        let randomNum = arc4random_uniform(5)
        
        return choicesForBonusLetter[Int(randomNum)]
        
        
    }
}
