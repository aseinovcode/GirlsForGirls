//
//  CollectionView.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 23.02.2023.
//

import Foundation
import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }

    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn`t find UICollectioinViewCell for \(String(describing: name)), make sure the cell is registered with collectionView")

        }
        return cell
    }
}
