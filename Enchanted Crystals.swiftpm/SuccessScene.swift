import Foundation
import SwiftUI

struct SuccessScene: View {
    
    var body: some View {
        
        ZStack {
            
            Image ("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                HStack (alignment: .center) {
                    Image ("sparkle_left")
                    
                    Text ("You did it!")
                        .foregroundColor(Color("salmon"))
                        .font(getFont(size: 64)).bold()
                    
                    Image ("sparkle_right")
                }
                .padding(.top, 32)
                
                
                Text ("By moving the crystals to the chakra points correctly, you allow those points to draw energy from the crystals and assist with numerous treatments.")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)
                                
                Button(action: {} ) {
                    NavigationLink(destination: AboutScene()){
                        Image ("about_button")
                    }
                }
                
            }   .padding(.leading, 96)
                .padding(.trailing, 96)
                .frame(width: 961, height: 1302)
                .background (Image ("box")
                    .resizable()
                    .ignoresSafeArea()
                    )

        } .navigationBarHidden(true)
        
    }
    
    func getFont(size: CGFloat) -> Font {
        let cfURL = Bundle.main.url( forResource: "Eczar", withExtension:
                                        "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL,CTFontManagerScope.process,nil)
        
        let font = Font.custom("Eczar", size: size)
        return font
    }
}
