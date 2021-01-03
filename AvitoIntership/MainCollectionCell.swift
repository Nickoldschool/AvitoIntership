//
//  MainCollectionCell.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 03.01.2021.
//

import UIKit

final class MainCollectionCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        addSubViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.backgroundColor = #colorLiteral(red: 0.911697649, green: 0.911697649, blue: 0.911697649, alpha: 1)
        contentView.layer.cornerRadius = 5
    }
    
    private func addSubViews() {
        
    }
    
    private func addConstraints() {
        
    }
    
}
