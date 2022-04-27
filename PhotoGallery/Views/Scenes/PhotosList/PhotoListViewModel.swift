//
//  PhotoListViewModel.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.
//

import UIKit

protocol PhotoListViewModelDelegate: BaseViewModelDelegate {
    func updateUI()
}

class PhotoListViewModel: BaseViewModel {

    private var photoInteractor: PhotosInteractorProtocol?
    var delegate: PhotoListViewModelDelegate?
    
    private var photos: Photos?
    
    init(photoInteractor: PhotosInteractorProtocol) {
        super.init()
        self.photoInteractor = photoInteractor
    }
    
    func getPhotosFromAPI() {
        self.photoInteractor?.getPhotos({ photos, error in
            guard photos?.hits?.count ?? 0 > 0 else {
                self.delegate?.showMessage("No Record Found")
                return
            }
            
            print(photos as Any)
            
            self.setPhotos(photos)
            self.delegate?.updateUI()
        })
    }
}

extension PhotoListViewModel {
    func setPhotos(_ photos: Photos?) {
        self.photos = photos
    }
    
    func getPhotos() -> Photos? {
        return self.photos
    }
}
