//
//  UICollectionView+Extension.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 31.01.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}
extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
extension UICollectionView {
    func register<T: ReuseIdentifying> (cell:T.Type) where T: UICollectionViewCell {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func deque<T: ReuseIdentifying> (indexPath: IndexPath) -> T where T: UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
        return cell
    }
}
