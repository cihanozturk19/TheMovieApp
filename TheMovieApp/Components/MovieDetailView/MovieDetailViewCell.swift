//
//  MovieDetailViewCell.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 1.02.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailImageViewCell: UITableViewCell, ReuseIdentifying {
    
    @IBOutlet private weak var posterImageView: CustomImageView?
    
    var viewModel:MovieDetail.ViewModel? {
        didSet {
            if let viewModel = viewModel {
                posterImageView?.loadImageWithUrl(viewModel.backDropPath ?? "")
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

class MovieDetailViewCell: UITableViewCell, ReuseIdentifying {
    @IBOutlet private weak var headerLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    @IBOutlet private weak var voteCountLabel: UILabel!
    
    var viewModel:MovieDetail.ViewModel? {
        didSet {
            if let viewModel = viewModel {
                headerLabel?.text = viewModel.title
                descriptionLabel?.text = viewModel.overView
                voteCountLabel.text = viewModel.voteCount
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
