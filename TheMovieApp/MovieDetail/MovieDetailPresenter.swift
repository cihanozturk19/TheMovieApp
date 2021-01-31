//
//  MoviewDetailPresenter.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 29.01.2021.
//  Copyright (c) 2021 CİHAN ÖZTÜRK. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MovieDetailPresentationLogic {
    func presentDetail(response: MovieDetail.Response)
}

final class MovieDetailPresenter: MovieDetailPresentationLogic {
    weak var viewController: MovieDetailDisplayLogic?
        
    func presentDetail(response: MovieDetail.Response) {
        let viewModel = MovieDetail.ViewModel(backDropPath: response.backdrop_path,
                                              title: response.title,
                                              overView: response.overview)
        viewController?.displayDetail(viewModel: viewModel)
    }
}
