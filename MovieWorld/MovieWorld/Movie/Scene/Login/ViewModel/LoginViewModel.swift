//
//  LoginViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 16.03.2023.
//

import UIKit.UIStoryboard
import Firebase

class LoginViewModel {
    //MARK: - Functions
    func checkUserAuth(email: String, password: String, completion: @escaping () -> () ) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("LVM checkUserAuth error: \(error)")
            } else {
                completion()
            }
        }
    }
    
    func loadTabBar() -> UITabBarController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        return vc
    }
}
