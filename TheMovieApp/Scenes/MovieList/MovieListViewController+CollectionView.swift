//
//  MovieListViewController+CollectionView.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 31.01.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

extension MovieListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item: MovieList.PopularMovies.Results = (viewModel?.results![indexPath.row])!
        item.isFavorite = viewModel.favoriteMoviesID.contains(item.id!)
        print("item favor",item.isFavorite)
        interactor?.didSelectItem(item: item)
    }
}

extension MovieListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let results = viewModel?.results else {
            return UICollectionViewCell()
        }
        
        var item: MovieList.PopularMovies.Results = results[indexPath.row]
        item.isFavorite = viewModel.favoriteMoviesID.contains(item.id!)
        let cell: MovieListViewCell = collectionView.deque(indexPath: indexPath)
        cell.moviewListViewModel = MovieListViewModel(imageURL: item.posterPath, title: item.title, isHiddenFavIcon: !item.isFavorite)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        interactor?.loadMore(indexPath: indexPath)
    }
    
}

extension MovieListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
