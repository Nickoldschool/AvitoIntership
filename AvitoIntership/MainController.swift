//
//  MainController.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 03.01.2021.
//

import UIKit

final class MainController: UIViewController {
    
    private lazy var closeIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "CloseIconTemplate")
        icon.contentMode = .scaleAspectFit
        return icon
    }()
   
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Сделайте объявление заметнее на 7 дней"
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var advertisingCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: advertisingLayout)
        collection.register(MainCollectionCell.self, forCellWithReuseIdentifier: MainCollectionCell.identifier)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        return collection
    }()
    
    lazy var advertisingLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: view.bounds.width - 40, height: 150)
        return layout
    }()
    
    private lazy var tapButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addSubViews()
        addConstraints()
    }
    
    private func configure() {
        view.backgroundColor = .white
        [closeIcon, textLabel, advertisingCollection, tapButton ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addSubViews() {
        view.addSubview(advertisingCollection)
        [closeIcon, textLabel, advertisingCollection, tapButton ].forEach {
            view.addSubview($0)
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            closeIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            textLabel.topAnchor.constraint(equalTo: closeIcon.bottomAnchor, constant: 30),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            advertisingCollection.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 30),
            advertisingCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            advertisingCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            advertisingCollection.heightAnchor.constraint(equalToConstant: view.bounds.height / 2),

            tapButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            tapButton.heightAnchor.constraint(equalToConstant: 50),
            tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
}
