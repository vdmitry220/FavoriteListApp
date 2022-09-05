
import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration
import Rswift

class NewMovieAssembly {}

// MARK: - FavoriteFilmsAssembly

extension NewMovieAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NewMovieViewController.self) { resolver in
            let view = R.storyboard.newFilm.instantiateInitialViewController()!
            
            let presenter = resolver.resolve(NewMoviePresenter.self, argument: view)!
            view.inject(presenter: presenter)
            
            return view
        }
        
        container.register(NewMoviePresenter.self) { (resolver, view: NewMovieViewController) in
            let coordinator = resolver.resolve(FavoriteCoordinator.self)!
            let dataService = resolver.resolve(DataService.self)!
            
            return NewMoviePresenterImp(
                view: view,
                coordinator: coordinator,
                dataService: dataService)
        }
    }
}
