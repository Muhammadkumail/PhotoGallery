//
//  GridItemsInRow.swift
//  PhotoGallery
//
//  Created by Kumail Kahefi on 25/04/2022.

import UIKit

final class GridItemsInRow: IGridItemsInRow {
    func itemsInRow(forSizeType size: SizeType, andLayoutType layout: LayoutType) -> CGFloat {

        switch layout {
        case .less:
            switch size {
            case .small:
                return 4
            case .middle:
                return 2
            case .big:
                return 1
            }
        case .more:
            switch size {
            case .small:
                return 6
            case .middle:
                return 3
            case .big:
                return 1
            }
        }
    }
}
