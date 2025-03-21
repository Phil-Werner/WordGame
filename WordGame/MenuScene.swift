//
//  MenuScene.swift
//  WordGame
//
//  Created by Philip Werner on 2024-06-04.
//
import SpriteKit

class MenuScene: SKScene {
    //print("got here")
    
    let soundEffect = SKAction.playSoundFileNamed("pop.wav", waitForCompletion: false)
    let bonus = SKAction.playSoundFileNamed("bonus.mp3", waitForCompletion: false)
    let backgroundMusic = SKAction.playSoundFileNamed("background.mp3", waitForCompletion: false)
    let woosh = SKAction.playSoundFileNamed("woosh.mp3", waitForCompletion: false)
    
    var startButton = SKShapeNode(rectOf: CGSize(width: 300, height: 100))
    var helpButton = SKShapeNode(rectOf: CGSize(width: 300, height: 100))
    
    
    
    override func didMove(to view: SKView) {
        print("😆 1")
      //  playButton = SKSpriteNode(texture: playButtonTex)
       // playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        //self.addChild(playButton)
        print("got here")
        backgroundColor = .brown
        
        
       // self.run(SKAction.playSoundFileNamed("background.mp3", waitForCompletion: false))
       // let music = SKAudioNode(fileNamed: "background.mp3")
        
       // self.run(SKAction.repeatForever(SKAction.playSoundFileNamed("background.mp3", waitForCompletion: true)))
        
        run(soundEffect)
        
        
        let firstWord = SKLabelNode(fontNamed: "Chalkduster")
        firstWord.text = "Word"
        firstWord.fontSize = 70
        firstWord.fontColor = SKColor.black
        firstWord.position = CGPoint(x: -200, y: 800)
        
        let secondWord = SKLabelNode(fontNamed: "Chalkduster")
        secondWord.text = "-er"
        secondWord.fontSize = 70
        secondWord.fontColor = SKColor.black
        secondWord.position = CGPoint(x: 800, y: 300)
        
        let thirdWord = SKLabelNode(fontNamed: "Chalkduster")
        thirdWord.text = "-ific!"
        thirdWord.fontSize = 70
        thirdWord.fontColor = SKColor.black
        thirdWord.position = CGPoint(x: -550, y: 200)
        
        let actionMove = SKAction.move(to: CGPoint(x: -170, y: 400),
                                       duration: TimeInterval(0.4))
        
        let actionMove2 = SKAction.move(to: CGPoint(x: -20, y: 300), duration: TimeInterval(0.25))
        
        let actionMove3 = SKAction.move(to: CGPoint(x: 120, y: 200), duration: TimeInterval(0.25))
        
        let highScoreText = SKLabelNode(fontNamed: "ArialMT")
        highScoreText.text = "High Score: "
        highScoreText.fontSize = 40
        highScoreText.fontColor = SKColor.black
        highScoreText.position = CGPoint(x: -40, y: 0)
        
        let highScoreLabel = SKLabelNode(fontNamed: "ArialMT")
        highScoreLabel.text = " \(highScore)"
        highScoreLabel.fontSize = 40
        highScoreLabel.fontColor = SKColor.black
        highScoreLabel.position = CGPoint(x: 130, y:0)
        
      //  addChild(music)
        addChild(highScoreLabel)
        addChild(highScoreText)
        addChild(firstWord)
        addChild(secondWord)
        addChild(thirdWord)
        
        run(woosh)
        
        
        firstWord.run(actionMove, completion: {
            self.run(self.woosh)
            secondWord.run(actionMove2, completion: {
                self.run(self.woosh)
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
                
                run(bonus)
                
                let scene = BonusScene(fileNamed: "BonusScene")!
                scene.scaleMode = .aspectFill
               // scene.size = (CGSize(width: 10, height: 50))
              //  scene.scaleMode = SKSceneScaleMode.resizeFill
                let transition = SKTransition.doorway(withDuration: 2)
                self.view?.presentScene(scene, transition: transition)
                
            }
            
            if helpButton.contains(location) {
                
                print("Help button was pressed")
                
                let scene = HelpScene(fileNamed: "HelpScene")!
                scene.scaleMode = .aspectFill
                
                let transition = SKTransition.doorway(withDuration: 2)
                self.view?.presentScene(scene, transition: transition)
                
                
                
            }
            
        }
    }
}
