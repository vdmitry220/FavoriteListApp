
import Foundation
import Swinject
import SwinjectAutoregistration

class ServiceAssembly {}

// MARK: - Assembly

extension ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        assemblyDataService(container: container)
        assemblyUserDefaultsService(container: container)
    }
}

// MARK: - PrivateAssembly

private extension ServiceAssembly {
    
    func assemblyDataService(container: Container) {
        container.autoregister(DataService.self, initializer: DataServiceImp.init).inObjectScope(.container)
    }
    
    func assemblyUserDefaultsService(container: Container) {
        container.autoregister(UserDefaultsService.self, initializer: UserDefaultsServiceImp.init).inObjectScope(.container)
    }
}
