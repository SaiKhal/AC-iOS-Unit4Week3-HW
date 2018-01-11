//
//  DialogView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by Masai Young on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Subviews
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
//        cv.dataSource = self
//        cv.delegate = self
        cv.backgroundColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        cv.register(WeatherCell.self, forCellWithReuseIdentifier: "WeatherCell")
        return cv
    }()
    
    lazy var collectionImageView: UIImageView = {
        let iv = UIImageView(frame: collectionView.frame)
        return iv
    }()
    
    lazy var zipInputField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .gray
        tf.borderStyle = .roundedRect
//        tf.delegate = self
        tf.textColor = .white
        tf.textAlignment = .center
        tf.autocorrectionType = .no
        tf.placeholder = "Enter a zip code"
        tf.keyboardType = .numbersAndPunctuation
        return tf
    }()
    
    lazy var zipLabel: UILabel = {
        let label = UILabel()
        let text = "Enter a Zip Code"
        label.text = text
        return label
    }()
    
    lazy var backgroundView: UILabel = {
        let label = UILabel()
        label.center = collectionView.center
        label.font = UIFont(name: "EuphemiaUCAS-Bold", size: 24)
        label.text = "No weather data found. 😎"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Setup
    private func commonInit() {
        setupViews()
    }
    
   
    
    private func setupViews() {
        setupCollectionView()
        setupZipInputField()
        setupZipLabel()
        setupCollectionImageView()
    }
    
    private func setupCollectionView() {
        self.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
    
    private func setupZipInputField() {
        self.addSubview(zipInputField)
        zipInputField.translatesAutoresizingMaskIntoConstraints = false
        zipInputField.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5).isActive = true
        zipInputField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        zipInputField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupZipLabel() {
        self.addSubview(zipLabel)
        zipLabel.translatesAutoresizingMaskIntoConstraints = false
        zipLabel.topAnchor.constraint(equalTo: zipInputField.bottomAnchor, constant: 30).isActive = true
        zipLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setupCollectionImageView() {
        collectionView.addSubview(collectionImageView)
        collectionImageView.translatesAutoresizingMaskIntoConstraints = false
        collectionImageView.topAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
        collectionImageView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        collectionImageView.rightAnchor.constraint(equalTo: collectionView.rightAnchor).isActive = true
        collectionImageView.leftAnchor.constraint(equalTo: collectionView.leftAnchor).isActive = true
    }
    
    
}