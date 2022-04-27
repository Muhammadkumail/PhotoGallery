//
//  PhotoDetailsViewModel.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.
//

import UIKit

class PhotoDetailsViewModel: BaseViewModel {
    
    private var hit: Hits?
    
    override init() {}
    
    func setHit(hit: Hits?) {
        self.hit = hit
    }
    
    func getHit() -> Hits?  {
        return self.hit
    }
    
    func loadImage(imageView: UIImageView) {
        UIImageView().setImage(urlString: getHit()?.largeImageURL, imageView: imageView)
    }
}
