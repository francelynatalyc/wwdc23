import Foundation
import AVKit

public class SoundManager{
    
    static let shared = SoundManager()
    var player: AVAudioPlayer?
    var background: AVAudioPlayer?
    
    func playSound(sound: String, type: String, vol: Float) {
        guard let path = Bundle.main.path (forResource: sound, ofType: type) else {
            print ("Resource not found: \(sound)")
            return
            
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player?.play()
            player?.volume = vol
        } catch {
            print ( "ERROR")
        }
    }
    
    func backgroundSound (sound: String, type: String, vol: Float) {
        guard let path = Bundle.main.path(forResource: sound, ofType: type) else {
            print ("Resource not found: \(sound)")
            return
        }
        do {
            background = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            background?.numberOfLoops = -1
            background? .play ()
            player?.volume = vol
            
        } catch {
            print ("ERROR")
        }
    }
    
    func stop() {
        player?.stop()
    }
    
    init() {
        NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: nil) {
            [weak self] _ in
            self?.stop()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
