//
//  MainPageAssembly.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 17.01.2021.
//

import UIKit

final class MainPageAssembly {
    
    static func assembly() -> UIViewController {
        let view = MainPageController()
        let cell = MainPageCollectionCell()
        let interactor = MainPageInteractor()
        let presenter = MainPagePresenter()
        let router = MainPageRouter()
        
        view.cell = cell
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
