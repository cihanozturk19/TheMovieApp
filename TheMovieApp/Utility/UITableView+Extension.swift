//
//  UITableView+Extension.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 1.02.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
        
    func deque<T: ReuseIdentifying> (indexPath: IndexPath) -> T where T: UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
        return cell
    }
}

