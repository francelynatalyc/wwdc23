import SwiftUI

struct MainScene: View {
    var body: some View {
        
        NavigationView {
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
                        NavigationLink(destination: FirstScene()){
                            Image ("start_button")
                        }
                        
                        NavigationLink(destination: AboutScene()){
                            Image ("about_button")
                        }
                        
                        Spacer()
                        Image ("hands")
                            .offset()
                            .padding(.bottom, 12)
                    }

                }
            }
            
        } .navigationViewStyle(.stack)
    }
}
