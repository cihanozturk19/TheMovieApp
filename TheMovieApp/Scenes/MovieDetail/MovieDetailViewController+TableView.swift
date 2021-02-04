//
//  MovieDetailViewController+TableView.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 1.02.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

extension MovieDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 1 {
            return UITableView.automaticDimension
        }
        return 220
    }
}

extension MovieDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell: MovieDetailImageViewCell = tableView.deque(indexPath: indexPath)
            cell.viewModel = viewModel
            return cell
        } else if indexPath.row == 1 {
            let cell: MovieDetailViewCell = tableView.deque(indexPath: indexPath)
            cell.viewModel = viewModel
            return cell
        }
        return UITableViewCell()
    }
    
    
}
