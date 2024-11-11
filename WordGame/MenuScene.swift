//
//  MenuScene.swift
//  WordGame
//
//  Created by Philip Werner on 2024-06-04.
//
import SpriteKit

class MenuScene: SKScene {
    //print("got here")
    
    var startButton = SKShapeNode(rectOf: CGSize(width: 300, height: 100))
    var helpButton = SKShapeNode(rectOf: CGSize(width: 300, height: 100))
    
    
    
    override func didMove(to view: SKView) {
        print("😆 1")
      //  playButton = SKSpriteNode(texture: playButtonTex)
       // playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        //self.addChild(playButton)
        print("got here")
        backgroundColor = .brown
        
        
        let firstWord = SKLabelNode(fontNamed: "Chalkduster")
        firstWord.text = "The"
        firstWord.fontSize = 70
        firstWord.fontColor = SKColor.black
        firstWord.position = CGPoint(x: -200, y: 800)
        
        let secondWord = SKLabelNode(fontNamed: "Chalkduster")
        secondWord.text = "Word"
        secondWord.fontSize = 70
        secondWord.fontColor = SKColor.black
        secondWord.position = CGPoint(x: 800, y: 300)
        
        let thirdWord = SKLabelNode(fontNamed: "Chalkduster")
        thirdWord.text = "Game!"
        thirdWord.fontSize = 70
        thirdWord.fontColor = SKColor.black
        thirdWord.position = CGPoint(x: -550, y: 200)
        
        let actionMove = SKAction.move(to: CGPoint(x: -200, y: 400),
                                       duration: TimeInterval(0.4))
        
        let actionMove2 = SKAction.move(to: CGPoint(x: -25, y: 300), duration: TimeInterval(0.25))
        
        let actionMove3 = SKAction.move(to: CGPoint(x: 130, y: 200), duration: TimeInterval(0.25))
        
        
        
        
        addChild(firstWord)
        addChild(secondWord)
        addChild(thirdWord)
        
        firstWord.run(actionMove, completion: {
            secondWord.run(actionMove2, completion: {
                thirdWord.run(actionMove3, completion: {
                    
                })
                
            })
        })
        
        
        
        startButton.fillColor = .white
        startButton.position = CGPoint(x: 0, y: -155)
        startButton.strokeColor = .black
        startButton.lineWidth = 3
        addChild(startButton)
        
        
        let startString = SKLabelNode(fontNamed: "Chalkduster")
        startString.text = "Start"
        startString.fontSize = 65
        startString.fontColor = SKColor.black
        startString.position = CGPoint(x: 5, y: -170)
        addChild(startString)
        
        helpButton.fillColor = .white
        helpButton.position = CGPoint(x: 0, y: -350)
        helpButton.strokeColor = .black
        helpButton.lineWidth = 3
        addChild(helpButton)
        
        let helpString = SKLabelNode(fontNamed: "Chalkduster")
        helpString.text = "How to Play"
        helpString.fontSize = 40
        helpString.fontColor = SKColor.black
        helpString.position = CGPoint(x: 5, y: -360)
        addChild(helpString)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("got over here")
        
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            if startButton.contains(location) {
                print("Start button was pressed")
              //  startButton.fillColor = .red
                
                let scene = BonusScene(fileNamed: "BonusScene")!
                scene.scaleMode = .aspectFill
               // scene.size = (CGSize(width: 10, height: 50))
              //  scene.scaleMode = SKSceneScaleMode.resizeFill
                let transition = SKTransition.doorway(withDuration: 2)
                self.view?.presentScene(scene, transition: transition)
                
            }
        }
    }
}
