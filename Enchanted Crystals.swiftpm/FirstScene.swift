import Foundation
import SwiftUI

struct FirstScene: View {
    
    var body: some View {
        ZStack {
            
            Image ("background")
                .resizable()
                .ignoresSafeArea()
            
            HStack (alignment: .center) {
                Button(action: {} ) {
                    NavigationLink(destination: MainScene()){
                        Image ("back_button")
                    }
                }
                Spacer ()
                
                Text ("Reiki Crystals")
                    .foregroundColor(Color("salmon"))
                    .font(getFont(size: 64))
                
                Spacer ()
                
            }   .padding(.leading, 56)
                .padding(.trailing, 56)
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
