//
//  IGridCalculationLogicFindEmptySpace.swift
//  PhotoGallery
//
//  Created by Kumail Kahefi on 25/04/2022.

import UIKit

protocol IGridCalculationLogicFindEmptySpace {
    func findEmtpySpace(withAttributes attributes: [UICollectionViewLayoutAttributes],
                        forGridSize size: CGSize,
                        startedFrom startCoord: CGFloat
    ) -> CGRect
}
