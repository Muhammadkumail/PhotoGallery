//
//  IGridSizeRepository.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.

import UIKit

public protocol IGridSizeRepository {

    var defaultSize: SizeType { get set }

    func size(forIndexPath indexPath: IndexPath) -> SizeType
    func set(size: SizeType, forIndexPath indexPath: IndexPath)
    func swap(from: IndexPath, to: IndexPath)

    func clearStore()
}
