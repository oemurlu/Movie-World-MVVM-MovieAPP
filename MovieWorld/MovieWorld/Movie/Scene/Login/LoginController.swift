//
//  LoginController.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 16.03.2023.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    private let viewModel = LoginViewModel()

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Interaction handlers
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        viewModel.checkUserAuth(email: emailTextField.text!, password: passwordTextField.text!) {
            guard let tabbar = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else { return }
            tabbar.modalPresentationStyle = .fullScreen
            self.present(tabbar, animated: true) {
                self.removeFromParent()
            }
        }
    }
    deinit {
        print("login vc deinited")
    }
}
