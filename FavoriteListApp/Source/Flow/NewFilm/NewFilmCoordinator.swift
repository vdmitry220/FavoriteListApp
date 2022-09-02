
import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration

class NewFilmCoordinator {

    private let resolver: Resolver

    let navigationController = UINavigationController()

    init(resolver: Resolver) {
        self.resolver = resolver
    }
}

// MARK: - Start

extension NewFilmCoordinator: Coordinator {

    var root: UIViewController {
        navigationController
    }

    func start() {
        let newFilmViewController = resolver ~> NewFilmViewController.self
        navigationController.setViewControllers([newFilmViewController], animated: false)
    }

    func navigate(_ rout: Rout) {
        switch rout {
        case .push:
            closeView()
        case .pop:
            closeView()
        default:
            return
        }
    }
}

//MARK: - OpenCloseViews

private extension NewFilmCoordinator {

    func closeView() {
        let newFilmViewController = resolver ~> ViewController.self
        self.navigationController.pushViewController(newFilmViewController, animated: true)
    }
}
