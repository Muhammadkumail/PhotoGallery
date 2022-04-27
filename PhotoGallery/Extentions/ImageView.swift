//
//  Image + Extention.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    
    func setImage(urlString: String?, imageView: UIImageView) {
        
        if let url = URL.init(string: urlString ?? "") {
            
            imageView.sd_setImage(with: url , placeholderImage: nil , options : .allowInvalidSSLCertificates) { ( image , error , type , url ) in
                
                guard error == nil else {
                    imageView.image = UIImage.init(named: "placeHolder")
                    return
                }
                
                guard let img = image else{
                    imageView.image = UIImage.init(named: "placeHolder")
                    return
                }
                
                imageView.image = img
            }
        }
    }
}
