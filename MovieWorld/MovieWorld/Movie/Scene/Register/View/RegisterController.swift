//
//  RegisterController.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 16.03.2023.
//

import UIKit
import FirebaseAuth

class RegisterController: UIViewController {

    //MARK: - Properties
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    private let viewModel = RegisterViewModel()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - Interaction handlers
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        viewModel.createUser(email: emailTextField.text!, password: passwordTextField.text!) {
            self.viewModel.registerUserToFirestore(email: self.emailTextField.text!) {
                let vc = self.viewModel.loadLoginVC()
                self.show(vc, sender: nil)
            }
        }
    }
}
