//
//  RegisterController.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 16.03.2023.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        let vc = viewModel.loadLoginVC()
        show(vc, sender: nil)
    }
    
    
}
