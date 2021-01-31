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
    @IBOutlet private weak var posterImageView: UIImageView?
    
    var viewModel:MovieDetail.ViewModel? {
        didSet {
            if let viewModel = viewModel {
                posterImageView?.loadImageWithURL(imageURL: viewModel.backDropPath ?? "", placeHolderImageName: nil, completion: { (status, img) in
                    DispatchQueue.main.async {
                        self.posterImageView?.image = img
                    }
                })
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
    
    var viewModel:MovieDetail.ViewModel? {
        didSet {
            if let viewModel = viewModel {
                headerLabel?.text = viewModel.title
                descriptionLabel?.text = viewModel.overView
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
