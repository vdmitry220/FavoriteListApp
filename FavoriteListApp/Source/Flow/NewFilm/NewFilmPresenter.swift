
import Foundation
import Rswift

protocol NewFilmPresenter {
    
    func getDescription(title: String, year: String)
}

final class NewFilmPresenterImp {
    
    private weak var view: NewFilmView?
    private weak var coordinator: Coordinator?
    private weak var dataService: DataService?

    
    init(
        view: NewFilmView,
        coordinator: Coordinator,
        dataService: DataService) {
            
        self.view = view
        self.coordinator = coordinator
        self.dataService = dataService
    }
}

// MARK: - NewFilmPresenter

extension NewFilmPresenterImp: NewFilmPresenter {
    
    func getDescription(title: String, year: String) {
        let movieYear = Int(year) ?? 0
        let text = title
        self.dataService?.addDescription(title: title, year: movieYear)
        closeView()
    }
    
    func closeView() {
        self.coordinator?.navigate(.push)
    }
}
