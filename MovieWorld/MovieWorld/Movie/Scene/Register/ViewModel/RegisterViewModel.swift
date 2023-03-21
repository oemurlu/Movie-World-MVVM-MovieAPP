//
//  RegisterViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 16.03.2023.
//

import UIKit.UIStoryboard
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel {
    
    //MARK: - Properties
    private let db = Firestore.firestore()
    private var authUser: FirebaseAuth.User? {
        Auth.auth().currentUser
    }
    private var userUid = ""
    
    //MARK: - Functions
    func loadLoginVC() -> LoginController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
        vc.loadViewIfNeeded()
        return vc
    }
    
    func createUser(email: String, password: String, completion: @escaping () -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("RVM createUser error: \(error)")
            } else {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = email
                changeRequest?.commitChanges(completion: { error in
                    if let error = error {
                        print("RVM changeRequest error: \(error)")
                    }
                })
                self.userUid = (authResult?.user.uid)!
                completion()
            }
        }
    }
    
    func registerUserToFirestore(email: String, completion: @escaping () -> ()) {
        self.db.collection("users").document(userUid).collection("userInfo").document(userUid).setData([
            "email": email,
            "id": userUid
        ]) { error in
            if let error = error {
                print("RVMcreateUser setData error: \(error.localizedDescription)")
            }
        }
        
        //dokumanda bos veri seti baslatmamiz lazim cunku dokumandaki data nil olursa query ve snapshot burayi okuyamiyor. Bos mu diye kontrol edemiyor cunku dokumanin datasini okuyamiyor. Okumasi icin bos data set ediyorum. Aksi takdirde data okunamadigi icin hicbir isler calismiyor.
        self.db.collection("users").document(userUid).setData([:])
            completion()
    }
}
