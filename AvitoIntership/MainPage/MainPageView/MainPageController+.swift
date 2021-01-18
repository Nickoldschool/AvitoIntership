//
//  MainPageController+.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 03.01.2021.
//

import UIKit

extension MainPageController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MainPageCollectionCell,
           let text = listToShow?[indexPath.row] {
           let newChosenText = text.title
            cell.selectedImage.isHidden = (cell.selectedImage.isHidden == false) ? true : false
            chosenText = (chosenText == newChosenText) ? nil : newChosenText
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MainPageCollectionCell {
            cell.selectedImage.isHidden = true
        }
    }
}

extension MainPageController: UICollectionViewDataSource {
       
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let list = listToShow else { return 0 }
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageCollectionCell.identifier, for: indexPath) as? MainPageCollectionCell,
              let list = listToShow?[indexPath.row]
        else { return UICollectionViewCell() }
        cell.showCell(list: list) // view tells cell that is ready for transfering data
        return cell
    }
}
