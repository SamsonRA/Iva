import SwiftUI

//MARK: Dark Theme

struct DarkTheme: Theme {
    let colors: Colors = DarkColors()
}


struct DarkColors: Colors {
    let background: BackgroundColors = DarkBackgroundColors()
    let label: LabelColors = DarkLabelColors()
}


struct DarkBackgroundColors: BackgroundColors {
    let primary: Color = .blue
    let secondary: Color = .blue.opacity(0.5)
}


struct DarkLabelColors: LabelColors {
    var primary: Color = .green
    var secondary: Color = .green.opacity(0.5)
    
    
}
