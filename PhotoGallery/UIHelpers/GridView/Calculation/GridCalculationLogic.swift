//
//  GridCalculationLogic.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.

import UIKit

final class GridCalculationLogic: IGridCalculation {

    // MARK: - private vars
    private var _repo: IGridSizeRepository!
    private var _layout: ILayout!
    private var _gridSize: IGridSize!

    private lazy var _emptySpaceFinder: [Int: IGridCalculationLogicFindEmptySpace] = {
        [
            UICollectionView.ScrollDirection.vertical.rawValue: VerticalEmptySpaceFinder(gridSize: self._gridSize, layout: self._layout),
            UICollectionView.ScrollDirection.horizontal.rawValue: HorizontalEmptySpaceFinder(gridSize: self._gridSize, layout: self._layout)
        ]
    }()

    private lazy var _findCompleteRows: [Int: IGridCompleteRowFinder] = {
        [
            UICollectionView.ScrollDirection.vertical.rawValue: ClearVerticalCompleteRow(gridSize: self._gridSize),
            UICollectionView.ScrollDirection.horizontal.rawValue: ClearHorizontalCompleteRow(gridSize: self._gridSize)
        ]
    }()

    private var _furthestBlockRect: CGRect = .zero
    private var _contentSize: CGSize = .zero

    // MARK: - life cycle
    required init(_ layout: ILayout, gridSize: IGridSize) {
        _layout = layout
        _repo = GridSizeRepository()
        _gridSize = gridSize
    }

    // MARK: - protocol conformance
    var gridType: LayoutType = .less {
        willSet {
            _gridSize.setType(newValue)
        }
    }

    var furthestBlockRect: CGRect {
        return _furthestBlockRect
    }

    var contentSize: CGSize {
        return _contentSize
    }

    func reset() {
        _furthestBlockRect = .zero
        _contentSize = .zero
    }

    @discardableResult
    func calculate(attributes: [UICollectionViewLayoutAttributes]?,
                   withItemSizes sizes: [IndexPath: SizeType]
    ) -> [UICollectionViewLayoutAttributes]? {

        guard let attributes = attributes else { return nil }

        guard !attributes.isEmpty else { return attributes }

        var attributesInRow = [UICollectionViewLayoutAttributes]()

        // TODO: I don't like the idea of having start coordinate here
        // Y coord from where algorithm should start to look for empy space
        var startCoord: CGFloat = 0.0

        attributes.forEach { (a) in
            let size: SizeType = sizes[a.indexPath] ?? .small
            a.frame.size = _gridSize.getSize(forGridSizeType: size)

            // TODO: need to be reviewed
            let spaceRect = _emptySpaceFinder[_layout.scrollingDirection.rawValue]?.findEmtpySpace(
                withAttributes: attributesInRow,
                forGridSize: a.frame.size,
                startedFrom: startCoord
                ) ?? .zero

            a.frame = spaceRect

            attributesInRow.append(a)

            _findCompleteRows[_layout.scrollingDirection.rawValue]?.findCompleteRows(
                inAttributes: attributesInRow,
                completion: { (v) in
                    attributesInRow.removeAll()

                    startCoord = v
            })
        }

        // TODO: need to be revied
        if _layout.scrollingDirection == .vertical {
            let blockPoint = attributesInRow.sorted { $0.frame.maxY > $1.frame.maxY }.first?.frame

            _furthestBlockRect = blockPoint ?? .zero

            _contentSize = .init(width: _layout.layoutWidth, height: _furthestBlockRect.maxY)
        } else {
            let blockPoint = attributesInRow.sorted { $0.frame.maxX > $1.frame.maxX }.first?.frame

            _furthestBlockRect = blockPoint ?? .zero

            let width = _furthestBlockRect.maxX == 0.0 ? _layout.layoutWidth : _furthestBlockRect.maxX
            _contentSize = .init(width: width, height: _layout.layoutHeight)
        }

        return attributes
    }
}
