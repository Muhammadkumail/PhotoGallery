//
//  IGridSize.swift
//  PhotoGallery
//
//  Created by Kumail Kahefi on 25/04/2022.


import UIKit

public enum SizeType: String {
    case small = "grid_size_small"
    case middle = "grid_size_middle"
    case big = "grid_size_big"

    mutating func toggole() {
        if self == .big {
            self = .small
        } else if self == .small {
            self = .middle
        } else {
            self = .big
        }
    }
}

protocol IGridSizeConfigurable {
    func setGirdItemsInRow(_ itemsInRow: IGridItemsInRow)
}

protocol IGridSize: IGridSizeConfigurable {
    var smallGrid: CGSize { get }
    var middleGrid: CGSize { get }
    var bigGrid: CGSize { get }

    func setType(_ layoutType: LayoutType)
    func getSize(forGridSizeType sizeType: SizeType) -> CGSize
    func countInRow(forItems itemType: SizeType) -> Int
}
