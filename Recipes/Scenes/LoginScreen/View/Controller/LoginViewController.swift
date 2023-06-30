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
    
    private func moveToHome() {
        let repositery: HomeRepsiteryProtocol = HomeRepositery()
        let vc = HomeViewController(viewModel: HomeViewModel(homeRepositery: repositery))
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        present(nc, animated: true)
    }

    
    @IBAction func didTapLoginButton(_ sender: Any) {
        viewModel.userLogin(email: emailTextField.text!, pass: passTextField.text!) { [weak self]  result in
            guard let self = self else {return}
            switch result {
            case .success(let success):
                print(success)
                ToastManager.shared.showToast(success)
                moveToHome()
                UserDefaults.standard.set(true, forKey: "#Sucess_Login")
            case .failure(_):
                ToastManager.shared.showToast("Email Or Pass are Incorrect")
            }
        }
    }
    
}
