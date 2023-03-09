//
//  FilterController.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 9.03.2023.
//

import UIKit
import PanModal

class FilterController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = FilterViewModel()
    
    var selectionCallback: ((MovieCategory) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableView()
    }
    
    func registerTableView() {
        tableView.register(UINib(nibName: "\(FilterTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(FilterTableViewCell.self)")
    }
}

extension FilterController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FilterTableViewCell.self)", for: indexPath) as! FilterTableViewCell
        cell.configure(title: viewModel.items[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            self.selectionCallback?(self.viewModel.items[indexPath.row].type)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension FilterController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(240)
    }
}
