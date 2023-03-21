//
//  WatchListViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 17.03.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import UIKit.UIStoryboard

class WatchListViewModel {
    
    private let db = Firestore.firestore()
    private let currentUserUid = Auth.auth().currentUser?.uid

    var watchListItemIds = [String]()
    var watchListItems = [MovieDetailModel]()
    
    func listener(completion: @escaping ([String]) -> ()) {
        let userRef = db.collection("users").document(currentUserUid  ?? "undefined user")
        userRef.addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("WLVM listener error fetching douments: \(String(describing: error))")
                return
            }
            
            self.watchListItemIds = []
            
            if let data = document.data() {
                for movieId in data.keys {
                    self.watchListItemIds.append(movieId)
                }
                completion(self.watchListItemIds)
            }
        }
    }
    
    func getWatchListFromAPI(movieId: [String], completion: @escaping (MovieDetailModel?) -> ()) {
        self.watchListItems = []
        for id in movieId {
            print("id: \(id)")
            WatchListManager.shared.getWatchListItems(id: id) { movies in
                self.watchListItems.append(movies!)
                completion(movies)
            } onError: { error in
                print("sonuc basarisiz: \(error)")
            }

        }
    }
    
    func deleteItemFromFirestore(movieId: String, completion: @escaping () -> ()) {
        let userRef = db.collection("users").document(currentUserUid ?? "undefined user")
        userRef.updateData([movieId : FieldValue.delete()]) { error in
            if let error = error {
                print("WLVM deleteItemFromFirestore error: \(error)")
            }
            completion()
        }
    }
    
    func signOut(completion: @escaping (Bool) -> ()) {
            do {
                try Auth.auth().signOut()
                completion(true)
            } catch let error {
                completion(false)
                print("WLVM signOut error: \(error)")
            }
        }
    
}
