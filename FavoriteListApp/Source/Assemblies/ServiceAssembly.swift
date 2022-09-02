
import Foundation
import Swinject
import SwinjectAutoregistration

class ServiceAssembly {}

// MARK: - Assembly

extension ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        assemblyDataService(container: container)
    }
}

// MARK: - PrivateAssembly

private extension ServiceAssembly {
    
    func assemblyDataService(container: Container) {
        container.autoregister(DataService.self, initializer: DataServiceImp.init).inObjectScope(.container)
    }
}
