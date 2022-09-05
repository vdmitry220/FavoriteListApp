
import Foundation
import Rswift

protocol NewMoviePresenter {
    
    func getDescription(title: String, year: String)
}

final class NewMoviePresenterImp {
    
    private weak var view: NewMovieView?
    private weak var coordinator: Coordinator?
    private weak var dataService: DataService?

    
    init(
        view: NewMovieView,
        coordinator: Coordinator,
        dataService: DataService) {
            
        self.view = view
        self.coordinator = coordinator
        self.dataService = dataService
    }
}

// MARK: - NewFilmPresenter

extension NewMoviePresenterImp: NewMoviePresenter {
    
    func getDescription(title: String, year: String) {
        let movieYear = Int(year) ?? 0
        self.dataService?.addDescription(title: title, year: movieYear)
        closeView()
    }
    
    func closeView() {
        self.coordinator?.navigate(.pop)
    }
}
