//
//  IGridItemsInRow.swift
//  PhotoGallery
//
//  Created by Kumail Kahefi on 25/04/2022.

import UIKit

public protocol IGridItemsInRow {
    func itemsInRow(forSizeType size: SizeType, andLayoutType layout: LayoutType) -> CGFloat
}
