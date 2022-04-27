//
//  ViewController.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.
//

import UIKit

class PhotoListViewController: BaseViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!

    private var layout = UGridFlowLayout()
    private var viewModel: PhotoListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupViews()
    }
    
    func setupData() {
        setupViewModel()
        getPhotos()
    }
    
    func setupViews() {
        setUpCollectionView()
        setupNavigation()
    }
    
    func setupViewModel() {
        viewModel = PhotoListViewModel.init(photoInteractor: DIManager.sharedInstance().photoInteractor)
        viewModel?.delegate = self
    }
    
    func setupNavigation() {
        self.title = "Photo Gallery"
    }
    
    func getPhotos() {
        viewModel?.getPhotosFromAPI()
    }

    private func setUpCollectionView() {
        photoCollectionView.setupCollectionView(indetifier: "PhotoCell",layout: layout)
        photoCollectionView.dataSource = self
    }
}

extension PhotoListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.getPhotos()?.hits?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell {
            
            guard let photos = viewModel?.getPhotos()?.hits else {
                return UICollectionViewCell()
            }
            cell.delegate = self
            cell.bindData(index: indexPath, item: photos[indexPath.row])
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension PhotoListViewController: PhotoCellDelegate {
    
    func didTapView(obj: Hits?) {
        Navigator.sharedInstance.navigateToPhotoDetailsView(data: obj, controller: self)
    }
    
    func didTapResizw(index: IndexPath?) {
        layout.toggleSize(forIndexPath: index ?? IndexPath())
    }
}

extension PhotoListViewController: PhotoListViewModelDelegate {
    
    func showMessage(_ message: String) {
        AlertService.sharedInstance.showAlert(title: "Alert", message: message, buttonText: "Ok", controller: self)
    }
    
    func updateUI() {
        photoCollectionView.reloadData()
    }
}
