//
//  ILayoutScreen.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.


import UIKit

protocol ILayoutScrollingInfo {
    var scrollingDirection: UICollectionView.ScrollDirection { get set }
}

protocol ILayoutScreen {
    var inset: UIEdgeInsets { get }
    
    var layoutWidth: CGFloat { get }
    var layoutHeight: CGFloat { get }
}

protocol ILayout: ILayoutScreen, ILayoutScrollingInfo { }
