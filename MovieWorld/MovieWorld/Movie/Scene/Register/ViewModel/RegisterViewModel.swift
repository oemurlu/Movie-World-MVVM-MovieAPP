//
//  RegisterViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 16.03.2023.
//

import Foundation
import UIKit

class RegisterViewModel {
    
    func loadLoginVC() -> LoginController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
        vc.loadViewIfNeeded()
        return vc
    }
    
    
}
