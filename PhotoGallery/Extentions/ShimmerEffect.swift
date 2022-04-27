//
//  BlueEffect.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.
//

import UIKit

protocol Shimmerable: UIView {
    var shimmerViews: [UIView] { get }
}

extension Shimmerable {
    func loadShimmer() {
        shimmerViews.forEach { $0.applyShimmerEffect()}
    }
}
    
extension UIView {
    
    func applyShimmerEffect() {
        
        let light = backgroundColor?.withAlphaComponent(0.5).cgColor ?? UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        let dark = UIColor.clear.cgColor
        let shimmerGradientLayer = CAGradientLayer()
        shimmerGradientLayer.colors = [light, dark]
        shimmerGradientLayer.frame = CGRect(x: -bounds.width, y: 0, width: 50 * bounds.size.width, height: bounds.size.height)
        shimmerGradientLayer.startPoint = CGPoint(x: 0.0, y: 0)
        shimmerGradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        shimmerGradientLayer.locations = [0.0, 0.1]
        layer.mask = shimmerGradientLayer
        
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1]
        animation.toValue = [0.1, 0.2]
        animation.duration = 0.7
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        shimmerGradientLayer.add(animation, forKey: "shimmer")
    }
}
