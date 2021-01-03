//
//  MainCollectionCell.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 03.01.2021.
//

import UIKit

final class MainCollectionCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionCell"
    
    private lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(named: "checkmark")
        return icon
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "XL-объявление"
        label.font = .boldSystemFont(ofSize: 21)
        label.textColor = .black
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Пользователи смогут посмотреть фотографии, описание и телефон прямо из результатов поиска."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var costLabel: UILabel = {
        let label = UILabel()
        label.text = "356 ₽"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var selectedImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(named: "checkmark")
        return icon
    }()
    
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
        contentView.backgroundColor = #colorLiteral(red: 0.9660613148, green: 0.9660613148, blue: 0.9660613148, alpha: 1)
        contentView.layer.cornerRadius = 5
        [iconImage, titleLabel, textLabel, costLabel, selectedImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addSubViews() {
        [iconImage, titleLabel, textLabel, costLabel, selectedImage].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            
            costLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 15),
            costLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            
            selectedImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            selectedImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
}
