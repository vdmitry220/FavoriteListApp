
import Foundation
import Rswift

protocol FavoritePresenter {
    
}

final class FavoritePresenterImp {
    
    private weak var view: FavoriteView?
    private weak var coordinator: Coordinator?

    
    init(
        view: FavoriteView,
        coordinator: Coordinator) {
            
        self.view = view
        self.coordinator = coordinator
    }
}

extension FavoritePresenterImp: FavoritePresenter {
    
}
