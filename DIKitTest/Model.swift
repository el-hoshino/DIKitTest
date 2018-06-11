//
//  Model.swift
//  DIKitTest
//
//  Created by 史 翔新 on 2018/06/11.
//  Copyright © 2018年 YUMEMI. All rights reserved.
//

import Foundation
import DIKit

protocol ModelProtocol: class {
    func fetchDate(completion: ((Date) -> Void)?)
}

class Model: ModelProtocol {
    let date = Date()
    func fetchDate(completion: ((Date) -> Void)?) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) { [unowned self] in
            completion?(self.date)
        }
    }
}

class MockModel: ModelProtocol {
    let date = Date(timeIntervalSince1970: 0)
    func fetchDate(completion: ((Date) -> Void)?) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) { [unowned self] in
            completion?(self.date)
        }
    }
}
