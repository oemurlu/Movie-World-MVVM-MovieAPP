//
//  WatchListViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 17.03.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

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
                    //TODO: fetchitem yapilcak. belki watchListItems her yenilendiginde olur veya burda her deger geldiginde olur veya en son tum arrayi sirayla fetch yapariz api'den.
                    //completion() verilebilir tableView.reload data icin
                }
                completion(self.watchListItemIds) //
            }
            
        }
    }
    
    func getWatchListFromAPI(movieId: [String], completion: @escaping (MovieDetailModel?) -> ()) {
        self.watchListItems = []
        for id in movieId {
            print("id: \(id)")
            WatchListManager.shared.getWatchListItems(id: id) { movies in
                print("sonuc basarili: \(movies?.title)")
                self.watchListItems.append(movies!)
                completion(movies)
            } onError: { error in
                print("sonuc basarisiz: \(error)")
            }

        }
    }
    
}
