
import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration

class FavoriteCoordinator {
    
    private let resolver: Resolver
    
    let navigationController = UINavigationController()
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
}

// MARK: - Start

extension FavoriteCoordinator: Coordinator {
    
    var root: UIViewController {
        navigationController
    }
    
    func start() {
        let viewController = resolver ~> ViewController.self
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func navigate(_ rout: Rout) {
        switch rout {
        case .push:
            openView()
        case .pop:
            return
        default:
            return
        }
    }
}

//MARK: - OpenCloseViews

private extension FavoriteCoordinator {
    
    func openView() {
        let newFilmViewController = resolver ~> NewFilmViewController.self
        self.navigationController.pushViewController(newFilmViewController, animated: true)
    }
}
