
import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration
import Rswift

class FavoriteAssembly {}

// MARK: - FavoriteAssembly

extension FavoriteAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ViewController.self) { resolver in
            let view = R.storyboard.main.instantiateInitialViewController()!
            
            let presenter = resolver.resolve(FavoritePresenter.self, argument: view)!
            view.inject(presenter: presenter)
            
            return view
        }
        
        container.register(FavoritePresenter.self) { (resolver, view: ViewController) in
            let coordinator = resolver ~> FavoriteCoordinator.self
            let dataService = resolver.resolve(DataService.self)!
            
            return FavoritePresenterImp(
                view: view,
                coordinator: coordinator,
                dataService: dataService)
        }
    }
}
