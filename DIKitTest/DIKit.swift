//
//  DIKit.swift
//  DIKitTest
//
//  Created by 史 翔新 on 2018/06/11.
//  Copyright © 2018年 YUMEMI. All rights reserved.
//

import Foundation
import DIKit

protocol AppResolverProtocol: Resolver {
    func provideModel() -> ModelProtocol
    func provideViewModel() -> ViewModelProtocol
}

final class AppResolver: AppResolverProtocol {
    
    let model = Model()
    
    private init(){}
    
    static let shared: AppResolver = .init()
    
    func provideModel() -> ModelProtocol {
        return model
    }
    
    func provideViewModel() -> ViewModelProtocol {
        return resolveViewModel()
    }
    
}

final class MockAppResolver: AppResolverProtocol {
    
    let model = MockModel()
    
    private init(){}
    
    static let shared: MockAppResolver = .init()
    
    func provideModel() -> ModelProtocol {
        return model
    }
    
    func provideViewModel() -> ViewModelProtocol {
        return resolveMockViewModel()
    }
    
}
