import Foundation
import SwiftUI

struct MainScene: View {
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
                    
                    Button(action: {} ) {
                        NavigationLink(destination: AboutScene()){
                            Image ("about_button")
                        }
                    }
                    
                    Spacer()
                    Image ("hands")
                        .offset()
                        .padding(.bottom, 12)
                }
            }
        } .navigationBarHidden(true)
    }

}
