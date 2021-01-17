//
//  Alert.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 17.01.2021.
//

import UIKit

final class Alert {
    func showAlert(vc: UIViewController, title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
