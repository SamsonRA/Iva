import SwiftUI

// MARK: Light Theme
struct LightTheme: Theme {
    let colors: Colors = LightColors()
}


struct LightColors: Colors {
    let background: BackgroundColors = LightBackgroundColors()
    let label: LabelColors = LightLabelColors()
}


struct LightBackgroundColors: BackgroundColors {
    let primary: Color = .red
    let secondary: Color = .red.opacity(0.5)
}


struct LightLabelColors: LabelColors {
    var primary: Color = .yellow
    var secondary: Color = .yellow.opacity(0.5)
    
    
}
