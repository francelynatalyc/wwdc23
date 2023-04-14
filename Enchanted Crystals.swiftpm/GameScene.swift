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
        
        //config sodalite
        sodalite.name = "draggable"
        addChild(sodalite)
        
        
    }
    
    lazy var aventurina: SKNode = {
        let crystal = CrystalNode(crystalType: .aventurina)
        crystal.position = CGPoint(x: -335, y: 36)
        
        return crystal
    }()
    
    lazy var citrino: SKNode = {
        let crystal = CrystalNode(crystalType: .citrino)
        crystal.position = CGPoint(x: -341, y: 185)
        
        return crystal
    }()
    
    lazy var cornalina: SKNode = {
        let crystal = CrystalNode(crystalType: .cornalina)
        crystal.position = CGPoint(x: -341, y: -111)
        
        return crystal
    }()
    
    lazy var sodalite: SKNode = {
        let crystal = CrystalNode(crystalType: .sodalite)
        crystal.position = CGPoint(x: -337, y: -258)
        
        return crystal
    }()
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = self.currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
            print(touchLocation)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if node.name == "draggable" {
                    self.currentNode = node
                }
            }
        }
    }
}

