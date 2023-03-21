//
//  WatchListController.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import UIKit

class WatchListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = WatchListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        viewModel.listener { movieIDs in
            //TODO: call api
            self.viewModel.getWatchListFromAPI(movieId: movieIDs) { movie in
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
        askForSignOut { response in
            if response {
                self.viewModel.signOut { success in
                    if success {
                        self.goToWelcomeVC()
                    } else {
                        print("error while trying to logout")
                    }
                }
            }
        }
    }
    
    func askForSignOut(completion: @escaping(Bool) -> () ) {
        // Create you actionsheet - preferredStyle: .actionSheet
        let actionSheet = UIAlertController(title: "Are you sure you want to log out?", message: nil, preferredStyle: .actionSheet)
        
        // Create your actions - take a look at different style attributes
        let blockAction = UIAlertAction(title: "Log out", style: .destructive) { (action) in
            print("didPress block")
            completion(true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("didPress cancel")
            completion(false)

        }
        
        // Add the actions to your actionSheet
        actionSheet.addAction(blockAction)
        actionSheet.addAction(cancelAction)
        // Present the controller
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func goToWelcomeVC() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? UIViewController else { return }
        //            self.show(tabbar, sender: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true) {
            self.removeFromParent()
        }
        
    }
    
    
    func setupTableView() {
        tableView.register(UINib(nibName: "\(WatchLaterCell.self)", bundle: nil), forCellReuseIdentifier: "\(WatchLaterCell.self)")
    }
}

extension WatchListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.watchListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(WatchLaterCell.self)", for: indexPath) as! WatchLaterCell
        cell.configure(data: viewModel.watchListItems[indexPath.row])
        
        return cell
    }
}

extension WatchListController: UITableViewDelegate {
    //disable cell click behavior
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 166
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteItemFromFirestore(movieId: viewModel.watchListItemIds[indexPath.row]) {
                self.tableView.reloadData()
                print("data reloaded")
            }
        }
    }
}
