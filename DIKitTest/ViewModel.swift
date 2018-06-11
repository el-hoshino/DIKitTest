//
//  ViewModel.swift
//  DIKitTest
//
//  Created by 史 翔新 on 2018/06/11.
//  Copyright © 2018年 YUMEMI. All rights reserved.
//

import Foundation
import DIKit

protocol ViewModelProtocol: class {
    var dateString: String { get }
}

class ViewModel: ViewModelProtocol, Injectable {
    struct Dependency {
        let model: ModelProtocol
    }
    let model: ModelProtocol
    var dateString: String = ""
    required init(dependency: Dependency) {
        self.model = dependency.model
        model.fetchDate { [unowned self] (date) in
            self.dateString = date.description
        }
    }
}

class MockViewModel: ViewModelProtocol, Injectable {
    struct Dependency {
        let model: ModelProtocol
    }
    let model: ModelProtocol
    var dateString: String = ""
    required init(dependency: Dependency) {
        self.model = dependency.model
        model.fetchDate { [unowned self] (date) in
            self.dateString = date.debugDescription
        }
    }
}
