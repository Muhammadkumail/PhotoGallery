//
//  DI.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.
//

import Foundation

class DIManager {
    
    private static var sharedDependencyManager: DIManager = {
        
        let dependencyManager = DIManager()
        
        return dependencyManager
    }()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Accessors
    
    class func sharedInstance() -> DIManager {
        return sharedDependencyManager
    }
    
    var photoInteractor: PhotosInteractorProtocol {
        get {
            return PhotosInteractor(photosNetworkService: PhotosNetworkService())
        }
    }
    
    var photoNetworkService: PhotosNetworkServiceProtocol {
        get {
            return PhotosNetworkService()
        }
    }
}
