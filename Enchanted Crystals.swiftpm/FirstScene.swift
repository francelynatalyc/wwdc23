import Foundation
import SwiftUI

struct FirstScene: View {

    var body: some View {

        ZStack (alignment: .center) {

            Image ("background")
                .resizable()
                .ignoresSafeArea()

            VStack (spacing: 24){

                HStack (alignment: .center) {

                    Image ("sparkle_left")

                    Text ("Reiki Crystals")
                        .foregroundColor(Color("salmon"))
                        .font(getFont(size: 64)).bold()

                    Image ("sparkle_right")

                }
                .padding(.top, 32)


                Text ("Reiki is channeling energy from one environment to another to achieve balance. Crystals have the power to balance, unlock and release our body's energies. And help in improving the basic therapy. Crystals, if properly programmed, can amplify and distribute energy perfecting the work. As a result, your energy flow will follow its natural path, contributing to a feeling of well-being and fullness.")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Image ("crystal")

                Spacer()

                Text ("The combination of the crystals and the therapist's energy helps balance and realign the chakras placing an arrangement with crystal in each chakra, promoting a sense of deep relaxation, mental clarity and overall well-being.")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Image ("chakras")

                Button(action: {} ) {
                    NavigationLink(destination: ReikiScene()){
                        Image ("try_reiki_button")
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





