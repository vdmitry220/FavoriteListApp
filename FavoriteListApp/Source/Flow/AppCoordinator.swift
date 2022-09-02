
import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration

class AppCoordinator {
    
    private let resolver: Resolver
    let navigationController = UITabBarController()
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
}

// MARK: - Start

extension AppCoordinator: Coordinator {
    
    var root: UIViewController {
        navigationController
    }
    
    func start() {
        let favoriteCoordinator = resolver ~> FavoriteCoordinator.self
        let newFilmCoordinator = resolver ~> NewFilmCoordinator.self
        
        navigationController.setViewControllers([favoriteCoordinator.root, newFilmCoordinator.root], animated: false)
        
        favoriteCoordinator.start()
        newFilmCoordinator.start()
    }
    
    func navigate(_ rout: Rout) {}
    
    
}
    
