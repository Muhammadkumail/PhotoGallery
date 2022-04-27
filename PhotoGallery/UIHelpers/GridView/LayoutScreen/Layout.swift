//
//  LyoutScreen.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.


import UIKit

final class Layout {

    var scrollingDirection: UICollectionView.ScrollDirection

    private var _collectionView: UICollectionView!

    init(_ collectionView: UICollectionView,
         scrollingDirrection direction: UICollectionView.ScrollDirection = .vertical
    ) {
        _collectionView = collectionView
        scrollingDirection = direction
    }
}

extension Layout: ILayout {
    var inset: UIEdgeInsets {
        .init(top: 0, left: 10, bottom: 0, right: 10)
    }

    var layoutWidth: CGFloat {
        _collectionView.frame.width
    }

    var layoutHeight: CGFloat {
        _collectionView.frame.height
    }
}

