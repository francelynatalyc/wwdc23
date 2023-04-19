import Foundation
import SwiftUI
import AVKit


struct NavigationController: View {
    
    @State var audioPlayer: AVAudioPlayer!
    
    
    var body: some View {
        NavigationView {
            MainScene()
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        
        .onAppear {
            let sound = Bundle.main.path(forResource: "mainsound", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification), perform: { output in
            self.audioPlayer.play();
        })
        
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification), perform: { output in
            self.audioPlayer.pause();
        })
    }
}

