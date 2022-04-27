//
//  IGridCalculation.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.


import UIKit

public enum LayoutType: String {
    case less = "Less items"
    case more = "More items"

    public mutating func toggle() {
        switch self {
        case .less:
            self = .more
        case .more:
            self = .less
        }
    }
}

public protocol IGridCalculation {

    var gridType: LayoutType { get set }

    var furthestBlockRect: CGRect { get }

    var contentSize: CGSize { get }

    @discardableResult
    func calculate(attributes: [UICollectionViewLayoutAttributes]?,
                   withItemSizes sizes: [IndexPath: SizeType]
    ) -> [UICollectionViewLayoutAttributes]?

    func reset()
}
