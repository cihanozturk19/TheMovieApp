//
//  MovieListViewCell.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 31.01.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

class MovieListViewCell: UICollectionViewCell, ReuseIdentifying {
    
    @IBOutlet private weak var movieListView: MovieListView!
    
    var moviewListViewModel: MovieListViewModel? {
        didSet {
            movieListView!.viewModel = moviewListViewModel
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
//    func fromNib<T: UIView> (view: T.Type) -> T {
//        let bundle = Bundle(for: type(of: view) as! AnyClass)
//        let nibName = type(of: self).description().components(separatedBy: ".").last!
//    }
//    func fromNib() -> UIView {
//        let bundle = Bundle(for: type(of: self))
//        let nibName = type(of: self).description().components(separatedBy: ".").last!
//        let nib = UINib(nibName: nibName, bundle: bundle)
//        return nib.instantiate(withOwner: self, options: nil).first as! UIView
//    }
}
