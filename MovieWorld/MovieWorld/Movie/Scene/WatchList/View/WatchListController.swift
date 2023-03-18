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
                print("movie:::: \(movie?.id)")
            }
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
}
