import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "game")
    private var currentNode : SKNode?
    
    
    override func didMove(to view: SKView) {
        
        
        //background
        background.size = .init(width: 954, height: 1000)
        backgroundColor = UIColor(Color("purple"))
        addChild(background)
        
        //aventurina
        aventurina.name = "draggable"
        addChild(aventurina)
        
        //citrino
        citrino.name = "draggable"
        addChild(citrino)
        
        //cornalina
        cornalina.name = "draggable"
        addChild(cornalina)
        
        //sodalite
        sodalite.name = "draggable"
        addChild(sodalite)
        
        
    }
    
    lazy var aventurina: CrystalNode = {
        let crystal = CrystalNode(crystalType: .aventurina,
                                  targetPosition: .init(x: 118, y: -47))
        crystal.position = CGPoint(x: -336, y: 23)
        crystal.initialPosition = crystal.position
        
        return crystal
    }()
    
    lazy var citrino: CrystalNode = {
        let crystal = CrystalNode(crystalType: .citrino,
                                  targetPosition: .init(x: 120, y: -222))
        crystal.position = CGPoint(x: -336, y: 166)
        crystal.initialPosition = crystal.position
        
        return crystal
    }()
    
    lazy var cornalina: CrystalNode = {
        let crystal = CrystalNode(crystalType: .cornalina,
                                  targetPosition: .init(x: 117, y: -382))
        crystal.position = CGPoint(x: -336, y: -128)
        crystal.initialPosition = crystal.position
        
        return crystal
    }()
    
    lazy var sodalite: CrystalNode = {
        let crystal = CrystalNode(crystalType: .sodalite,
                                  targetPosition: .init(x: 112, y: 157))
        crystal.position = CGPoint(x: -336, y: -272)
        crystal.initialPosition = crystal.position
        
        return crystal
    }()
}

