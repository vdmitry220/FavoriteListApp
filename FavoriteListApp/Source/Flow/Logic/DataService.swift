
import Foundation

protocol DataService: AnyObject {
    
    func addDescription(title: String, year: Int)
    
    var movieDescription: [Movie]? { get }
}

class DataServiceImp {
    
    var movieDescription: [Movie]?
    
}

// MARK: - DataService

extension DataServiceImp: DataService {
    
    func addDescription(title: String, year: Int) {
        let description = Movie(
            title: title,
            year: year)
        movieDescription?.append(description)
    }
}
