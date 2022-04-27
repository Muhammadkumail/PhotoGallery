//
//  SaveToGallery.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 26/04/2022.
//

import Foundation
import UIKit
import Photos

public protocol SaveToGalleryDelegate {
    func photoSavedSuccessfully(status: Bool,message: String)
}

class SaveToGallery {
    
    public var delegate: SaveToGalleryDelegate?
    
    func captureScreenshot(view: UIView?) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view?.frame.size ?? CGSize.zero, false, UIScreen.main.scale)
        view?.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let img = image{
            return img
        }
        return UIImage()
    }
    
    func checkPermission(image: UIImage) {
        PHPhotoLibrary.requestAuthorization
            { (status) -> Void in
                switch (status) {
                    
                case .authorized:
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    self.delegate?.photoSavedSuccessfully(status: true, message: "Your Photo Has Been Saved successfully")
                    
                case .denied:
                    self.delegate?.photoSavedSuccessfully(status: false, message: "Your Photo Can't Be Save. You Don't Have Permission To Save Photo.")
                    
                default:
                    self.delegate?.photoSavedSuccessfully(status: false, message: "Something Is Wrong.")
                }
        }
    }
}
