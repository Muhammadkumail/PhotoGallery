//
//  CollectionView.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func setupCollectionView(indetifier: String, direction: UICollectionView.ScrollDirection = .vertical, layoutType: LayoutType = .more, layout: UGridFlowLayout){
        self.collectionViewLayout = layout
        self.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: indetifier)
        layout.scrollDirection = direction
        layout.setType(layoutType)
    }
}
