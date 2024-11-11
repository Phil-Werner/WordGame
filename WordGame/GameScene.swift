//
//  GameScene.swift
//  WordGame
//
//  Created by Philip Werner on 2024-04-19.
//

import SpriteKit
import GameplayKit

struct Square {
    let letter: String
    let isSelected: Bool
    let color: UIColor
}

var numThreeLetterWords = 0
var numFourLetterWords = 0
var numFiveLetterWords = 0
var numSixLetterWords = 0
var numSevenLetterWords = 0
var numEightLetterWords = 0
var numStarsCollected = 2

var secondBonusAsInt = 0
var thirdBonusAsInt = 0
var bonusLetter = "A"

class GameScene: SKScene {
    
    
    private var star = SKSpriteNode()
    private var starRunningFrames: [SKTexture] = []
    
    func clearOldSelectedLetters() {
        arrayOfSelectedLetters = Array(repeating: Array(repeating: false, count: 5), count: 5)
    }
    
    func clearOldLettersInWord() {
        arrayOfLettersAlreadyInWord = Array(repeating: Array(repeating: false, count: 5), count: 5)
    }
    
    func pickLetter() -> String {
        let pick = arc4random_uniform(26)
        let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        return alphabet[Int(pick)]
    }
    
    func changeLettersToWhite() {
//        letters.forEach { $0.color = .white }
        letter1.color = .white
        letter2.color = .white
        letter3.color = .white
        letter4.color = .white
        letter5.color = .white
        letter6.color = .white
        letter7.color = .white
        letter8.color = .white
        letter9.color = .white
        letter10.color = .white
        letter11.color = .white
        letter12.color = .white
        letter13.color = .white
        letter14.color = .white
        letter15.color = .white
        letter16.color = .white
        letter17.color = .white
        letter18.color = .white
        letter19.color = .white
        letter20.color = .white
        letter21.color = .white
        letter22.color = .white
        letter23.color = .white
        letter24.color = .white
        letter25.color = .white
    }
    
    let displayedWord = SKLabelNode(fontNamed: "Chalkduster")
   // let correctWordString = SKLabelNode(fontNamed: "Chalkduster")
    let correctWordString = SKLabelNode(fontNamed: "Chalkduster")
    let currentScore = SKLabelNode(fontNamed: "Chalkduster")
    let timeLeft = SKLabelNode(fontNamed: "ArialMT")
    let numBonusStarsLabel = SKLabelNode(fontNamed: "ArialMT")
    
    var arrayOfLetters = [["A", "B", "C", "D", "E"], ["F", "G", "H", "I", "J"], ["K", "L", "M", "N", "O"], ["P", "Q", "R", "S", "T"], ["U", "V", "W", "X", "Y"]]
    
    var arrayOfSelectedLetters = [[false, false, false, false, false], [false, false, false, false, false], [false, false, false, false, false], [false, false, false, false, false], [false, false, false, false, false]]
    
    var arrayOfLettersAlreadyInWord = [[false, false, false, false, false], [false, false, false, false, false], [false, false, false, false, false], [false, false, false, false, false], [false, false, false, false, false]]
    
    var anyLetterSelected = false
    
    var chosenWord = ""
    var scoreAsInt = 0
    var timeLeftAsInt = 30
    var roundNumber = 1
    
 
    
    var arrayOfUsedWords = ["XXI", "XIX"]
    
    var letters: [SKSpriteNode] = {
        return (0 ..< 24).map { _ in
            SKSpriteNode(imageNamed: "A")
        }
    }()
    
    let letter1 = SKSpriteNode(imageNamed: "A")
    let letter2 = SKSpriteNode(imageNamed: "B")
    let letter3 = SKSpriteNode(imageNamed: "C")
    let letter4 = SKSpriteNode(imageNamed: "D")
    let letter5 = SKSpriteNode(imageNamed: "E")
    let letter6 = SKSpriteNode(imageNamed: "F")
    let letter7 = SKSpriteNode(imageNamed: "G")
    let letter8 = SKSpriteNode(imageNamed: "H")
    let letter9 = SKSpriteNode(imageNamed: "I")
    let letter10 = SKSpriteNode(imageNamed: "J")
    let letter11 = SKSpriteNode(imageNamed: "K")
    let letter12 = SKSpriteNode(imageNamed: "L")
    let letter13 = SKSpriteNode(imageNamed: "M")
    let letter14 = SKSpriteNode(imageNamed: "N")
    let letter15 = SKSpriteNode(imageNamed: "O")
    let letter16 = SKSpriteNode(imageNamed: "P")
    let letter17 = SKSpriteNode(imageNamed: "Q")
    let letter18 = SKSpriteNode(imageNamed: "R")
    let letter19 = SKSpriteNode(imageNamed: "S")
    let letter20 = SKSpriteNode(imageNamed: "T")
    let letter21 = SKSpriteNode(imageNamed: "U")
    let letter22 = SKSpriteNode(imageNamed: "V")
    let letter23 = SKSpriteNode(imageNamed: "W")
    let letter24 = SKSpriteNode(imageNamed: "X")
    let letter25 = SKSpriteNode(imageNamed: "Y")
    
