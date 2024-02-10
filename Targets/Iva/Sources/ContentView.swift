import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {

        Home()
            .preferredColorScheme(.light)
    }
}
