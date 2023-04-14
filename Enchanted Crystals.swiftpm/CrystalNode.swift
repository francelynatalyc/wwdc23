import Foundation
import SpriteKit


enum crystalType {
    case aventurina, citrino, cornalina, sodalite
}

class CrystalNode: SKNode {
    var crystalImage : SKSpriteNode
    
    
    init(crystalType: crystalType) {
        
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
        
        
        super.init()
        addChild(crystalImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
