import Foundation
import SwiftUI

struct MainScene: View {
    
    @State private var isNavigationActive = false
    
    var body: some View {
        
        ZStack {
            Image ("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack (spacing: 104){
                Spacer()
                Image ("title")
                    .offset()
                
                Spacer()
                VStack (spacing: 24){
                    
                    Button(action: {} ) {
                        NavigationLink(destination: FirstScene()){
                            Image ("start_button")
                        }
                    }
                    
                    Spacer()

                    Image ("hands")
                        .offset()
                        .padding(.bottom, 12)
                }
            }
        }   .navigationBarHidden(true)
            .onAppear(perform: {
                SoundManager.shared.backgroundSound(sound: "mainsound", type: "mp3", vol: 0.5)
                        })
    }

}
