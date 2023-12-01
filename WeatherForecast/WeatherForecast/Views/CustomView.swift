//
//  CustomView.swift
//  WeatherForecast
//
//  Created by 김진웅 on 12/1/23.
//

import UIKit

class CustomView: UIView {
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        return imageView
    }()
    
    lazy var weatherCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.register(ForecastCell.self, forCellWithReuseIdentifier: ForecastCell.reuseIdentifier)
        collectionView.register(WeatherHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: WeatherHeaderView.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            weatherCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            weatherCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            weatherCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            weatherCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10)
        ])
    }
}