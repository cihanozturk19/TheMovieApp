//
//  MovieListView.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 31.01.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

class MovieListView: BaseView {
    
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieFavorite: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    
    var viewModel: MovieListViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            initView(viewModel: viewModel)
        }
    }
    
    func initView(viewModel: MovieListViewModel) {
        self.movieImage.loadImageWithURL(imageURL: viewModel.imageURL ?? "" , placeHolderImageName: nil) { (status, image) in
            if let img = image, status {
                DispatchQueue.main.async {
                    self.movieImage.image = img
                }
            }
        }
        self.movieFavorite.isHidden = viewModel.isHiddenFavIcon 
        self.movieTitle.text = viewModel.title
    }
}

extension UIImageView {
        
    func loadImageWithURL(imageURL: String, placeHolderImageName: String?, completion: ((Bool, UIImage?) -> Void)? = nil) {
        
        if let placeHolder = placeHolderImageName {
            self.image = UIImage(named: placeHolder)
        }
        
        guard let url = URL(string: imageURL) else {
            completion?(false,nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil, let imageData = data, let image = UIImage(data: imageData) {
                completion?(true, image)
            } else {
                completion?(false, nil)
            }
        }
        task.resume()
    }
}
