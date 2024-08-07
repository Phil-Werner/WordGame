//
//  ScoreScene.swift
//  WordGame
//
//  Created by Philip Werner on 2024-06-20.
//

import SpriteKit

class ScoreScene: SKScene {
        //print("got here")
        
        
         override func didMove(to view: SKView) {
            print("got here")
            backgroundColor = .yellow
            
            print("numThreeLetterwords = ", numThreeLetterWords)
             
            let title = SKLabelNode(fontNamed: "Chalkduster")
            title.text = "Final Scoring"
            title.fontSize = 70
            title.fontColor = SKColor.black
            title.position = CGPoint(x: 0, y: 430)
            
            addChild(title)
            
            let wait = SKAction.wait(forDuration: 0.5)
            
            run(wait, completion: {
                
                let threeLetter = SKLabelNode(fontNamed: "Chalkduster")
                threeLetter.text =  "Three Letter Words: "
                threeLetter.fontSize = 30
                threeLetter.fontColor = SKColor.black
                threeLetter.position = CGPoint(x: -110, y: 300)
                
                self.addChild(threeLetter)
                
                self.run(wait, completion: {
                    let numThreeLetterWordsLabel = SKLabelNode(fontNamed: "Chalkduster")
                    numThreeLetterWordsLabel.text = "\(numThreeLetterWords) x 100"
                    numThreeLetterWordsLabel.fontSize = 30
                    numThreeLetterWordsLabel.fontColor = SKColor.black
                    numThreeLetterWordsLabel.position = CGPoint(x: 150, y: 300)

                    self.addChild(numThreeLetterWordsLabel)
                    
                    self.run(wait, completion: {
                        
                        let threeLetterScore = numThreeLetterWords * 100
                        
                        let threeLetterScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
                        threeLetterScoreLabel.text = " = \(threeLetterScore)"
                        threeLetterScoreLabel.fontSize = 30
                        threeLetterScoreLabel.fontColor = SKColor.black
                        threeLetterScoreLabel.position = CGPoint(x: 170, y: 270)
                        
                        self.addChild(threeLetterScoreLabel)
                        
                        self.run(wait, completion: {
                            
                            let fourLetter = SKLabelNode(fontNamed: "Chalkduster")
                            fourLetter.text =  "Four Letter Words: "
                            fourLetter.fontSize = 30
                            fourLetter.fontColor = SKColor.black
                            fourLetter.position = CGPoint(x: -110, y: 230)
                            
                            self.addChild(fourLetter)
                            
                            self.run(wait, completion: {

                                
                                let fourLetterWordsLabel = SKLabelNode(fontNamed: "Chalkduster")
                                fourLetterWordsLabel.text = "\(numFourLetterWords) x 350"
                                fourLetterWordsLabel.fontSize = 30
                                fourLetterWordsLabel.fontColor = SKColor.black
                                fourLetterWordsLabel.position = CGPoint(x: 150, y: 230)
                                
                                self.addChild(fourLetterWordsLabel)
                                
                                self.run(wait, completion: {
                                    
                                    let fourLetterScore = numFourLetterWords * 350
                                    
                                    let fourLetterScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
                                    fourLetterScoreLabel.text = " = \(fourLetterScore)"
                                    fourLetterScoreLabel.fontSize = 30
                                    fourLetterScoreLabel.fontColor = SKColor.black
                                    fourLetterScoreLabel.position = CGPoint(x: 170, y: 200)
                                    
                                    self.addChild(fourLetterScoreLabel)
                                    
                                    self.run(wait, completion: {
                                        
                                        let fiveLetter = SKLabelNode(fontNamed: "Chalkduster")
                                        fiveLetter.text =  "Five Letter Words: "
                                        fiveLetter.fontSize = 30
                                        fiveLetter.fontColor = SKColor.black
                                        fiveLetter.position = CGPoint(x: -120, y: 170)
                                        
                                        self.addChild(fiveLetter)
                                        
                                        self.run(wait, completion: {
                                            
                                            let fiveLetterWordsLabel = SKLabelNode(fontNamed: "Chalkduster")
                                            fiveLetterWordsLabel.text = "\(numFiveLetterWords) x 1000"
                                            fiveLetterWordsLabel.fontSize = 30
                                            fiveLetterWordsLabel.fontColor = SKColor.black
                                            fiveLetterWordsLabel.position = CGPoint(x: 150, y: 170)
                                            
                                            self.addChild(fiveLetterWordsLabel)
                                            
                                            self.run(wait, completion: {
                                                
                                                let fiveLetterScore = numFiveLetterWords * 1000
                                              
                                                let fiveLetterScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
                                                fiveLetterScoreLabel.text = " = \(fiveLetterScore)"
                                                fiveLetterScoreLabel.fontSize = 30
                                                fiveLetterScoreLabel.fontColor = SKColor.black
                                                fiveLetterScoreLabel.position = CGPoint(x: 170, y: 140)
                                                
                                                self.addChild(fiveLetterScoreLabel)
                                                
                                                self.run(wait, completion: {
                                                    let sixLetter = SKLabelNode(fontNamed: "Chalkduster")
                                                    sixLetter.text =  "Six Letter Words: "
                                                    sixLetter.fontSize = 30
                                                    sixLetter.fontColor = SKColor.black
                                                    sixLetter.position = CGPoint(x: -130, y: 100)
                                                    
                                                    self.addChild(sixLetter)
                                                    
                                                    self.run(wait, completion: {
                                                        
                                                        let sixLetterWordsLabel = SKLabelNode(fontNamed: "Chalkduster")
                                                        sixLetterWordsLabel.text = "\(numSixLetterWords) x 3000"
                                                        sixLetterWordsLabel.fontSize = 30
                                                        sixLetterWordsLabel.fontColor = SKColor.black
                                                        sixLetterWordsLabel.position = CGPoint(x: 150, y: 100)
                                                        
                                                        self.addChild(sixLetterWordsLabel)
                                                        
                                                        self.run(wait, completion: {
                                                            let sixLetterScore = numSixLetterWords * 3000
                                                            
                                                            let sixLetterScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
                                                            sixLetterScoreLabel.text = " = \(sixLetterScore)"
                                                            sixLetterScoreLabel.fontSize = 30
                                                            sixLetterScoreLabel.fontColor = SKColor.black
                                                            sixLetterScoreLabel.position = CGPoint(x: 170, y: 70)
                                                            
                                                            self.addChild(sixLetterScoreLabel)
                                                            
                self.run(wait, completion: {
                    
                    let sevenLetter = SKLabelNode(fontNamed: "Chalkduster")
                    sevenLetter.text =  "Seven+ Letter Words: "
                    sevenLetter.fontSize = 30
                    sevenLetter.fontColor = SKColor.black
                    sevenLetter.position = CGPoint(x: -110, y: 40)
                    
                    self.addChild(sevenLetter)
                    
                    self.run(wait, completion: {
                        
                        let sevenLetterWordsLabel = SKLabelNode(fontNamed: "Chalkduster")
                        sevenLetterWordsLabel.text = "\(numSevenLetterWords) x 5000"
                        sevenLetterWordsLabel.fontSize = 30
                        sevenLetterWordsLabel.fontColor = SKColor.black
                        sevenLetterWordsLabel.position = CGPoint(x: 150, y: 40)
                        
                        self.addChild(sevenLetterWordsLabel)
                        
                        self.run(wait, completion: {
                            let sevenLetterScore = numSevenLetterWords * 5000
                          
                            let sevenLetterScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
                            sevenLetterScoreLabel.text = " = \(sevenLetterScore)"
                            sevenLetterScoreLabel.fontSize = 30
                            sevenLetterScoreLabel.fontColor = SKColor.black
                            sevenLetterScoreLabel.position = CGPoint(x: 170, y: 10)
                            
                            self.addChild(sevenLetterScoreLabel)
                            
                            self.run(wait, completion: {
                                
                                let bonusStarsLabel = SKLabelNode(fontNamed: "Chalkduster")
                                bonusStarsLabel.text = "Bonus Stars: "
                                bonusStarsLabel.fontSize = 30
                                bonusStarsLabel.fontColor = SKColor.black
                                bonusStarsLabel.position = CGPoint(x: -110, y: -30)
                                
                                self.addChild(bonusStarsLabel)
                                
                                self.run(wait, completion: {
                                    
                                    let numStarsLabel = SKLabelNode(fontNamed: "Chalkduster")
                                    numStarsLabel.text = " \(numStarsCollected) x 2500 "
                                    numStarsLabel.fontSize = 30
                                    numStarsLabel.fontColor = SKColor.black
                                    numStarsLabel.position = CGPoint(x: 140, y: -30)
                                    
                                    self.addChild(numStarsLabel)
                                    
                                    self.run(wait, completion: {
                                        
                                        let starScore = numStarsCollected * 2500
                                        
                                        let starScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
                                        starScoreLabel.text = "= \(starScore)"
                                        starScoreLabel.fontSize = 30
                                        starScoreLabel.fontColor = SKColor.black
                                        starScoreLabel.position = CGPoint(x: 160, y: -60)
                                            
                                        self.addChild(starScoreLabel)
                                    })
                                    
                                })
                            })
                            
                        })
                    })
                    
                    
                                                                
                                                            })
                                                        })
                                                    })
                                                })
                                            })
                                            
                                        })
                                    })
                                })
                                
                            })
                        })
                    })
                })
                
            }
        )
    }
}

