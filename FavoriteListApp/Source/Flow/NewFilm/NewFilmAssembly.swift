
import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration
import Rswift

class NewFilmAssembly {}

// MARK: - FavoriteFilmsAssembly

extension NewFilmAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NewFilmViewController.self) { resolver in
            let view = R.storyboard.newFilm.instantiateInitialViewController()!
            
            let presenter = resolver.resolve(NewFilmPresenter.self, argument: view)!
            view.inject(presenter: presenter)
            
            return view
        }
        
        container.register(NewFilmPresenter.self) { (resolver, view: NewFilmViewController) in
            let coordinator = resolver.resolve(NewFilmCoordinator.self)!
            let dataService = resolver.resolve(DataService.self)!
            
            return NewFilmPresenterImp(
                view: view,
                coordinator: coordinator,
                dataService: dataService)
        }
    }
}