    override func didMove(to view: SKView) {
        print("😆 1")
        backgroundColor = .red
        
        buildStar()
        animateStar()
        
      //  physicsWorld.gravity = CGVector(dx: 0, dy: -1.62)
        
    
      func buildStar() {
          let starAnimatedAtlas = SKTextureAtlas(named: "star")
          var starFrames: [SKTexture] = []
          
          let numImages = starAnimatedAtlas.textureNames.count
          for i in 1..<numImages {
              let starTextureName = "star\(i)"
             // print("starTextureName = ", starTextureName)
              starFrames.append(starAnimatedAtlas.textureNamed(starTextureName))
          }
          starRunningFrames = starFrames
          
          
          let firstFrameTexture = starRunningFrames[0]
          star = SKSpriteNode(texture: firstFrameTexture)
          star.setScale(0.4)
          star.position = CGPoint(x: -225, y: 550)
          addChild(star)
          
     //     star.physicsBody = SKPhysicsBody(rectangleOf: star.size)
          
      }
      
      func animateStar() {
        star.run(SKAction.repeatForever(
          SKAction.animate(with: starRunningFrames,
                           timePerFrame: 0.1,
                           resize: false,
                           restore: true)),
          withKey:"spinningStar")
      }
        
        
        
        timeLeft.text = "30"
        timeLeft.fontSize = 65
        timeLeft.fontColor = SKColor.black
        timeLeft.position = CGPoint(x: 240, y: 525)
        
        displayedWord.text = ""
        displayedWord.fontSize = 65
        displayedWord.fontColor = SKColor.black
        displayedWord.position = CGPoint(x: frame.midX, y: frame.midY)
        
        correctWordString.text = ""
        correctWordString.fontSize = 65
        correctWordString.fontColor = SKColor.black
        correctWordString.position = CGPoint(x: 10, y: 20)
        
        currentScore.text = "0"
        currentScore.fontSize = 65
        currentScore.fontColor = SKColor.black
        currentScore.position = CGPoint(x: 0, y: 400)
        
        numBonusStarsLabel.text = "2"
        numBonusStarsLabel.fontSize = 65
        numBonusStarsLabel.fontColor = SKColor.black
        numBonusStarsLabel.position = CGPoint(x: -170, y: 518)
           
        addChild(displayedWord)
        addChild(correctWordString)
        addChild(currentScore)
        addChild(timeLeft)
        addChild(numBonusStarsLabel)
        
        //arrayOfLetters[0][0] = "A"
        
        print("arrayOfLetters: ", arrayOfLetters)
        
        for i in 0...4 {
            for j in 0...4 {
                arrayOfLetters[i][j] = pickLetter()
            }
        }
//
        arrayOfLetters[0][0] = "Z"
        arrayOfLetters[0][1] = "I"
        arrayOfLetters[0][2] = "P"
        arrayOfLetters[0][3] = "S"
 //       arrayOfLetters[0][4] = "K"
//        arrayOfLetters[1][0] = pickLetter()
//        arrayOfLetters[1][1] = pickLetter()
//        arrayOfLetters[1][2] = pickLetter()
//        arrayOfLetters[1][3] = pickLetter()
//        arrayOfLetters[1][4] = pickLetter()
//        arrayOfLetters[2][0] = pickLetter()
//        arrayOfLetters[2][1] = pickLetter()
//        arrayOfLetters[2][2] = pickLetter()
//        arrayOfLetters[2][3] = pickLetter()
//        arrayOfLetters[2][4] = pickLetter()
//        arrayOfLetters[3][0] = pickLetter()
//        arrayOfLetters[3][1] = pickLetter()
//        arrayOfLetters[3][2] = pickLetter()
//        arrayOfLetters[3][3] = pickLetter()
//        arrayOfLetters[3][4] = pickLetter()
//        arrayOfLetters[4][0] = pickLetter()
//        arrayOfLetters[4][1] = pickLetter()
//        arrayOfLetters[4][2] = pickLetter()
//        arrayOfLetters[4][3] = pickLetter()
//        arrayOfLetters[4][4] = pickLetter()
//
   
        
        print("arrayOfLettersRedux: ", arrayOfLetters)
        
    /*    let textureA = SKTexture(imageNamed: "A")
        let textureB = SKTexture(imageNamed: "B")
        let textureC = SKTexture(imageNamed: "C")
        let textureD = SKTexture(imageNamed: "D")
        let textureE = SKTexture(imageNamed: "E")
        let textureF = SKTexture(imageNamed: "F")
        let textureG = SKTexture(imageNamed: "G")
        let textureH = SKTexture(imageNamed: "H")
        let textureI = SKTexture(imageNamed: "I")
        let textureJ = SKTexture(imageNamed: "J")
        let textureK = SKTexture(imageNamed: "K")
        let textureL = SKTexture(imageNamed: "L")
        let textureM = SKTexture(imageNamed: "M")
        let textureN = SKTexture(imageNamed: "N")
        let textureO = SKTexture(imageNamed: "O")
        let textureP = SKTexture(imageNamed: "P")
        let textureQ = SKTexture(imageNamed: "Q")
        let textureR = SKTexture(imageNamed: "R")
        let textureS = SKTexture(imageNamed: "S")
        let textureT = SKTexture(imageNamed: "T")
        let textureU = SKTexture(imageNamed: "U")
        let textureV = SKTexture(imageNamed: "V")
        let textureW = SKTexture(imageNamed: "W")
        let textureX = SKTexture(imageNamed: "X")
        let textureY = SKTexture(imageNamed: "Y")
        let textureZ = SKTexture(imageNamed: "Z")
        
     */
     
     
        self.letter1.texture = SKTexture(imageNamed: arrayOfLetters[0][0])
        self.letter2.texture = SKTexture(imageNamed: arrayOfLetters[0][1])
        self.letter3.texture = SKTexture(imageNamed: arrayOfLetters[0][2])
        self.letter4.texture = SKTexture(imageNamed: arrayOfLetters[0][3])
        self.letter5.texture = SKTexture(imageNamed: arrayOfLetters[0][4])
        self.letter6.texture = SKTexture(imageNamed: arrayOfLetters[1][0])
        self.letter7.texture = SKTexture(imageNamed: arrayOfLetters[1][1])
        self.letter8.texture = SKTexture(imageNamed: arrayOfLetters[1][2])
        self.letter9.texture = SKTexture(imageNamed: arrayOfLetters[1][3])
        self.letter10.texture = SKTexture(imageNamed: arrayOfLetters[1][4])
        self.letter11.texture = SKTexture(imageNamed: arrayOfLetters[2][0])
        self.letter12.texture = SKTexture(imageNamed: arrayOfLetters[2][1])
        self.letter13.texture = SKTexture(imageNamed: arrayOfLetters[2][2])
        self.letter14.texture = SKTexture(imageNamed: arrayOfLetters[2][3])
        self.letter15.texture = SKTexture(imageNamed: arrayOfLetters[2][4])
        self.letter16.texture = SKTexture(imageNamed: arrayOfLetters[3][0])
        self.letter17.texture = SKTexture(imageNamed: arrayOfLetters[3][1])
        self.letter18.texture = SKTexture(imageNamed: arrayOfLetters[3][2])
        self.letter19.texture = SKTexture(imageNamed: arrayOfLetters[3][3])
        self.letter20.texture = SKTexture(imageNamed: arrayOfLetters[3][4])
        self.letter21.texture = SKTexture(imageNamed: arrayOfLetters[4][0])
        self.letter22.texture = SKTexture(imageNamed: arrayOfLetters[4][1])
        self.letter23.texture = SKTexture(imageNamed: arrayOfLetters[4][2])
        self.letter24.texture = SKTexture(imageNamed: arrayOfLetters[4][3])
        self.letter25.texture = SKTexture(imageNamed: arrayOfLetters[4][4])
        
      //  print("pickedLetter = ", pickLetter())
      
     //   print("pick = ", pick)
        
   /*     let sprites = [SKSpriteNode]()
        for i in 0...20 {
            sprites.append(SKSpriteNode(name: "sprite/($0)"))
        }
        
     */

        
      //  let letter1 = SKSpriteNode(imageNamed: arrayOfLetters[0][0])
        letter1.position = CGPoint(x: -190, y: 600)
        addChild(letter1)
        
      //  letter1.colorBlendFactor = 0.5
       // letter1.color = .white
        
        //letter1.color = .green
    //    var letterImage = "A"
        
        print("arrayOfLetters01 = ", arrayOfLetters[0][1])
        
 /*       let letter2 = SKSpriteNode(imageNamed: arrayOfLetters[0][1])
        let letter3 = SKSpriteNode(imageNamed: arrayOfLetters[0][2])
        let letter4 = SKSpriteNode(imageNamed: arrayOfLetters[0][3])
        let letter5 = SKSpriteNode(imageNamed: arrayOfLetters[0][4])
        let letter6 = SKSpriteNode(imageNamed: arrayOfLetters[1][0])
        let letter7 = SKSpriteNode(imageNamed: arrayOfLetters[1][1])
        let letter8 = SKSpriteNode(imageNamed: arrayOfLetters[1][2])
        let letter9 = SKSpriteNode(imageNamed: arrayOfLetters[1][3])
        let letter10 = SKSpriteNode(imageNamed: arrayOfLetters[1][4])
        let letter11 = SKSpriteNode(imageNamed: arrayOfLetters[2][0])
        let letter12 = SKSpriteNode(imageNamed: arrayOfLetters[2][1])
        let letter13 = SKSpriteNode(imageNamed: arrayOfLetters[2][2])
        let letter14 = SKSpriteNode(imageNamed: arrayOfLetters[2][3])
        let letter15 = SKSpriteNode(imageNamed: arrayOfLetters[2][4])
        let letter16 = SKSpriteNode(imageNamed: arrayOfLetters[3][0])
        let letter17 = SKSpriteNode(imageNamed: arrayOfLetters[3][1])
        let letter18 = SKSpriteNode(imageNamed: arrayOfLetters[3][2])
        let letter19 = SKSpriteNode(imageNamed: arrayOfLetters[3][3])
        let letter20 = SKSpriteNode(imageNamed: arrayOfLetters[3][4])
        let letter21 = SKSpriteNode(imageNamed: arrayOfLetters[4][0])
        let letter22 = SKSpriteNode(imageNamed: arrayOfLetters[4][1])
        let letter23 = SKSpriteNode(imageNamed: arrayOfLetters[4][2])
        let letter24 = SKSpriteNode(imageNamed: arrayOfLetters[4][3])
        let letter25 = SKSpriteNode(imageNamed: arrayOfLetters[4][4])
  
  */
        
        letter1.colorBlendFactor = 0.5
        letter2.colorBlendFactor = 0.5
        letter3.colorBlendFactor = 0.5
        letter4.colorBlendFactor = 0.5
        letter5.colorBlendFactor = 0.5
        letter6.colorBlendFactor = 0.5
        letter7.colorBlendFactor = 0.5
        letter8.colorBlendFactor = 0.5
        letter9.colorBlendFactor = 0.5
        letter10.colorBlendFactor = 0.5
        letter11.colorBlendFactor = 0.5
        letter12.colorBlendFactor = 0.5
        letter13.colorBlendFactor = 0.5
        letter14.colorBlendFactor = 0.5
        letter15.colorBlendFactor = 0.5
        letter16.colorBlendFactor = 0.5
        letter17.colorBlendFactor = 0.5
        letter18.colorBlendFactor = 0.5
        letter19.colorBlendFactor = 0.5
        letter20.colorBlendFactor = 0.5
        letter21.colorBlendFactor = 0.5
        letter22.colorBlendFactor = 0.5
        letter23.colorBlendFactor = 0.5
        letter24.colorBlendFactor = 0.5
        letter25.colorBlendFactor = 0.5
        
        letter1.color = .white
        letter2.color = .white
        letter3.color = .white
        letter4.color = .white
        letter5.color = .white
        letter6.color = .white
        letter7.color = .white
        letter8.color = .white
        letter9.color = .white
        letter10.color = .white
        letter11.color = .white
        letter12.color = .white
        letter13.color = .white
        letter14.color = .white
        letter15.color = .white
        letter16.color = .white
        letter17.color = .white
        letter18.color = .white
        letter19.color = .white
        letter20.color = .white
        letter21.color = .white
        letter22.color = .white
        letter23.color = .white
        letter24.color = .white
        letter25.color = .white
        
        
        let actionMove = SKAction.move(to: CGPoint(x: -190, y: -500),
                                       duration: TimeInterval(0.25))
        let actionMove2 = SKAction.move(to: CGPoint(x: -90, y: -500),
                                        duration: TimeInterval(0.25))
        let actionMove3 = SKAction.move(to: CGPoint(x: 10, y: -500),
                                        duration: TimeInterval(0.25))
        let actionMove4 = SKAction.move(to: CGPoint(x: 110, y: -500),
                                        duration: TimeInterval(0.25))
        let actionMove5 = SKAction.move(to: CGPoint(x: 210, y: -500),
                                        duration: TimeInterval(0.25))
        let actionMove6 = SKAction.move(to: CGPoint(x: -190, y: -400),
                                        duration: TimeInterval(0.25))
        let actionMove7 = SKAction.move(to: CGPoint(x: -90, y: -400),
                                        duration: TimeInterval(0.25))
        let actionMove8 = SKAction.move(to: CGPoint(x: 10, y: -400),
                                        duration: TimeInterval(0.25))
        let actionMove9 = SKAction.move(to: CGPoint(x: 110, y: -400),
                                        duration: TimeInterval(0.25))
        let actionMove10 = SKAction.move(to: CGPoint(x: 210, y: -400),
                                         duration: TimeInterval(0.25))
        let actionMove11 = SKAction.move(to: CGPoint(x: -190, y: -300),
                                         duration: TimeInterval(0.25))
        let actionMove12 = SKAction.move(to: CGPoint(x: -90, y: -300),
                                         duration: TimeInterval(0.25))
        let actionMove13 = SKAction.move(to: CGPoint(x: 10, y: -300),
                                         duration: TimeInterval(0.25))
        let actionMove14 = SKAction.move(to: CGPoint(x: 110, y: -300),
                                         duration: TimeInterval(0.25))
        let actionMove15 = SKAction.move(to: CGPoint(x: 210, y: -300),
                                         duration: TimeInterval(0.25))
        let actionMove16 = SKAction.move(to: CGPoint(x: -190, y: -200),
                                         duration: TimeInterval(0.25))
        let actionMove17 = SKAction.move(to: CGPoint(x: -90, y: -200),
                                         duration: TimeInterval(0.25))
        let actionMove18 = SKAction.move(to: CGPoint(x: 10, y: -200),
                                         duration: TimeInterval(0.25))
        let actionMove19 = SKAction.move(to: CGPoint(x: 110, y: -200),
                                         duration: TimeInterval(0.25))
        let actionMove20 = SKAction.move(to: CGPoint(x: 210, y: -200),
                                         duration: TimeInterval(0.25))
        let actionMove21 = SKAction.move(to: CGPoint(x: -190, y: -100),
                                         duration: TimeInterval(0.25))
        let actionMove22 = SKAction.move(to: CGPoint(x: -90, y: -100),
                                         duration: TimeInterval(0.25))
        let actionMove23 = SKAction.move(to: CGPoint(x: 10, y: -100),
                                         duration: TimeInterval(0.25))
        let actionMove24 = SKAction.move(to: CGPoint(x: 110, y: -100),
                                         duration: TimeInterval(0.25))
        let actionMove25 = SKAction.move(to: CGPoint(x: 210, y: -100),
                                         duration: TimeInterval(0.25))
        
        
        
        
        letter1.run(actionMove, completion: {
            moveLetter2()
        })
        
        func moveLetter2() {
          //  let letter2 = SKSpriteNode(imageNamed: "letterA")
            letter2.position = CGPoint(x: -90, y: 600)
            addChild(letter2)
            
       //     let actionMove2 = SKAction.move(to: CGPoint(x: -90, y: -500),
        //                                    duration: TimeInterval(0.25)
        //    )
            letter2.run(actionMove2, completion: {
                moveLetter3()
            })
            
        }
        
        func moveLetter3() {
            //let letter3 = SKSpriteNode(imageNamed: "letterA")
            letter3.position = CGPoint(x: 10, y: 600)
            addChild(letter3)
            
            
            letter3.run(actionMove3, completion: {
                moveLetter4()
            })
        }
        
        func moveLetter4() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter4.position = CGPoint(x: 110, y: 600)
            addChild(letter4)
            
            
            letter4.run(actionMove4, completion: {
                moveLetter5()
            })
        }
        
