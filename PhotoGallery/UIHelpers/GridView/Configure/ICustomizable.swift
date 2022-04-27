//
//  IConfigure.swift
//  PhotoGallery
//
//  Created by Kumail Kahefi on 25/04/2022.


import UIKit

public protocol ICustomizable {
    func setCalculationLogic(_ logic: IGridCalculation)
    func setSizeRepository(_ repo: IGridSizeRepository)
    func setGridItemsInRow(_ itemsInRow: IGridItemsInRow)
    func setDefaultGridSize(_ size: SizeType)
}
