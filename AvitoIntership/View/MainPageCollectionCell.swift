//
//  MainCollectionCell.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 03.01.2021.
//

import UIKit

final class MainPageCollectionCell: UICollectionViewCell {
    
    static let identifier = "MainPageCollectionCell"
    
    private lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        return icon
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 21)
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    lazy var selectedImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(named: "checkmark")
        icon.isHidden = true
        return icon
    }()
    
    var count = 0
    
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
        contentView.backgroundColor = UIColor(named: "WhiteColor")
        contentView.layer.cornerRadius = 5
        [iconImage, titleLabel, descriptionLabel, priceLabel, selectedImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addSubViews() {
        [iconImage, titleLabel, descriptionLabel, priceLabel, selectedImage].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            
            priceLabel.topAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            selectedImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            selectedImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    func update(list: List) {
        if list.isSelected == true {
            titleLabel.text = list.title
            descriptionLabel.text = list.description
            priceLabel.text = list.price
            iconImage.downloaded(from: list.icon["52x52"]!)
        } else {
            contentView.isHidden = true
        }
    }
}

