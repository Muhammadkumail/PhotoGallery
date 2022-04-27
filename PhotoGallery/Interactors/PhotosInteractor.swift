//
//  PhotosInteractor.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.
//

import Foundation

protocol PhotosInteractorProtocol {
    func getPhotos(_ callback: @escaping((_ response: Photos?, _ error: String?) -> Void) )
}

class PhotosInteractor: PhotosInteractorProtocol {
    
    private var photosNetworkService: PhotosNetworkServiceProtocol?
    
    init(photosNetworkService: PhotosNetworkServiceProtocol) {
        self.photosNetworkService = photosNetworkService
    }
    
    func getPhotos(_ callback: @escaping ((Photos?, String?) -> Void)) {
        
        photosNetworkService?.getPhotoListRequest(URLConstant.EndPoints.photoList.rawValue, completion: { result in
            
            switch result{
            case .success(let response):
                callback(response, nil)
                
            case .failure(let error):
                print(error)
                callback(nil, error.localizedDescription)
            }
        })
    }
}
