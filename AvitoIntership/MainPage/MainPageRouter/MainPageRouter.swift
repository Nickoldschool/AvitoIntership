//
//  MainPageRouter.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 17.01.2021.
//

import UIKit

protocol MainPageRouterInput {
    func showAlert(chosenText: String, view: UIViewController)
}

final class MainPageRouter {
    
}

extension MainPageRouter: MainPageRouterInput {
    func showAlert(chosenText: String, view: UIViewController) {
        let alert = Alert()
        if chosenText == "" {
            alert.showAlert(vc: view, title: "Услуга не выбрана", text: "Пожалуйста, выберите услугу")
        } else {
            alert.showAlert(vc: view, title: "Выбранная услуга", text: chosenText)
        }
    }
}
