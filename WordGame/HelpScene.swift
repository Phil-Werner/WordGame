//
//  HelpScene.swift
//  WordGame
//
//  Created by Philip Werner on 2025-02-23.
//

import Foundation
import SpriteKit

class HelpScene: SKScene {
    
    let woosh = SKAction.playSoundFileNamed("woosh.mp3", waitForCompletion: false)
    let wait = SKAction.wait(forDuration: 1)
    
    var menuButton = SKShapeNode(rectOf: CGSize(width: 300, height: 100))
    
    override func didMove(to view: SKView) {
        
        print("help scene is now starting")
        backgroundColor = .green
        
        
        
        let title = SKLabelNode(fontNamed: "Chalkduster")
        title.text = "How to Play"
        title.fontSize = 70
        title.fontColor = SKColor.black
        title.position = CGPoint(x: 0, y: 430)
        
        addChild(title)
        
        let firstSentence = SKLabelNode(fontNamed: "Chalkduster")
        firstSentence.text =  "* Drag your finger along the letters "
        firstSentence.fontSize = 25
        firstSentence.fontColor = SKColor.black
        firstSentence.position = CGPoint(x: 0, y: 300)
        
        let secondSentence = SKLabelNode(fontNamed: "Chalkduster")
        secondSentence.text = "of the game board to spell out"
        secondSentence.fontSize = 25
        secondSentence.fontColor = SKColor.black
        secondSentence.position = CGPoint(x: 0, y: 260)
        
        
        
        
        self.addChild(firstSentence)
        self.addChild(secondSentence)
        
        run(wait, completion: {
            
            self.run(self.woosh)
            
            let thirdSentence = SKLabelNode(fontNamed: "Chalkduster")
            thirdSentence.text = "words.  The longer the word, the"
            thirdSentence.fontSize = 25
            thirdSentence.fontColor = SKColor.black
            thirdSentence.position = CGPoint(x: 0, y: 220)
            
            let fourthSentence = SKLabelNode(fontNamed: "Chalkduster")
            fourthSentence.text = "more points you get!"
            fourthSentence.fontSize = 25
            fourthSentence.fontColor = SKColor.black
            fourthSentence.position = CGPoint(x: -80, y: 180)
            
            self.addChild(thirdSentence)
            self.addChild(fourthSentence)
            
            self.run(self.wait, completion: {
                
                self.run(self.woosh)
                
                let fifthSentence = SKLabelNode(fontNamed: "Chalkduster")
                fifthSentence.text = "* Collect Bonus Stars!"
                fifthSentence.fontSize = 25
                fifthSentence.fontColor = SKColor.black
                fifthSentence.position = CGPoint(x: -80, y: 130)
                
                let sixthSentence = SKLabelNode(fontNamed: "Chalkduster")
                sixthSentence.text = "Use a word with the bonus letter"
                sixthSentence.fontSize = 25
                sixthSentence.fontColor = SKColor.black
                sixthSentence.position = CGPoint(x: 0, y: 90)
                
                self.addChild(fifthSentence)
                self.addChild(sixthSentence)
                
                self.run(self.wait, completion: {
                    
                    self.run(self.woosh)
                    
                    let seventhSentence = SKLabelNode(fontNamed: "Chalkduster")
                    seventhSentence.text = "or achieve one of the other two"
                    seventhSentence.fontSize = 25
                    seventhSentence.fontColor = SKColor.black
                    seventhSentence.position = CGPoint(x: 0, y: 50)
                    
                    let eighthSentence = SKLabelNode(fontNamed: "Chalkduster")
                    eighthSentence.text = "random goals to get a bonus star."
                    eighthSentence.fontSize = 25
                    eighthSentence.fontColor = SKColor.black
                    eighthSentence.position = CGPoint(x: 0, y: 10)
                    
                    let ninthSentence = SKLabelNode(fontNamed: "Chalkduster")
                    ninthSentence.text = "Each star is worth 2500 points."
                    ninthSentence.fontSize = 25
                    ninthSentence.fontColor = SKColor.black
                    ninthSentence.position = CGPoint(x: -10, y: -30)
                    
                    self.addChild(seventhSentence)
                    self.addChild(eighthSentence)
                    self.addChild(ninthSentence)
                    
                    self.run(self.wait, completion:  {
                        
                        self.run(self.woosh)
                        
                        let tenthSentence = SKLabelNode(fontNamed: "Chalkduster")
                        tenthSentence.text = "Stars can also be used"
                        tenthSentence.fontSize = 25
                        tenthSentence.fontColor = SKColor.black
                        tenthSentence.position = CGPoint(x: -60, y: -70)
                        
                        let eleventhSentence = SKLabelNode(fontNamed: "Chalkduster")
                        eleventhSentence.text = "to buy vowels."
                        eleventhSentence.fontSize = 25
                        eleventhSentence.fontColor = SKColor.black
                        eleventhSentence.position = CGPoint(x: -120, y: -110)
                        
                        self.addChild(tenthSentence)
                        self.addChild(eleventhSentence)
                        
                        self.run(self.wait, completion: {
                            
                            self.run(self.woosh)
                            
                            let twelthSentence = SKLabelNode(fontNamed: "Chalkduster")
                            twelthSentence.text = "* There are three rounds of play."
                            twelthSentence.fontSize = 25
                            twelthSentence.fontColor = SKColor.black
                            twelthSentence.position = CGPoint(x: 0, y: -150)
                            
                            let thirteenthSentence = SKLabelNode(fontNamed: "Chalkduster")
                            thirteenthSentence.text = "Have fun!"
                            thirteenthSentence.fontSize = 25
                            thirteenthSentence.fontColor = SKColor.black
                            thirteenthSentence.position = CGPoint(x: -120, y: -190)
                            
                            self.addChild(twelthSentence)
                            self.addChild(thirteenthSentence)
                            
                            self.run(self.wait, completion: {
                                
                                self.menuButton.fillColor = .white
                                self.menuButton.position = CGPoint(x: 0, y: -330)
                                self.menuButton.strokeColor = .black
                                self.menuButton.lineWidth = 3
                                self.addChild(self.menuButton)
                                
                                let menuString = SKLabelNode(fontNamed: "Chalkduster")
                                menuString.text = "Back to Menu"
                                menuString.fontSize = 35
                                menuString.fontColor = SKColor.black
                                menuString.position = CGPoint(x: 0, y: -340)
                                self.addChild(menuString)
                                
                                
                            })
                            
                            
                        })
                    })
                })
            })
        })        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("got over here")
        
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            if menuButton.contains(location) {
                print("menu button was pressed")
              //  startButton.fillColor = .red
                
              
                
                let scene = MenuScene(fileNamed: "MenuScene")!
                scene.scaleMode = .aspectFill
               // scene.size = (CGSize(width: 10, height: 50))
              //  scene.scaleMode = SKSceneScaleMode.resizeFill
                let transition = SKTransition.doorway(withDuration: 2)
                self.view?.presentScene(scene, transition: transition)
                
            }
        }
    }
    
}
