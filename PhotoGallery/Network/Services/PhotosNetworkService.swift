//
//  RestaurantNetworkService.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation

protocol PhotosNetworkServiceProtocol {
    
    func getPhotoListRequest(_ endPoint: String,completion: @escaping (_ result: Result<Photos>)->Void)
}

class PhotosNetworkService: PhotosNetworkServiceProtocol {
    
    func getPhotoListRequest(_ endPoint: String,completion: @escaping (_ result: Result<Photos>)->Void){
        
        let url = "\(URLConstant.getBaseUrl())\(endPoint)"
        
        RequestManager.shared.request(url: url) { response in
            completion(response)
        }
    }
}
