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
    
    override func didMove(to view: SKView) {
        print("😆 1")
      //  playButton = SKSpriteNode(texture: playButtonTex)
       // playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        //self.addChild(playButton)
        print("got here")
        backgroundColor = .brown
        
        
        startButton.fillColor = .white
        startButton.position = CGPoint(x: 0, y: 50)
        startButton.strokeColor = .black
        startButton.lineWidth = 3
        addChild(startButton)
        
        let startString = SKLabelNode(fontNamed: "Chalkduster")
        startString.text = "Start"
        startString.fontSize = 65
        startString.fontColor = SKColor.black
        startString.position = CGPoint(x: 5, y: 30)
        addChild(startString)
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
