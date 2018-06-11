//
//  Controller.swift
//  DIKitTest
//
//  Created by 史 翔新 on 2018/06/11.
//  Copyright © 2018年 YUMEMI. All rights reserved.
//

import UIKit
import DIKit

class Controller: UIViewController, Injectable {
    
    lazy var label = UILabel()
    
    struct Dependency {
        let viewModel: ViewModelProtocol
    }
    let viewModel: ViewModelProtocol
    
    required init(dependency: Dependency) {
        self.viewModel = dependency.viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.frame = UIScreen.main.bounds
        view.addSubview(label)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.global().async {
            while true {
                DispatchQueue.main.async {
                    self.label.text = self.viewModel.dateString
                }
                print(self.viewModel.dateString)
                Thread.sleep(forTimeInterval: 0.5)
            }
        }
    }
    
}
