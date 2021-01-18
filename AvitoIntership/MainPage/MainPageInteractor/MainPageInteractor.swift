//
//  MainPageInteractor.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 17.01.2021.
//

import Foundation

protocol MainPageInteractorInput {
    func getData()
}

protocol MainPageInteractorOutput: AnyObject {
    func fetchData(list: [List], titleText: String)
}

final class MainPageInteractor {
    
    //MARK: - Presenter
    
    weak var presenter: MainPageInteractorOutput?
    
    //MARK: - Parsing
    
    private let parsing = Parsing()
    var jsonDelegate: PassJson?
    
    func retrieveData() -> (list: [List], titleText: String) {   // interactor interacts with data
        var list = [List]()
        var titleText = ""
        jsonDelegate = parsing
        if let localData = self.jsonDelegate?.readLocalJson(jsonName: "result") {
            let type = (self.jsonDelegate?.parseJson(jsonData: localData))!
            list = type.list!
            titleText = type.title
        }
        return (list,titleText)
    }
}

extension MainPageInteractor: MainPageInteractorInput {
    func getData() {
        let dataList = retrieveData()
        presenter?.fetchData(list: dataList.list, titleText: dataList.titleText) // interactor gives data to presenter
    }
}
