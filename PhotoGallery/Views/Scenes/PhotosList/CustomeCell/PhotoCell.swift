//
//  PhotoCell.swift
//  ugrid_Example
//
//  Created by Aram Semerjyan on 6/6/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

protocol PhotoCellDelegate {
    func didTapView(obj: Hits?)
    func didTapResizw(index: IndexPath?)
}

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    var delegate: PhotoCellDelegate?
    var index: IndexPath?
    var obj: Hits?
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func didTapView(_ sender: UIButton) {
        delegate?.didTapView(obj: obj)
    }
    
    @IBAction func didTapResizw(_ sender: UIButton) {
        delegate?.didTapResizw(index: index)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        bgView.layer.cornerRadius  = 5
        bgView.backgroundColor = .lightGray
    }
    func bindData(index: IndexPath, item: Hits?) {
        self.index = index
        self.obj = item
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.loadShimmer()
        }
        
        UIImageView().setImage(urlString: item?.previewURL, imageView: imgView)
    }
}

extension PhotoCell: Shimmerable {
  public var shimmerViews: [UIView] {
      return [self.bgView]
   }
}
