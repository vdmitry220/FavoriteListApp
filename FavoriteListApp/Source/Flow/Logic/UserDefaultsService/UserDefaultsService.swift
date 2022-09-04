
import Foundation

enum UserDefaultsKey {
    case movies
    
    var stringValue: String {
        switch self {
        case .movies:
            return "movies"
        }
    }
}

protocol UserDefaultsService: AnyObject {
    
    func save<Value: Codable>(_ value: Value, for key: UserDefaultsKey)
    
    func value<Value: Codable>(for key: UserDefaultsKey) -> [Value]
    
    func removeValue(for key: UserDefaultsKey)
}

final class UserDefaultsServiceImp {
    
    private let defaults = UserDefaults.standard
}

// MARK: - UserDefaultsService

extension UserDefaultsServiceImp: UserDefaultsService {
    
    func save<Value: Codable>(_ value: Value, for key: UserDefaultsKey) {
        let data = try! PropertyListEncoder().encode(value)
        defaults.set(data, forKey: key.stringValue)
    }
    
    func value<Value: Codable>(for key: UserDefaultsKey) -> [Value] {
        if let data = defaults.value(forKey: key.stringValue) as? Data {
            let notes = try? PropertyListDecoder().decode([Value].self, from: data)
            return notes ?? []
        }
        return []
    }
    
    func removeValue(for key: UserDefaultsKey) {
        defaults.removeObject(forKey: key.stringValue)
    }
}
