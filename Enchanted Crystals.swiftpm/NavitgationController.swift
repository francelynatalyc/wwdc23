import Foundation
import SwiftUI

struct NavigationController: View {
    var body: some View {
        NavigationView {
            MainScene()
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
    }
}
