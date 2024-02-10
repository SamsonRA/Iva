import Foundation

/// App Tab's
enum Tab: String, CaseIterable {
    case home = "Меню"
    case services = "Избранное"
    case partners = "Корзина"
    case activity = "Профиль"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .services:
            return "heart"
        case .partners:
            return "cart"
        case .activity:
            return "person"
        }
    }
}
