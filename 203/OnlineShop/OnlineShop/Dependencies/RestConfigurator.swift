//
//  Configurator.swift
//  OnlineShop
//
//  Created by Teacher on 18.02.2023.
//

import Foundation

class RestConfigurator {
    func configure() -> ServiceLocator {
        let serviceLocator = ServiceLocator()
        let authorizationService = MockAuthorizationService()
        let catalogService = MockCatalogService()
        serviceLocator.register { () -> AuthorizationService in
            authorizationService
        }
        
        serviceLocator.register { () -> CatalogService in catalogService}
        return serviceLocator
    }
}
