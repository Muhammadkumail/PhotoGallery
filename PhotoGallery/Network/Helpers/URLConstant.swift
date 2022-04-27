//
//  URLConstant.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.
//

import Foundation

enum BuildEnvironment: String {
    case Live = "Live"
    case Staging = "Staging"
}

struct URLConstant {
    
    static func SetupEnvironment(type: BuildEnvironment = .Live) {
        Defaults.setEnvironment(type: type)
    }
    
    static func getBaseUrl() -> String {
        
        switch Defaults.getEnvironment() {
        case .Live:
            return URLConstant.BaseUrls.liveBaseUrl.rawValue
        case .Staging:
            return URLConstant.BaseUrls.StagingBaseUrl.rawValue
        default :
            return URLConstant.BaseUrls.liveBaseUrl.rawValue
        }
    }
    
    
    enum BaseUrls: String {
        case liveBaseUrl = "https://pixabay.com"
        case StagingBaseUrl = "https://staging.pixabay.com/" // Dummy 
    }
    
    enum EndPoints : String , CaseIterable {
        case photoList = "/api/?key=26990564-ac5cb4fecc4ecaed5fbe8ca6a&q=yellow+flowers&image_type=photo&pretty=true"
    }
    
}
