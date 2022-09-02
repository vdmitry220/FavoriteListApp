
import Foundation
import Rswift

protocol NewFilmPresenter {
    
}

final class NewFilmPresenterImp {
    
    private weak var view: NewFilmView?
    private weak var coordinator: Coordinator?

    
    init(
        view: NewFilmView,
        coordinator: Coordinator) {
            
        self.view = view
        self.coordinator = coordinator
    }
}

extension NewFilmPresenterImp: NewFilmPresenter {
    
}
