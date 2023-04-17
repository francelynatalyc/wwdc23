import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    
    var crystalData: CrystalData?
    
    let background = SKSpriteNode(imageNamed: "game")
    private var currentNode : SKNode?
    
    
    override func didMove(to view: SKView) {
        
        
        background.size = .init(width: 954, height: 1000)
        backgroundColor = UIColor(Color("purple"))
        addChild(background)
        
        aventurina.name = "draggable"
        addChild(aventurina)
        
        citrino.name = "draggable"
        addChild(citrino)
        
        cornalina.name = "draggable"
        addChild(cornalina)
        
        sodalite.name = "draggable"
        addChild(sodalite)
        
    }
    
    lazy var aventurina: CrystalNode = {
        let crystal = CrystalNode(crystalType: .aventurina,
                                  targetPosition: .init(x: 118, y: -47), crystalData: crystalData!)
        crystal.position = CGPoint(x: -336, y: 23)
        crystal.initialPosition = crystal.position
        
        return crystal
    }()
    
    lazy var citrino: CrystalNode = {
        let crystal = CrystalNode(crystalType: .citrino,
                                  targetPosition: .init(x: 120, y: -222), crystalData: crystalData!)
        crystal.position = CGPoint(x: -336, y: 166)
        crystal.initialPosition = crystal.position
        
        return crystal
    }()
    
    lazy var cornalina: CrystalNode = {
        let crystal = CrystalNode(crystalType: .cornalina,
                                  targetPosition: .init(x: 117, y: -382), crystalData: crystalData!)
        crystal.position = CGPoint(x: -336, y: -128)
        crystal.initialPosition = crystal.position
        
        return crystal
    }()
    
    lazy var sodalite: CrystalNode = {
        let crystal = CrystalNode(crystalType: .sodalite,
                                  targetPosition: .init(x: 112, y: 157), crystalData: crystalData!)
        crystal.position = CGPoint(x: -336, y: -272)
        crystal.initialPosition = crystal.position
        
        return crystal
    }()
}