        func moveLetter5() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter5.position = CGPoint(x: 210, y: 600)
            addChild(letter5)
            
            
            letter5.run(actionMove5, completion: {
                 moveLetter6()
            })
        }
        
        func moveLetter6() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter6.position = CGPoint(x: -190, y: 600)
            addChild(letter6)
            
           
            letter6.run(actionMove6, completion: {
                 moveLetter7()
            })
        }
        
        func moveLetter7() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter7.position = CGPoint(x: -90, y: 600)
            addChild(letter7)
            
            
            letter7.run(actionMove7, completion: {
                 moveLetter8()
            })
        }
        
        func moveLetter8() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter8.position = CGPoint(x: 10, y: 600)
            addChild(letter8)
            
           
            letter8.run(actionMove8, completion: {
                 moveLetter9()
            })
        }
        
        func moveLetter9() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter9.position = CGPoint(x: 110, y: 600)
            addChild(letter9)
            
            
            letter9.run(actionMove9, completion: {
                 moveLetter10()
            })
        }
        
        func moveLetter10() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter10.position = CGPoint(x: 210, y: 600)
            addChild(letter10)
            
            
            letter10.run(actionMove10, completion: {
                 moveLetter11()
            })
        }
        
        func moveLetter11() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter11.position = CGPoint(x: -190, y: 600)
            addChild(letter11)
            
            
            letter11.run(actionMove11, completion: {
                 moveLetter12()
            })
        }
        
        func moveLetter12() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter12.position = CGPoint(x: -90, y: 600)
            addChild(letter12)
            
            
            letter12.run(actionMove12, completion: {
                moveLetter13()
            })
        }
        
        func moveLetter13() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter13.position = CGPoint(x: 10, y: 600)
            addChild(letter13)
            
            
            letter13.run(actionMove13, completion: {
                 moveLetter14()
            })
        }
        
        func moveLetter14() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter14.position = CGPoint(x: 110, y: 600)
            addChild(letter14)
            
            
            letter14.run(actionMove14, completion: {
                 moveLetter15()
            })
        }
        
        func moveLetter15() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter15.position = CGPoint(x: 210, y: 600)
            addChild(letter15)
            
            
            letter15.run(actionMove15, completion: {
                 moveLetter16()
            })
        }
        
        func moveLetter16() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter16.position = CGPoint(x: -190, y: 600)
            addChild(letter16)
            
            
            letter16.run(actionMove16, completion: {
                 moveLetter17()
            })
        }
        
        func moveLetter17() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter17.position = CGPoint(x: -90, y: 600)
            addChild(letter17)
            
            
            letter17.run(actionMove17, completion: {
                 moveLetter18()
            })
        }
        
        func moveLetter18() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter18.position = CGPoint(x: 10, y: 600)
            addChild(letter18)
            
            
            letter18.run(actionMove18, completion: {
                 moveLetter19()
            })
        }
        
        func moveLetter19() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter19.position = CGPoint(x: 110, y: 600)
            addChild(letter19)
            
            
            letter19.run(actionMove19, completion: {
                 moveLetter20()
            })
        }
        
        func moveLetter20() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter20.position = CGPoint(x: 210, y: 600)
            addChild(letter20)
            
            
            letter20.run(actionMove20, completion: {
                 moveLetter21()
            })
        }
        
        func moveLetter21() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter21.position = CGPoint(x: -190, y: 600)
            addChild(letter21)
            
            
            letter21.run(actionMove21, completion: {
                 moveLetter22()
            })
        }
        
        func moveLetter22() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter22.position = CGPoint(x: -90, y: 600)
            addChild(letter22)
            
            
            letter22.run(actionMove22, completion: {
                 moveLetter23()
            })
        }
        
        func moveLetter23() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter23.position = CGPoint(x: 10, y: 600)
            addChild(letter23)
            
            
            letter23.run(actionMove23, completion: {
                 moveLetter24()
            })
        }
        
        func moveLetter24() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter24.position = CGPoint(x: 110, y: 600)
            addChild(letter24)
            
            
            letter24.run(actionMove24, completion: {
                 moveLetter25()
            })
        }
        
        func moveLetter25() {
            //let letter4 = SKSpriteNode(imageNamed: "letterA")
            letter25.position = CGPoint(x: 210, y: 600)
            addChild(letter25)
            
            
            letter25.run(actionMove25, completion: {
             //   let textureA = SKTexture(imageNamed: "A")
            //    self.letter1.texture = textureA
                
             //   let wait = SKAction.wait(forDuration: 1)
               // self.timeLeft.run(wait, completion: {
                 //   self.timeLeftAsInt = self.timeLeftAsInt - 1
                   // self.timeLeft.text = "\(self.timeLeftAsInt)"
                
                beginCountdown()
                    
              //  })
            })
        }
        
        func beginCountdown() {
            let wait = SKAction.wait(forDuration: 1)
            self.timeLeft.run(wait, completion: {
                self.timeLeftAsInt = self.timeLeftAsInt - 1
                self.timeLeft.text = "\(self.timeLeftAsInt)"
                if (self.timeLeftAsInt == 0) {
                    print("Timer has reached 0")
                    self.roundNumber += 1
                    
                    print("roundNumber is ", self.roundNumber)
                    
                    if (self.roundNumber > 1) {
                        
                        print ("round number is higher than 5")
                        
                        let scoreScene = ScoreScene(fileNamed: "ScoreScene")!
                        scoreScene.scaleMode = .aspectFill
                       // scene.size = (CGSize(width: 10, height: 50))
                      //  scene.scaleMode = SKSceneScaleMode.resizeFill
                        let transition = SKTransition.doorway(withDuration: 2)
                        self.view?.presentScene(scoreScene, transition: transition)
                    }
                    else {
                        
                        print("alaska")
                        removeLetters()

                    }
                    
                    
                    
                    
                    
                   
                 //   replaceLetters()
                }
                else {
                    beginCountdown()
                }
            })
            
        }
        
        func replaceLetters() {
            
            arrayOfLetters[0][0] = pickLetter()
            arrayOfLetters[0][1] = pickLetter()
            arrayOfLetters[0][2] = pickLetter()
            arrayOfLetters[0][3] = pickLetter()
            arrayOfLetters[0][4] = pickLetter()
            arrayOfLetters[1][0] = pickLetter()
            arrayOfLetters[1][1] = pickLetter()
            arrayOfLetters[1][2] = pickLetter()
            arrayOfLetters[1][3] = pickLetter()
            arrayOfLetters[1][4] = pickLetter()
            arrayOfLetters[2][0] = pickLetter()
            arrayOfLetters[2][1] = pickLetter()
            arrayOfLetters[2][2] = pickLetter()
            arrayOfLetters[2][3] = pickLetter()
            arrayOfLetters[2][4] = pickLetter()
            arrayOfLetters[3][0] = pickLetter()
            arrayOfLetters[3][1] = pickLetter()
            arrayOfLetters[3][2] = pickLetter()
            arrayOfLetters[3][3] = pickLetter()
            arrayOfLetters[3][4] = pickLetter()
            arrayOfLetters[4][0] = pickLetter()
            arrayOfLetters[4][1] = pickLetter()
            arrayOfLetters[4][2] = pickLetter()
            arrayOfLetters[4][3] = pickLetter()
            arrayOfLetters[4][4] = pickLetter()
            
            self.letter1.texture = SKTexture(imageNamed: arrayOfLetters[0][0])
            self.letter2.texture = SKTexture(imageNamed: arrayOfLetters[0][1])
            self.letter3.texture = SKTexture(imageNamed: arrayOfLetters[0][2])
            self.letter4.texture = SKTexture(imageNamed: arrayOfLetters[0][3])
            self.letter5.texture = SKTexture(imageNamed: arrayOfLetters[0][4])
            self.letter6.texture = SKTexture(imageNamed: arrayOfLetters[1][0])
            self.letter7.texture = SKTexture(imageNamed: arrayOfLetters[1][1])
            self.letter8.texture = SKTexture(imageNamed: arrayOfLetters[1][2])
            self.letter9.texture = SKTexture(imageNamed: arrayOfLetters[1][3])
            self.letter10.texture = SKTexture(imageNamed: arrayOfLetters[1][4])
            self.letter11.texture = SKTexture(imageNamed: arrayOfLetters[2][0])
            self.letter12.texture = SKTexture(imageNamed: arrayOfLetters[2][1])
            self.letter13.texture = SKTexture(imageNamed: arrayOfLetters[2][2])
            self.letter14.texture = SKTexture(imageNamed: arrayOfLetters[2][3])
            self.letter15.texture = SKTexture(imageNamed: arrayOfLetters[2][4])
            self.letter16.texture = SKTexture(imageNamed: arrayOfLetters[3][0])
            self.letter17.texture = SKTexture(imageNamed: arrayOfLetters[3][1])
            self.letter18.texture = SKTexture(imageNamed: arrayOfLetters[3][2])
            self.letter19.texture = SKTexture(imageNamed: arrayOfLetters[3][3])
            self.letter20.texture = SKTexture(imageNamed: arrayOfLetters[3][4])
            self.letter21.texture = SKTexture(imageNamed: arrayOfLetters[4][0])
            self.letter22.texture = SKTexture(imageNamed: arrayOfLetters[4][1])
            self.letter23.texture = SKTexture(imageNamed: arrayOfLetters[4][2])
            self.letter24.texture = SKTexture(imageNamed: arrayOfLetters[4][3])
            self.letter25.texture = SKTexture(imageNamed: arrayOfLetters[4][4])
            
            print("arrayOfLetters after changing them: ", arrayOfLetters)
            
            letter1.position = CGPoint(x: -190, y: 600)
            letter2.position = CGPoint(x: -90, y: 600)
            letter3.position = CGPoint(x: 10, y: 600)
            letter4.position = CGPoint(x: 110, y: 600)
            letter5.position = CGPoint(x: 210, y: 600)
            letter1.run(actionMove)
            letter2.run(actionMove2)
            letter3.run(actionMove3)
            letter4.run(actionMove4)
            letter5.run(actionMove5, completion: {
                self.letter6.position = CGPoint(x: -190, y: 600)
                self.letter7.position = CGPoint(x: -90, y: 600)
                self.letter8.position = CGPoint(x: 10, y: 600)
                self.letter9.position = CGPoint(x: 110, y: 600)
                self.letter10.position = CGPoint(x: 210, y: 600)
                self.letter6.run(actionMove6)
                self.letter7.run(actionMove7)
                self.letter8.run(actionMove8)
                self.letter9.run(actionMove9)
                self.letter10.run(actionMove10, completion: {
                    self.letter11.position = CGPoint(x: -190, y: 600)
                    self.letter12.position = CGPoint(x: -90, y: 600)
                    self.letter13.position = CGPoint(x: 10, y: 600)
                    self.letter14.position = CGPoint(x: 110, y: 600)
                    self.letter15.position = CGPoint(x: 210, y: 600)
                    self.letter11.run(actionMove11)
                    self.letter12.run(actionMove12)
                    self.letter13.run(actionMove13)
                    self.letter14.run(actionMove14)
                    self.letter15.run(actionMove15, completion: {
                        self.letter16.position = CGPoint(x: -190, y: 600)
                        self.letter17.position = CGPoint(x: -90, y: 600)
                        self.letter18.position = CGPoint(x: 10, y: 600)
                        self.letter19.position = CGPoint(x: 110, y: 600)
                        self.letter20.position = CGPoint(x: 210, y: 600)
                        self.letter16.run(actionMove16)
                        self.letter17.run(actionMove17)
                        self.letter18.run(actionMove18)
                        self.letter19.run(actionMove19)
                        self.letter20.run(actionMove20, completion: {
                            self.letter21.position = CGPoint(x: -190, y: 600)
                            self.letter22.position = CGPoint(x: -90, y: 600)
                            self.letter23.position = CGPoint(x: 10, y: 600)
                            self.letter24.position = CGPoint(x: 110, y: 600)
                            self.letter25.position = CGPoint(x: 210, y: 600)
                            self.letter21.run(actionMove21)
                            self.letter22.run(actionMove22)
                            self.letter23.run(actionMove23)
                            self.letter24.run(actionMove24)
                            self.letter25.run(actionMove25, completion: {
                                self.timeLeftAsInt = 30
                                self.timeLeft.text = "30"
                               // self.roundNumber += 1
                               // if (self.roundNumber < 6) {
                                    beginCountdown()
                               // }
                                
                            })
                        })
                    })
                })
            })
            
            
        }
        
        func removeLetters() {
            let removeLetter1 = SKAction.move(to: CGPoint(x: -190, y: -800), duration: TimeInterval(0.25))
            let removeLetter2 = SKAction.move(to: CGPoint(x: -90, y: -800), duration: TimeInterval(0.25))
            let removeLetter3 = SKAction.move(to: CGPoint(x: 10, y: -800), duration: TimeInterval(0.25))
            let removeLetter4 = SKAction.move(to: CGPoint(x: 110, y: -800), duration: TimeInterval(0.25))
            let removeLetter5 = SKAction.move(to: CGPoint(x: 210, y: -800), duration: TimeInterval(0.25))
        /*    let removeLetter6 = SKAction.move(to: CGPoint(x: -190, y: -800), duration: TimeInterval(0.25))
            let removeLetter7 = SKAction.move(to: CGPoint(x: -90, y: -800), duration: TimeInterval(0.25))
            let removeLetter8 = SKAction.move(to: CGPoint(x: 10, y: -800), duration: TimeInterval(0.25))
            let removeLetter9 = SKAction.move(to: CGPoint(x: 110, y: -800), duration: TimeInterval(0.25))
            let removeLetter10 = SKAction.move(to: CGPoint(x: 210, y: -800), duration: TimeInterval(0.25))
            let removeLetter11 = SKAction.move(to: CGPoint(x: -190, y: -800), duration: TimeInterval(0.25))
            let removeLetter12 = SKAction.move(to: CGPoint(x: -90, y: -800), duration: TimeInterval(0.25))
            let removeLetter13 = SKAction.move(to: CGPoint(x: 10, y: -800), duration: TimeInterval(0.25))
            let removeLetter14 = SKAction.move(to: CGPoint(x: 110, y: -800), duration: TimeInterval(0.25))
            let removeLetter15 = SKAction.move(to: CGPoint(x: 210, y: -800), duration: TimeInterval(0.25))
            let removeLetter16 = SKAction.move(to: CGPoint(x: -190, y: -800), duration: TimeInterval(0.25))
            let removeLetter17 = SKAction.move(to: CGPoint(x: -90, y: -800), duration: TimeInterval(0.25))
            let removeLetter18 = SKAction.move(to: CGPoint(x: 10, y: -800), duration: TimeInterval(0.25))
            let removeLetter19 = SKAction.move(to: CGPoint(x: 110, y: -800), duration: TimeInterval(0.25))
            let removeLetter20 = SKAction.move(to: CGPoint(x: 210, y: -800), duration: TimeInterval(0.25))
            
         */
         
            letter1.run(removeLetter1)
            letter2.run(removeLetter2)
            letter3.run(removeLetter3)
            letter4.run(removeLetter4)
            letter5.run(removeLetter5, completion: {
                self.letter6.run(removeLetter1)
                self.letter7.run(removeLetter2)
                self.letter8.run(removeLetter3)
                self.letter9.run(removeLetter4)
                self.letter10.run(removeLetter5, completion: {
                    self.letter11.run(removeLetter1)
                    self.letter12.run(removeLetter2)
                    self.letter13.run(removeLetter3)
                    self.letter14.run(removeLetter4)
                    self.letter15.run(removeLetter5, completion: {
                        self.letter16.run(removeLetter1)
                        self.letter17.run(removeLetter2)
                        self.letter18.run(removeLetter3)
                        self.letter19.run(removeLetter4)
                        self.letter20.run(removeLetter5, completion: {
                            self.letter21.run(removeLetter1)
                            self.letter22.run(removeLetter2)
                            self.letter23.run(removeLetter3)
                            self.letter24.run(removeLetter4)
                            self.letter25.run(removeLetter5, completion: {
                                replaceLetters()
                                
                            })
                        })
                        
                        
                    })
                    
                })
            })
        }
      //  letter4.color = .white
        
       /* let letter2 = SKSpriteNode(imageNamed: "letterA")
        letter2.position = CGPoint(x: -80, y: 600)
        addChild(letter2)
        
        let actionMove2 = SKAction.move(to: CGPoint(x: -80, y: -500),
                                        duration: TimeInterval(1)
        )
        letter2.run(actionMove2)
        
        */
        

        
        print(isReal(word:"kdlylxibokrmmacfnscvxc"))
        

        
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("array of selected letters in word: ", arrayOfLettersAlreadyInWord)
        
        
        func thisLetterIsSelected(x: Int, y: Int) -> Bool {
            
            print("blahblbah")
         
            if (arrayOfLettersAlreadyInWord[x][y] == true) {
                return true
            }
            
            return false
        }
        
        func nearbyLettersAreSelected(x: Int, y: Int) -> Bool {
            
            print("X = ", x, " Y = ", y)
            
            if (x - 1 >= 0) {
                if (arrayOfSelectedLetters[x - 1][y]) {
                    return true
                }
            }
            
            if (y - 1 >= 0) {
                if (arrayOfSelectedLetters[x][y - 1]) {
                    return true
                }
            }
            
            if (x - 1 >= 0 && y - 1 >= 0) {
                if (arrayOfSelectedLetters[x - 1][y - 1]) {
                    return true
                }
            }
            
            if (x + 1 <= 4) {
                if (arrayOfSelectedLetters[x + 1][y]) {
                    return true
                }
            }
            if (y + 1 <= 4) {
                if (arrayOfSelectedLetters[x][y+1]) {
                    return true
                }
            }
            
            if (x - 1 >= 0 && y + 1 <= 4) {
                if (arrayOfSelectedLetters[x - 1][y + 1]) {
                    return true
                }
            }
            
            if (x + 1 <= 4 && y - 1 >= 0) {
                if (arrayOfSelectedLetters[x + 1][y - 1]) {
                    return true
                }
            }
            
            if (x + 1 <= 4 && y + 1 <= 4 ) {
                if (arrayOfSelectedLetters[x + 1][y + 1]) {
                    return true
                }
            }
            
            return false
        }
        

        
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            if letter1.contains(location) {
                
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[0][0] = true
                    letter1.color = .green
                    arrayOfLettersAlreadyInWord[0][0] = true
                    
                    
                    print("arrayOfLetters[0][0] = ", arrayOfLetters[0][0])
                    chosenWord.append(arrayOfLetters[0][0])
                    print("chosenWord = ", chosenWord)
                    
                    displayedWord.text = chosenWord
                  //  print("displayedWord.text = ", displayedWord.text)
                }
                
                if (anyLetterSelected) {
                    
                    print ("Selected letter is true or false: ", thisLetterIsSelected(x: 0, y: 0))
                    
                    print("Array of letters in word ", arrayOfLettersAlreadyInWord)
                    
                    if (nearbyLettersAreSelected(x:0, y:0) && !thisLetterIsSelected(x: 0, y: 0)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[0][0] = true
                        letter1.color = .green
                        arrayOfLettersAlreadyInWord[0][0] = true
                        
                        chosenWord.append(arrayOfLetters[0][0])
                        print("chosenWord = ", chosenWord)
                        
                        displayedWord.text = chosenWord
                        
                  /*      let scaleUpAction = SKAction.scale(to: 2, duration: 0.3)
                        let scaleDownAction = SKAction.scale(to: 1, duration: 0.3)
                        let actionSequence = SKAction.sequence([scaleUpAction, scaleDownAction])
                        */
                    //    displayedWord.run(actionSequence)
                        
                    }
                }
            }
            if letter2.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[0][1] = true
                    letter2.color = .green
                    arrayOfLettersAlreadyInWord[0][1] = true
                    chosenWord.append(arrayOfLetters[0][1])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:0, y:1) && !thisLetterIsSelected(x: 0, y: 1)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[0][1] = true
                        letter2.color = .green
                        arrayOfLettersAlreadyInWord[0][1] = true
                        chosenWord.append(arrayOfLetters[0][1])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter3.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[0][2] = true
                    letter3.color = .green
                    arrayOfLettersAlreadyInWord[0][2] = true
                    chosenWord.append(arrayOfLetters[0][2])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:0, y:2) && !thisLetterIsSelected(x: 0, y: 2)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[0][2] = true
                        letter3.color = .green
                        arrayOfLettersAlreadyInWord[0][2] = true
                        chosenWord.append(arrayOfLetters[0][2])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter4.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[0][3] = true
                    letter4.color = .green
                    arrayOfLettersAlreadyInWord[0][3] = true
                    chosenWord.append(arrayOfLetters[0][3])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:0, y:3) && !thisLetterIsSelected(x: 0, y: 3)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[0][3] = true
                        letter4.color = .green
                        arrayOfLettersAlreadyInWord[0][3] = true
                        chosenWord.append(arrayOfLetters[0][3])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter5.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[0][4] = true
                    letter5.color = .green
                    arrayOfLettersAlreadyInWord[0][4] = true
                    chosenWord.append(arrayOfLetters[0][4])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:0, y:4) && !thisLetterIsSelected(x: 0, y: 4)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[0][4] = true
                        letter5.color = .green
                        arrayOfLettersAlreadyInWord[0][4] = true
                        chosenWord.append(arrayOfLetters[0][4])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter6.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[1][0] = true
                    letter6.color = .green
                    arrayOfLettersAlreadyInWord[1][0] = true
                    chosenWord.append(arrayOfLetters[1][0])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:1, y:0) && !thisLetterIsSelected(x: 1, y: 0)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[1][0] = true
                        letter6.color = .green
                        arrayOfLettersAlreadyInWord[1][0] = true
                        chosenWord.append(arrayOfLetters[1][0])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter7.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[1][1] = true
                    letter7.color = .green
                    arrayOfLettersAlreadyInWord[1][1] = true
                    chosenWord.append(arrayOfLetters[1][1])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:1, y:1) && !thisLetterIsSelected(x: 1, y: 1)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[1][1] = true
                        letter7.color = .green
                        arrayOfLettersAlreadyInWord[1][1] = true
                        chosenWord.append(arrayOfLetters[1][1])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter8.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[1][2] = true
                    letter8.color = .green
                    arrayOfLettersAlreadyInWord[1][2] = true
                    chosenWord.append(arrayOfLetters[1][2])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:1, y:2) && !thisLetterIsSelected(x: 1, y: 2)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[1][2] = true
                        letter8.color = .green
                        arrayOfLettersAlreadyInWord[1][2] = true
                        chosenWord.append(arrayOfLetters[1][2])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter9.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[1][3] = true
                    letter9.color = .green
                    arrayOfLettersAlreadyInWord[1][3] = true
                    chosenWord.append(arrayOfLetters[1][3])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:1, y:3) && !thisLetterIsSelected(x: 1, y: 3)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[1][3] = true
                        letter9.color = .green
                        arrayOfLettersAlreadyInWord[1][3] = true
                        chosenWord.append(arrayOfLetters[1][3])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter10.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[1][4] = true
                    letter10.color = .green
                    arrayOfLettersAlreadyInWord[1][4] = true
                    chosenWord.append(arrayOfLetters[1][4])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:1, y:4) && !thisLetterIsSelected(x: 1, y: 4)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[1][4] = true
                        letter10.color = .green
                        arrayOfLettersAlreadyInWord[1][4] = true
                        chosenWord.append(arrayOfLetters[1][4])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter11.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[2][0] = true
                    letter11.color = .green
                    arrayOfLettersAlreadyInWord[2][0] = true
                    chosenWord.append(arrayOfLetters[2][0])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:2, y:0) && !thisLetterIsSelected(x: 2, y: 0)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[2][0] = true
                        letter11.color = .green
                        arrayOfLettersAlreadyInWord[2][0] = true
                        chosenWord.append(arrayOfLetters[2][0])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter12.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[2][1] = true
                    letter12.color = .green
                    arrayOfLettersAlreadyInWord[2][1] = true
                    chosenWord.append(arrayOfLetters[2][1])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:2, y:1) && !thisLetterIsSelected(x: 2, y: 1)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[2][1] = true
                        letter12.color = .green
                        arrayOfLettersAlreadyInWord[2][1] = true
                        chosenWord.append(arrayOfLetters[2][1])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter13.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[2][2] = true
                    letter13.color = .green
                    arrayOfLettersAlreadyInWord[2][2] = true
                    chosenWord.append(arrayOfLetters[2][2])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:2, y:2) && !thisLetterIsSelected(x: 2, y: 2)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[2][2] = true
                        letter13.color = .green
                        arrayOfLettersAlreadyInWord[2][2] = true
                        chosenWord.append(arrayOfLetters[2][2])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter14.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[2][3] = true
                    letter14.color = .green
                    arrayOfLettersAlreadyInWord[2][3] = true
                    chosenWord.append(arrayOfLetters[2][3])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:2, y:3) && !thisLetterIsSelected(x: 2, y: 3)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[2][3] = true
                        letter14.color = .green
                        arrayOfLettersAlreadyInWord[2][3] = true
                        chosenWord.append(arrayOfLetters[2][3])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter15.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[2][4] = true
                    letter15.color = .green
                    arrayOfLettersAlreadyInWord[2][4] = true
                    chosenWord.append(arrayOfLetters[2][4])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:2, y:4) && !thisLetterIsSelected(x: 2, y: 4)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[2][4] = true
                        letter15.color = .green
                        arrayOfLettersAlreadyInWord[2][4] = true
                        chosenWord.append(arrayOfLetters[2][4])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter16.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[3][0] = true
                    letter16.color = .green
                    arrayOfLettersAlreadyInWord[3][0] = true
                    chosenWord.append(arrayOfLetters[3][0])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:3, y:0) && !thisLetterIsSelected(x: 3, y: 0)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[3][0] = true
                        letter16.color = .green
                        arrayOfLettersAlreadyInWord[3][0] = true
                        chosenWord.append(arrayOfLetters[3][0])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter17.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[3][1] = true
                    letter17.color = .green
                    arrayOfLettersAlreadyInWord[3][1] = true
                    chosenWord.append(arrayOfLetters[3][1])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:3, y:1) && !thisLetterIsSelected(x: 3, y: 1)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[3][1] = true
                        letter17.color = .green
                        arrayOfLettersAlreadyInWord[3][1] = true
                        chosenWord.append(arrayOfLetters[3][1])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter18.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[3][2] = true
                    letter18.color = .green
                    arrayOfLettersAlreadyInWord[3][2] = true
                    chosenWord.append(arrayOfLetters[3][2])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:3, y:2) && !thisLetterIsSelected(x: 3, y: 2)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[3][2] = true
                        letter18.color = .green
                        arrayOfLettersAlreadyInWord[3][2] = true
                        chosenWord.append(arrayOfLetters[3][2])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter19.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[3][3] = true
                    letter19.color = .green
                    arrayOfLettersAlreadyInWord[3][3] = true
                    chosenWord.append(arrayOfLetters[3][3])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:3, y:3) && !thisLetterIsSelected(x: 3, y: 3)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[3][3] = true
                        letter19.color = .green
                        arrayOfLettersAlreadyInWord[3][3] = true
                        chosenWord.append(arrayOfLetters[3][3])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter20.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[3][4] = true
                    letter20.color = .green
                    arrayOfLettersAlreadyInWord[3][4] = true
                    chosenWord.append(arrayOfLetters[3][4])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:3, y:4) && !thisLetterIsSelected(x: 3, y: 4)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[3][4] = true
                        letter20.color = .green
                        arrayOfLettersAlreadyInWord[3][4] = true
                        chosenWord.append(arrayOfLetters[3][4])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter21.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[4][0] = true
                    letter21.color = .green
                    arrayOfLettersAlreadyInWord[4][0] = true
                    chosenWord.append(arrayOfLetters[4][0])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:4, y:0) && !thisLetterIsSelected(x: 4, y: 0)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[4][0] = true
                        letter21.color = .green
                        arrayOfLettersAlreadyInWord[4][0] = true
                        chosenWord.append(arrayOfLetters[4][0])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter22.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[4][1] = true
                    letter22.color = .green
                    arrayOfLettersAlreadyInWord[4][1] = true
                    chosenWord.append(arrayOfLetters[4][1])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:4, y:1) && !thisLetterIsSelected(x: 4, y: 1)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[4][1] = true
                        letter22.color = .green
                        arrayOfLettersAlreadyInWord[4][1] = true
                        chosenWord.append(arrayOfLetters[4][1])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter23.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[4][2] = true
                    letter23.color = .green
                    arrayOfLettersAlreadyInWord[4][2] = true
                    chosenWord.append(arrayOfLetters[4][2])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:4, y:2) && !thisLetterIsSelected(x: 4, y: 2)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[4][2] = true
                        letter23.color = .green
                        arrayOfLettersAlreadyInWord[4][2] = true
                        chosenWord.append(arrayOfLetters[4][2])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter24.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[4][3] = true
                    letter24.color = .green
                    arrayOfLettersAlreadyInWord[4][3] = true
                    chosenWord.append(arrayOfLetters[4][3])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:4, y:3) && !thisLetterIsSelected(x: 4, y: 3)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[4][3] = true
                        letter24.color = .green
                        arrayOfLettersAlreadyInWord[4][3] = true
                        chosenWord.append(arrayOfLetters[4][3])
                        displayedWord.text = chosenWord
                    }
                }
            }
            if letter25.contains(location) {
                if (!anyLetterSelected) {
                    anyLetterSelected = true
                    arrayOfSelectedLetters[4][4] = true
                    letter25.color = .green
                    arrayOfLettersAlreadyInWord[4][4] = true
                    chosenWord.append(arrayOfLetters[4][4])
                    displayedWord.text = chosenWord
                }
                
                if (anyLetterSelected) {
                    if (nearbyLettersAreSelected(x:4, y:4) && !thisLetterIsSelected(x: 4, y: 4)) {
                        clearOldSelectedLetters()
                        arrayOfSelectedLetters[4][4] = true
                        letter25.color = .green
                        arrayOfLettersAlreadyInWord[4][4] = true
                        chosenWord.append(arrayOfLetters[4][4])
                        displayedWord.text = chosenWord
                    }
                }
            }
        }
    }
    
    func calculateScore() -> Int {
        
        if (chosenWord.count == 3) {
            numThreeLetterWords += 1
            
            return 100
        }
        if (chosenWord.count == 4) {
            numFourLetterWords += 1
            return 350
        }
        if (chosenWord.count == 5) {
            numFiveLetterWords += 1
            return 1000
        }
        if (chosenWord.count == 6) {
            numSixLetterWords += 1
            return 3000
        }
        if (chosenWord.count == 7) {
            numSevenLetterWords += 1
            return 5000
        }
        if (chosenWord.count == 8){
            numEightLetterWords += 1
            return 10000
        }
        
        return 0
    }
    
    func checkForBonusStars(word: String) -> Bool {
        
        
        var output = false
        
        print ("Begun checking for bonus stars")
        print ("word for bonus stars is", word)
        
        let tmpLetter = bonusLetter.lowercased()
        
        if (word.contains(tmpLetter)) {
            print ("Word contains bonus letter")
            numStarsCollected += 1
            numBonusStarsLabel.text = "\(numStarsCollected)"
            output = true
        }
        
        else {
            print ("Word does not contain bonus letter")
        }
        
        if (secondBonusAsInt == 0) {
            
            //3 or more vowels
         
            var numbOfVowels = 0

            for c in word {
                if ["a","e", "i", "o", "u"].contains(c.lowercased()) {
                    numbOfVowels += 1
                }
            }
            
            if (numbOfVowels == 3) {
                
                
                print ("number of vowels is 3")
                numStarsCollected += 1
                numBonusStarsLabel.text = "\(numStarsCollected)"
                output = true
                
            }
            
            else {
                print("number of vowels is not 3")
            }
        }
        
        if (secondBonusAsInt == 1) {
            //double consanant
            
            print ("second bonus starting letter: ", word[word.startIndex])
            
           // if ["a","e", "i", "o", "u"].contains(word[word.startIndex]) {
                
           // }
            
          //  else {
                
           //     print ("The first letter is a consonant")
                
                //    if [word[word.startIndex]].contains(word[word.startIndex, offsetBy: 1]) {
                
                //     print ("xxxx ", word[word.startIndex, offsetBy: 1])
                
                let amnt = 0...word.count-1
                
                for num in amnt {
                    
               //     let newindex = word.index(word.startIndex, offsetBy: 1)
                //    print("DDDDDDDD ", word[newindex])
                    
                    print("word index = ", word.index(word.startIndex, offsetBy: 1))
                 
                    let index = word.index(word.startIndex, offsetBy: num)
                    print( word[index])
                    
                    let newIndex1 = word.index(word.startIndex, offsetBy: num)
                    let firstChar = word[newIndex1]
                    
                    if (num+1 < word.count) {
                        
                        let newIndex2 = word.index(word.startIndex, offsetBy: num+1)
                        let secondChar = word[newIndex2]
                        
                        print("num = ", num)
                        print("word.count = ", word.count)
                        print("firstChar = ", firstChar)
                        print("secondChar = ", secondChar)
                        
                        if (firstChar == secondChar) {
                            
                            print("Made it here XXX")
                            
                            if (!["a","e", "i", "o", "u"].contains(firstChar)) {
                                
                                print("Word contains a double consonant")
                                numStarsCollected += 1
                                numBonusStarsLabel.text = "\(numStarsCollected)"
                                output = true
                                
                            }
                        }
                        
                    }
                    
                    
                    
                    
                    
              //  }
                
                
                
             /*   let char1 = word[word.startIndex]
                let char2 = word[index]
                
                print ("char1 = ", char1)
                print ("char2 = ", char2)
                
                if ( char1 == char2) {
                    
                    print ("the first two letter are the same")
                    
                }
                
                else {
                    
                    print ("the first two letters are not the same")
                }
              
              */
            }
            
        }
        
        if (secondBonusAsInt == 2) {
            //first and last letter the same
            
            let firstChar = word[word.startIndex]
            let numLetters = word.count - 1
            let secondIndex = word.index(word.startIndex, offsetBy: numLetters)
            let secondChar = word[secondIndex]
            
            print("firstChar = ", firstChar)
            print("secondChar = ", secondChar)
            
            if (firstChar == secondChar) {
                
                print("This word starts and ends with the same letter")
                numStarsCollected += 1
                numBonusStarsLabel.text = "\(numStarsCollected)"
                output = true
            }
        }
        
        if (secondBonusAsInt == 3) {
            //double vowel
            
            let amnt = 0...word.count-1
            
            for num in amnt {
                
                //     let newindex = word.index(word.startIndex, offsetBy: 1)
                //    print("DDDDDDDD ", word[newindex])
                
                print("word index = ", word.index(word.startIndex, offsetBy: 1))
                
                let index = word.index(word.startIndex, offsetBy: num)
                print( word[index])
                
                let newIndex1 = word.index(word.startIndex, offsetBy: num)
                let firstChar = word[newIndex1]
                
                if (num+1 < word.count) {
                    
                    let newIndex2 = word.index(word.startIndex, offsetBy: num+1)
                    let secondChar = word[newIndex2]
                    
                    print("num = ", num)
                    print("word.count = ", word.count)
                    print("firstChar = ", firstChar)
                    print("secondChar = ", secondChar)
                    
                    if (firstChar == secondChar) {
                        
                        print("Made it here XXX")
                        
                        if (["a","e", "i", "o", "u"].contains(firstChar)) {
                            
                            print("Word contains a double vowel")
                            numStarsCollected += 1
                            numBonusStarsLabel.text = "\(numStarsCollected)"
                            output = true
                            
                        }
                    }
                    
                }
                
            }
        }
        
        if (secondBonusAsInt == 4) {
            
            var numConsonants = 0
            
            print("SECONDBONUS IS NOw number 4, 4 consonants")
            
            let amnt = 0...word.count-1
            
            for num in amnt {
                
                let index = word.index(word.startIndex, offsetBy: num)
                print( word[index])
                let char = word[index]
                
                if (!["a","e", "i", "o", "u"].contains(char)) {
                    
                    print("This letter is a consonant")
                    
                    numConsonants += 1
                }
            }
            
            if (numConsonants == 4) {
                
                print ("This word contains four consonants")
                numStarsCollected += 1
                numBonusStarsLabel.text = "\(numStarsCollected)"
                output = true
                
            }
            
            if (thirdBonusAsInt == 0) {
                //bonus star for word 5 letters long
                
                if (word.count == 5) {
                    print("this word is five letters and the bonus star word length is too")
                    numStarsCollected += 1
                    numBonusStarsLabel.text = "\(numStarsCollected)"
                    output = true
                    
                }
                
            }
            
            if (thirdBonusAsInt == 1) {
                //bonus star for word 6 letters long
                
                if (word.count == 6) {
                    print("this word is six letters and the bonus star word length is too")
                    numStarsCollected += 1
                    numBonusStarsLabel.text = "\(numStarsCollected)"
                    output = true
                    
                }
                
            }
            
            if (thirdBonusAsInt == 2) {
                //bonus star for word 7 letters long
                
                if (word.count == 7) {
                    print("this word is seven letters and the bonus star word length is too")
                    numStarsCollected += 1
                    numBonusStarsLabel.text = "\(numStarsCollected)"
                    output = true
                    
                }
                
            }
            
            
            
        }
        
    return output
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches ended!")
        
        func isNotUsedBefore(word: String) -> Bool {
            
            for usedWord in self.arrayOfUsedWords {
                if (usedWord == word) {
                    return false
                }
            }
        
            return true
        }
        
        let wrongWordActionLeft = SKAction.move(to: CGPoint(x: -20, y: 0),
                                         duration: TimeInterval(0.05))
        let wrongWordActionRight = SKAction.move(to: CGPoint(x: 20, y: 0),
                                         duration: TimeInterval(0.05))
        let wrongWordActionMiddle = SKAction.move(to: CGPoint(x: 0, y: 0), duration: TimeInterval(0.05))
        
        let wrongWordSequence = SKAction.sequence([wrongWordActionLeft, wrongWordActionRight, wrongWordActionLeft, wrongWordActionRight, wrongWordActionLeft, wrongWordActionRight,  wrongWordActionMiddle])
        
        if (chosenWord.count <= 2) {
            displayedWord.run(wrongWordSequence, completion: {
                
                self.clearOldSelectedLetters()
                self.changeLettersToWhite()
                self.anyLetterSelected = false
                self.displayedWord.text = ""
                self.chosenWord = ""
                self.clearOldLettersInWord()
                
            })
        }
        
        var lowerCaseWord = chosenWord.lowercased()
        
        if (isNotUsedBefore(word: lowerCaseWord)) {
            print("word was used before")
        }
        
        if (chosenWord.count > 2) {
            print("got here")
            print("chosenWord = ", chosenWord)
            print("chosenWord is true or false: ", isReal(word: chosenWord))
            
           
            
            
            if (isReal(word: lowerCaseWord) && isNotUsedBefore(word: lowerCaseWord)) {
                
                print("made it over here")
                print("chosenWorddd = ", lowerCaseWord)
                print("chosenWord is true or falseee: ", isReal(word: lowerCaseWord))
                
                var tempString = ""
                
                var temp = chosenWord.count
                var temp2 = ("\(temp)")
                
                tempString.append(temp2)
                tempString.append(" letter word!")
                
                print("tempString = ", tempString)
                
                correctWordString.text = tempString
                correctWordString.fontSize = 50
                correctWordString.fontColor = SKColor.black
                correctWordString.position = CGPoint(x: 0, y: 200)
                
                let scaleUpAction = SKAction.scale(to: 1.5, duration: 0.3)
                let scaleDownAction = SKAction.scale(to: 1, duration: 0.3)
                let actionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, scaleUpAction])
               // let bonusActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, scaleUpAction, scaleDownAction])
            
                      
                correctWordString.run(actionSequence, completion: {
                    
                    var tmpstrng = ""
                    
                    let score = self.calculateScore()
                    self.scoreAsInt = self.scoreAsInt + score
                    let tmp = ("\(score)")
                    
                    tmpstrng.append(tmp)
                    tmpstrng.append(" points!")
                    
                    self.correctWordString.text = tmpstrng
                    
                    self.correctWordString.run(actionSequence, completion: {
                        
                       // self.checkForBonusStars(word: "apple")
                       // self.checkForBonusStars(word: "looker")
                        
                        if (self.checkForBonusStars(word: lowerCaseWord)) {
                            
                            print("Made it here, check for bonus stars is true")
                            
                            self.correctWordString.text = "You got a bonus Star!"
                            self.correctWordString.fontSize = 30
                            self.correctWordString.fontColor = SKColor.black
                            self.correctWordString.position = CGPoint(x: 0, y: 200)
                            
                            self.correctWordString.run(actionSequence, completion: {
                                self.correctWordString.text = ""
                                self.currentScore.text = "\(self.scoreAsInt)"
                                self.clearOldSelectedLetters()
                                self.changeLettersToWhite()
                                self.anyLetterSelected = false
                                self.displayedWord.text = ""
                                self.chosenWord = ""
                                self.arrayOfUsedWords.append(lowerCaseWord)
                                self.clearOldLettersInWord()
                                
                            })
                        }
                        
                        else {
                            
                            self.correctWordString.text = ""
                            self.currentScore.text = "\(self.scoreAsInt)"
                            self.clearOldSelectedLetters()
                            self.changeLettersToWhite()
                            self.anyLetterSelected = false
                            self.displayedWord.text = ""
                            self.chosenWord = ""
                            self.arrayOfUsedWords.append(lowerCaseWord)
                            self.clearOldLettersInWord()
                            
                            print("arrayofUsedWords = ", self.arrayOfUsedWords)
                            
                        }
                    })
                })
                
      //          addChild(correctWordString)
             
            }
            
            else {
                
              
                
                displayedWord.run(wrongWordSequence, completion: {
                    
                    self.clearOldSelectedLetters()
                    self.changeLettersToWhite()
                    self.anyLetterSelected = false
                    self.displayedWord.text = ""
                    self.chosenWord = ""
                    self.clearOldLettersInWord()
                    
                })
                
           
                
                
            }
        }
    }
    
}
