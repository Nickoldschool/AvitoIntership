//
//  MainPageController+.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 03.01.2021.
//

import UIKit


extension MainPageController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = advertisingCollection.cellForItem(at: indexPath) as? MainPageCollectionCell {
            cell.selectedImage.isHidden = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = advertisingCollection.cellForItem(at: indexPath) as? MainPageCollectionCell {
            cell.selectedImage.isHidden = true
        }
    }
}

extension MainPageController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let list = list else { return 0}
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = advertisingCollection.dequeueReusableCell(withReuseIdentifier: MainPageCollectionCell.identifier, for: indexPath) as? MainPageCollectionCell,
              let list = list?[indexPath.row]
        else { return UICollectionViewCell() }
        cell.update(list: list)
        return cell
    }
}

extension MainPageController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
