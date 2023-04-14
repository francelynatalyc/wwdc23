import Foundation
import SpriteKit


enum crystalType {
    case aventurina, citrino, cornalina, sodalite
}

class CrystalNode: SKNode {
    var crystalImage : SKSpriteNode
    
    var initialPosition: CGPoint = .zero
    
    public var targetPosition: CGPoint
    
    init(crystalType: crystalType, targetPosition: CGPoint) {
        
        switch crystalType {
        case .aventurina :
            self.crystalImage = .init(imageNamed: "aventurina")

        case .citrino :
            self.crystalImage = .init(imageNamed: "citrino")

        case.cornalina :
            self.crystalImage = .init(imageNamed: "cornalina")

        case .sodalite :
            self.crystalImage = .init(imageNamed: "sodalite")

            
        }
        
        self.targetPosition = targetPosition
        
        super.init()
        addChild(crystalImage)
        isUserInteractionEnabled = true
        initialPosition = self.position 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let scene = self.scene, let location = touches.first?.location(in: scene) {
            self.position = location
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.run(.scale(to: 1.2, duration: 0.1))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.run(.scale(to: 1, duration: 0.1))
        checkPlace()
    }
    
    private func checkPlace() {
        
        let radius:CGFloat = 50
        
        if (self.position.x < (targetPosition.x + radius) &&
            self.position.x > (targetPosition.x - radius) &&
            self.position.y < (targetPosition.y + radius) &&
            self.position.y > (targetPosition.y - radius)) {
                        
            self.position = targetPosition
            
        } else {
            self.run(.move(to: initialPosition, duration: 1))
        }
    }
}
