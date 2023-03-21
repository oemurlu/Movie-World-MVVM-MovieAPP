//
//  DetailViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 13.03.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class DetailViewModel {
    //MARK: - Properties
    private let db = Firestore.firestore()
    private let currentUserUid = Auth.auth().currentUser?.uid

    //MARK: - Functions
    func addMovieToWatchList(movieId: Int, completion: @escaping (Bool) -> ()) {
        let userRef = db.collection("users").document(currentUserUid ?? "undefined user")
        
        //watchListte urun yoksa eklenecek; varsa silinecek
        userRef.getDocument { document, error in
            if let document = document, document.exists {
                if let data = document.data(), let _ = data["\(movieId)"] {
                    userRef.updateData(["\(movieId)" : FieldValue.delete()])
                    print("DVM addMovieToWatchList: zaten ekli, cikartildi")
                    completion(false)
                } else {
                    userRef.updateData(["\(movieId)": true])
                    print("DVM addMovieToWatchList: ekli degil, eklendi")
                    completion(true)
                }
            }
        }
    }
    
    func watchLaterButtonDecision(result: Bool, completion: (String) -> ()) {
        if result == true {
            completion("heart.fill")
        } else {
            completion("heart")
        }
    }
    
    func didMovieAddedToWatchLaterList(movieId: Int, completion: @escaping (Bool) -> ()) {
        let userRef = db.collection("users").document(currentUserUid ?? "undefined user")
        userRef.getDocument { document, error in
            if let document = document, document.exists {
                if let data = document.data(), let _ = data["\(movieId)"] {
                    completion(true)
                } else {
                    completion(false)
                }
            } else {
                print("user document does not exist")
                completion(false)
            }
        }
    }
}






