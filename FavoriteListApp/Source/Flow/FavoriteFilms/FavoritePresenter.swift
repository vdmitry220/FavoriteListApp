
import Foundation
import Rswift

protocol FavoritePresenter {
    
    var decription: [Movie] { get }
    
    func openView()
    
}

final class FavoritePresenterImp {
    
    private weak var view: FavoriteView?
    private weak var coordinator: Coordinator?
    private weak var dataService: DataService?
    
    var decription: [Movie] {
        self.dataService?.movieDescription ?? []
    }

    
    init(
        view: FavoriteView,
        coordinator: Coordinator,
        dataService: DataService) {
            
        self.view = view
        self.coordinator = coordinator
        self.dataService = dataService
    }
}

extension FavoritePresenterImp: FavoritePresenter {
    
    func openView() {
        self.coordinator?.navigate(.push)
    }
}
