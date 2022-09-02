import UIKit
import Foundation

protocol Coordinator: AnyObject {
    
    var root: UIViewController { get }
    
    func start()
    
    func navigate(_ rout: Rout)
}
