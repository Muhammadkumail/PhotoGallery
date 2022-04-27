//
//  IGridCalculationClearCache.swift
//  PhotoGallery
//
//  Created by Kumail Kahefi on 25/04/2022.
//

import UIKit

protocol IGridCompleteRowFinder {

    func findCompleteRows(inAttributes attributes: [UICollectionViewLayoutAttributes],
                          completion: @escaping (CGFloat) -> Void
    )
}
