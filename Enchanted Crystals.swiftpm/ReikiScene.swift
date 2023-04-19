import SwiftUI
import SpriteKit


struct ReikiScene: View {
    
    @ObservedObject var crystalData: CrystalData = CrystalData()
    
    
    var scene: SKScene{
        let scene = GameScene()
        scene.crystalData = self.crystalData
        scene.size = CGSize(width: 954, height: 1000)
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        
        if (crystalData.crystalPlaced) {
            SuccessScene()
        }
        
        else {
            
            ZStack {
                
                Image ("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    HStack (alignment: .center) {
                        
                        Image ("sparkle_left")
                        
                        Text ("Placing crystals")
                            .foregroundColor(Color("salmon"))
                            .font(getFont(size: 64)).bold()
                        
                        Image ("sparkle_right")
                        
                    }
                    .padding(.top, 32)
                    
                    
                    Text ("Move the available crystals to the chakras located in the figure on the side to practice reiki therapy.")
                        .font(.system(size: 24, weight: .regular))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    SpriteView(scene: scene)
                        .frame(width: 954,height: 1000)
                        .ignoresSafeArea()
                    
                    Spacer()
                    
                }   .padding(.leading, 56)
                    .padding(.trailing, 56)
                    .frame(width: 961, height: 1302)
                    .background (Image ("box")
                        .resizable()
                        .ignoresSafeArea()
                    )
            } .navigationBarHidden(true)
        }
    }
}

func getFont(size: CGFloat) -> Font {
    let cfURL = Bundle.main.url( forResource: "Eczar", withExtension:
                                    "ttf")! as CFURL
    CTFontManagerRegisterFontsForURL(cfURL,CTFontManagerScope.process,nil)
    
    let font = Font.custom("Eczar", size: size)
    return font
}
