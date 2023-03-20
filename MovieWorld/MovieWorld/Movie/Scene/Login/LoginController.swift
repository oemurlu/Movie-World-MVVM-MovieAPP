//
//  LoginController.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 16.03.2023.
//

import UIKit

class LoginController: UIViewController {
    
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signInButtonPressed(_ sender: UIButton) {
        viewModel.checkUserAuth(email: emailTextField.text!, password: passwordTextField.text!) {
            guard let tabbar = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else { return }
//            self.show(tabbar, sender: nil)
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
