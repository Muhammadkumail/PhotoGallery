//
//  Navigator.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation
import UIKit

class Navigator {
    
    static var sharedInstance = Navigator()
    private init(){}
    
    
    func navigateToPhotoDetailsView(data: Hits?, controller: PhotoListViewController) {
        
        let vc = PhotoDetailsViewController.instantiate(fromPhotoGalleryStoryBoard: .Main)
        let vm = PhotoDetailsViewModel()
        vm.setHit(hit: data)
        vc.viewModel = vm
        vc.title = data?.tags
        controller.navigationController?.pushViewController(vc, animated: true)
    }
}
