import Foundation
import Swinject
import SwinjectAutoregistration

class FlowAssembly {
    
}

// MARK: - FlowAssembly

extension FlowAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(AppCoordinator.self) { (resolver) in
            AppCoordinator(resolver: resolver)
        }.inObjectScope(.container)
        
        container.register(FavoriteCoordinator.self) { (resolver) in
            FavoriteCoordinator(resolver: resolver)
        }.inObjectScope(.container)
    }
}
