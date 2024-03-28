//
//  AssemblyFactoryImpl.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

final class AssemblyFactoryImpl {

    static let shared = AssemblyFactoryImpl()

    // MARK: - Private properties

    private let _openerModuleAssembly = OpenerModuleAssembly()
    
    // MARK: - Init

    private init() { }
}

extension AssemblyFactoryImpl: AssemblyFactory {
    func openerModuleAssembly() -> OpenerModuleAssembly {
        return _openerModuleAssembly
    }
}
