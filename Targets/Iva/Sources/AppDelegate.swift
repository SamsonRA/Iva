import UIKit
import IvaKit
import IvaUI
import Foundation

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let themeManager = ThemeManager.shared

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {

        IvaKit.hello()
        IvaUI.hello()

        
        themeManager.themes = [
            .light: ThemeStorage.light,
            .dark: ThemeStorage.dark
        ]
        
        return true
    }

}
