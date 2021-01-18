//
//  MainPageController.swift
//  AvitoIntership
//
//  Created by Nick Chekmazov on 03.01.2021.
//

import UIKit

protocol MainPageControllerInput: AnyObject {
    func showData(list: [List], titleText: String)
}

protocol MainPageControllerOutput {
    func viewDidLoad()
    
    func loadAlert(chosenText: String, view: UIViewController)
}

final class MainPageController: UIViewController {
    
    //MARK: - Presenter
    
    var presenter: MainPageControllerOutput?
    
    //MARK: - Cell
    
    var cell: MainPageCollectionCellInput?

    var listToShow: [List]?
    
    var chosenText: String?
    
    private lazy var closeIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "CloseIconTemplate")
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var advertisingCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: advertisingLayout)
        collection.register(MainPageCollectionCell.self, forCellWithReuseIdentifier: MainPageCollectionCell.identifier)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.isScrollEnabled = false
        return collection
    }()
    
    private lazy var advertisingLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.bounds.width - 40, height: 160)
        layout.minimumLineSpacing = 15
        return layout
    }()
    
    private lazy var tapButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(named: "BlueColor")
        button.addTarget(self, action: #selector(callAlert), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addSubViews()
        addConstraints()
        presenter?.viewDidLoad()  // ask presenter to load data
    }
    
    private func configure() {
        view.backgroundColor = .white
        [closeIcon, textLabel, advertisingCollection, tapButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addSubViews() {
        view.addSubview(advertisingCollection)
        [closeIcon, textLabel, advertisingCollection, tapButton].forEach {
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
            
            advertisingCollection.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 25),
            advertisingCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            advertisingCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            advertisingCollection.heightAnchor.constraint(equalToConstant: view.bounds.height / 2),
            
            tapButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            tapButton.heightAnchor.constraint(equalToConstant: 50),
            tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    private func setTitleText(text: String) {
        textLabel.text = text
    }
    
    @objc private func callAlert() {
        presenter?.loadAlert(chosenText: chosenText ?? "", view: self) // ask presenter to load alert
    }
}

extension MainPageController: MainPageControllerInput {
    
    func showData(list: [List], titleText: String) {
        setTitleText(text: titleText)
        listToShow = list
    }
}
