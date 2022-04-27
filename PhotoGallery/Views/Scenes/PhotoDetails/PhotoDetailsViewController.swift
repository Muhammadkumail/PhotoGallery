//
//  PhotoDetailsViewController.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.
//

import UIKit

class PhotoDetailsViewController: BaseViewController {
    
    @IBOutlet private weak var popUpView: UIView!
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var saveToGallery: UIButton!
    @IBOutlet private weak var announcementTopImage: UIImageView!
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var descriptionLbl: UILabel!
    
    var viewModel: PhotoDetailsViewModel?
    
//    lazy var blurredView: UIView = ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
        setupData()
    }
    
    @IBAction func didTapShare(_ sender: UIButton) {
        let text = viewModel?.getHit()?.tags ?? ""
        let image = announcementTopImage.image ?? UIImage()
        let imageUrl = URL(string: viewModel?.getHit()?.pageURL ?? "")
        let shareAll = [text , image , imageUrl as Any]
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }

    @IBAction func didTapSave(_ sender: UIButton) {
        let obj = SaveToGallery()
        obj.delegate = self
        obj.checkPermission(image: obj.captureScreenshot(view: announcementTopImage))
    }
}

extension PhotoDetailsViewController: SaveToGalleryDelegate {
    func photoSavedSuccessfully(status: Bool,message: String) {
        
        DispatchQueue.main.async {
            AlertService.sharedInstance.showAlert(title: "Alert", message: message, buttonText: "OK", controller: self)
            
        }
    }
}

extension PhotoDetailsViewController {
    func setupView() {
        setupLayoutView()
        setupButtons()
        setupTitles()
        setupColors()
    }
    
    func setupData() {
        viewModel?.loadImage(imageView: self.announcementTopImage)
    }
}
extension PhotoDetailsViewController {
 
    func setupLayoutView() {
        
        view.addSubview(blurredView)
        view.sendSubviewToBack(blurredView)
        
        popUpView.layer.cornerRadius = 10
        backgroundView.isHidden = true
    }
    
    func setupButtons() {
        shareButton.clipsToBounds = true
        shareButton.layer.borderWidth = 1
        
        saveToGallery.clipsToBounds = true
        saveToGallery.layer.borderWidth = 1
    }
    
    func setupTitles() {
        
        shareButton.setTitle("Share", for: .normal)
        
        saveToGallery.setTitle("Save" , for: .normal)
        
        titleLbl.text =  viewModel?.getHit()?.tags
        
        descriptionLbl.text =  viewModel?.getHit()?.tags
    }
    
    func setupColors() {
        descriptionLbl.textColor = .gray
        saveToGallery.backgroundColor = UIColor.gray
        saveToGallery.setTitleColor(.black, for: .normal)
        shareButton.layer.borderColor = UIColor.gray.cgColor
        shareButton.setTitleColor(.black, for: .normal)
    }
}
