//
//  AlertUtils.swift
//  Files
//
//  Created by maks on 19.06.2022.
//

import Foundation
import UIKit

func showAlert(_ vc: UIViewController, title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default)
    alert.addAction(okAction)
    vc.present(alert, animated: true)
}
