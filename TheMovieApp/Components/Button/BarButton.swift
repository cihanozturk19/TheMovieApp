//
//  BarButton.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 1.02.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import UIKit

class BarButton: UIButton {
    
    var barButtonItem = UIBarButtonItem()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        barButtonItem = UIBarButtonItem(customView: self)
        NSLayoutConstraint.activate([
            barButtonItem.customView!.widthAnchor.constraint(equalToConstant: 24),
            barButtonItem.customView!.heightAnchor.constraint(equalToConstant: 24)
        ])
    }    
}
