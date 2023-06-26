//
//  BaseWireFrame.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import Foundation
import UIKit
import Combine

class BaseWireFrame<T>: UIViewController {
    
    var viewModel: T
    lazy var cancellable: Set<AnyCancellable> = {
       return Set<AnyCancellable>()
    }()
    // any thing
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
