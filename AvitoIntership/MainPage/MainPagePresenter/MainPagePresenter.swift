//
//  MainPagePresenter.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 17.01.2021.
//

import UIKit


final class MainPagePresenter {
    
    //MARK: - View, Interactor, Router 
    
    weak var view: MainPageControllerInput?
    var interactor: MainPageInteractorInput?
    var router: MainPageRouterInput?
    let mainPageCollectionCell = MainPageCollectionCell()
    
}

extension MainPagePresenter: MainPageControllerOutput {
    func viewDidLoad() {
        loadData() // presenter requests data from interactor
    }
    
    func loadData() {
        interactor?.getData() // presenter requests data from interactor
    }
    
    func loadAlert(chosenText: String, view: UIViewController) {
        router?.showAlert(chosenText: chosenText, view: view) // presenter call router for showing alert
    }
}

extension MainPagePresenter: MainPageInteractorOutput {
    func fetchData(list: [List], titleText: String) {
        view?.showData(list: list, titleText: titleText)  // presenter tells view that is ready for transfering data
    }
}
