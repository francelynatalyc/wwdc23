import Foundation
import SwiftUI

struct AboutScene: View {
    
    var body: some View {
        
        ZStack (alignment: .center) {
            
            Image ("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack (spacing: 24){
                
                HStack (alignment: .center) {
                    
                    Image ("sparkle_left")
                    
                    Text ("About")
                        .foregroundColor(Color("salmon"))
                        .font(getFont(size: 64)).bold()
                    
                    Image ("sparkle_right")

                    
                }
                    .padding(.top, 32)
                
                                
                Text ("Hello, I'm Francely (or just Fran), I'm 23 years old and I'm also an UX/UI Designer based in Manaus, Amazonas. Currently at the second year of Apple Developer Academy - Manaus.")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                
                Text ("Since I was a teenager I have always been very passionate about nature and all the magical and mysterious things it can provide us. It all started with a small book about the power of crystals and since then this passion has grown and today I love to talk and try to teach a little about the benefits that the use of crystals in Reiki can bring along with the treatments and needs that we may have during our small and incredible earthly life..")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                
                Text ("It couldn't be any different here, I dedicate myself to these playgrounds to put a little bit of everything I love: crystals, magic, doodles and purple.")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                
                Text ("All illustrations were made using the Figma tool and the frameworks used was SwiftUI and SpriteKit. I hope this small part of my passion can provide you with a very welcoming experience and I hope you enjoy it. Thanks!")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                
                Text ("Always looking to know the unknown!")
                    .foregroundColor(Color("salmon"))
                    .font(getFont(size: 28)).bold()

                
                Spacer()
                
                
                Button(action: {} ) {
                    NavigationLink(destination: MainScene()){
                        Image ("about_button")
                    }
                }
                
                Spacer()
                
            }   .padding(.leading, 56)
                .padding(.trailing, 56)
                .frame(width: 961, height: 1302)
                .background (Image ("box")
                    .resizable()
                    .ignoresSafeArea()
                    )

            
        }   .navigationBarHidden(true)

    }
    
    func getFont(size: CGFloat) -> Font {
        let cfURL = Bundle.main.url( forResource: "Eczar", withExtension:
                                        "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL,CTFontManagerScope.process,nil)
        
        let font = Font.custom("Eczar", size: size)
        return font
    }
}





