import Foundation
import SpriteKit
import SwiftUI

enum crystalType {
    case aventurina, citrino, cornalina, sodalite
}

var crystalPlaced : Int = 0

class CrystalNode: SKNode {
    
    @ObservedObject var crystalData: CrystalData
    
    var crystalImage : SKSpriteNode
    var crystalModal: SKSpriteNode?
    var isActive: Bool = false
    var crystalModalTexture: SKTexture
    
    var initialPosition: CGPoint = .zero
    public var targetPosition: CGPoint
    
    init(crystalType: crystalType, targetPosition: CGPoint, crystalData: CrystalData) {
        
        self.crystalData = crystalData
        
        switch crystalType {
        case .aventurina :
            self.crystalImage = .init(imageNamed: "aventurina")
            self.crystalModalTexture = SKTexture(imageNamed: "modal_aventurina")
            
        case .citrino :
            self.crystalImage = .init(imageNamed: "citrino")
            self.crystalModalTexture = SKTexture(imageNamed: "modal_citrino")
            
            
        case.cornalina :
            self.crystalImage = .init(imageNamed: "cornalina")
            self.crystalModalTexture = SKTexture(imageNamed: "modal_cornalina")
            
            
        case .sodalite :
            self.crystalImage = .init(imageNamed: "sodalite")
            self.crystalModalTexture = SKTexture(imageNamed: "modal_sodalite")
            
            
        }
        
        self.targetPosition = targetPosition
        
        super.init()
        addChild(crystalImage)
        isUserInteractionEnabled = true
        initialPosition = self.position
        
        crystalModal = SKSpriteNode(texture: crystalModalTexture, color: .clear, size: crystalModalTexture.size())
        crystalModal?.position = CGPoint(x: 300, y: 0)
        crystalModal?.isHidden = true
        self.addChild(crystalModal!)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let scene = self.scene, let location = touches.first?.location(in: scene) {
            self.position = location
        }
        crystalModal?.isHidden = true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.run(.scale(to: 1.2, duration: 0.1))
        
        SoundManager.shared.playSound(sound: "takingsound", type: "mp3", vol: 1)
        
        
        if (crystalModal?.isHidden)! {
            if let current = parent?.children.first(where: { ($0 as? CrystalNode)?.crystalModal?.isHidden == false }) {
                (current as? CrystalNode)?.crystalModal?.isHidden = true
            }
            crystalModal?.isHidden = false
            
        } else {
            crystalModal?.isHidden = true
        }
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
            
            SoundManager.shared.playSound(sound: "placesound", type: "mp3", vol: 1)

            self.isUserInteractionEnabled = false
            
            crystalPlaced = crystalPlaced + 1
            
            if crystalPlaced == 4 {
                crystalData.crystalPlaced = true
            }
            
            
        } else {
            self.run(.move(to: initialPosition, duration: 0.3))
            SoundManager.shared.playSound(sound: "errorsound", type: "mp3", vol: 1)

            
        }
    }
}
