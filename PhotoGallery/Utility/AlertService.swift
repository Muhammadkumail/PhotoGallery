//
//  AlertService.swift
//  PhotoGallery
//
//  Created by kumail kashefi on 26/04/2022.

import Foundation
import UIKit

class AlertService {
    
    static var sharedInstance = AlertService()
    
    func showAlert(title:String, message:String, buttonText:String, controller: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: { action in
            switch action.style{
            case .default:
                return
            case .cancel:
                controller.dismiss(animated: true, completion: nil)
            case .destructive:
                return
             default:
                break
            }}))
        controller.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String?, message: String?, actionTitles:[String?], controller: UIViewController, actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        controller.present(alert, animated: true, completion: nil)
    }
    
}
