import Foundation
import SwiftUI


struct AboutScene: View {
    
    var body: some View {
        
        ZStack (alignment: .center) {
            Image ("background")
                .resizable()
                .ignoresSafeArea()
            
            ZStack (alignment: .center) {
                HStack {
                    Button(action: {} ) {
                        NavigationLink(destination: MainScene()){
                            Image ("back_button")
                        }
                    }
                    
                    Spacer()
                    Text ("About")
                        .font(getFont(size: 50))
                    
                    Spacer()
                    
                } .padding(.all, 51)
            }
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




