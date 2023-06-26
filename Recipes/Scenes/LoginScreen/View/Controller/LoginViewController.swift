//
//  LoginViewController.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    
    //MARK: -> Properties
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func didTapLoginButton(_ sender: Any) {
        viewModel.userLogin(email: emailTextField.text!, pass: passTextField.text!) { [weak self]  result in
            guard let self = self else {return}
            switch result {
            case .success(let success):
                print(success)
                let vc = UIViewController()
                present(vc, animated: true)
            case .failure(_):
                print("Email Or Pass Ar Incorrect")
            }
        }
    }
    
}
