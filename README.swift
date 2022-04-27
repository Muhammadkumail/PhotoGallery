//
//  README.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 26/04/2022.
//

//import Foundation

/*
 This Application is a simple photo gallery app, in which you can find varity of flower's photos, and you can zoom IN/ OUT photos , save and share with your friend as well
 
 Here In this project I have used VIPER Design Pattren for building application with following solid princeples.
 
 * In views folder you can  find Scenes (viewControllers, viewModoles) and storyboards
 
 * Interactor folder contain Interactor files which mainly used as a bridge between view and network service layer ,(project can be have multipule interactor layer for each separet modules for betther segaration)
 
 * Entities contains Models for json parsing
 
 * Newwork folder contains 3 sub-folders
    1 - NetworkService (mainly used as a bridge between interactor and Core network call (request manager) (project can be have multipule networK Services for each separet modules for betther segaration)
    2 - Request manager for final network call
    
    3 - Helpers contains , urls, endpoints, build enviroment setting (live , staging , UAT ,..)
 
 * Routers used for navigation (each module should have seprate navigator)
 * Dependency Manager : Manage DI in overall project
 * Extention contain extention of collectionView , UIView, ImageView
 * UI helper contains visual ui effects , save to gallry option , collection view grid functionallity
 * Utility Contains a signle common class for alert in whole project whenever we want
 
 * Two Unit test written in In UnitTest Target.
 
 
 */
