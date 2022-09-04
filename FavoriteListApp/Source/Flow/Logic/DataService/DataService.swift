
import Foundation

protocol DataService: AnyObject {
    
    func addDescription(title: String, year: Int)
    
    var movieDescription: [Movie] { get set }
}

class DataServiceImp {
    
    private let userDefaults: UserDefaultsService
        
    init(userDefaults: UserDefaultsService) {
        self.userDefaults = userDefaults
    }
}

// MARK: - DataService

extension DataServiceImp: DataService {
    
    func addDescription(title: String, year: Int) {
        let movieYear = Int(year)
        let description = Movie(title: title, year: movieYear)
        
        movieDescription.append(description)
        print(movieDescription)
    }
}

// MARK: - UserDefaults

extension DataServiceImp {
    
    var movieDescription: [Movie] {
        
        get {
            userDefaults.value(for: .movies)
        }
        set {
            userDefaults.save(newValue, for: .movies)
        }
    }
}
