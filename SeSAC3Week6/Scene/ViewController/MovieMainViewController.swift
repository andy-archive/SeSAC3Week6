//
//  MovieMainViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/24.
//

import UIKit

final class MovieMainViewController: UIViewController {
    
    let popCornImageView = {
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [.white, .blue])
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 30)
        let image = UIImage(systemName: "popcorn.fill", withConfiguration: colorConfig.applying(sizeConfig))
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    let tvLabel = {
        let label = MovieCategoryLabel()
        label.text = "TV 프로그램"
        return label
    }()
    
    let movieLabel = {
        let label = MovieCategoryLabel()
        label.text = "영화"
        return label
    }()
    
    let favoriteLabel = {
        let label = MovieCategoryLabel()
        label.text = "내가 찜한 콘텐츠"
        return label
    }()
    
    let trailerLabel = {
        let label = MovieCategoryLabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "미리 보기"
        return label
    }()
    
    let middleThumbnail = {
        let image = UIImage().designCircleThumbnail()
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    let leftThumbnail = {
        let image = UIImage().designCircleThumbnail()
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    let rightThumbnail = {
        let image = UIImage().designCircleThumbnail()
        let imageView = UIImageView(image: image)
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = .systemGray2
        
        view.addSubview(popCornImageView)
        popCornImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popCornImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            popCornImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        view.addSubview(movieLabel)
        movieLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            movieLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.addSubview(tvLabel)
        tvLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tvLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            tvLabel.trailingAnchor.constraint(equalTo: movieLabel.leadingAnchor, constant: -20),
        ])
        
        view.addSubview(favoriteLabel)
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            favoriteLabel.leadingAnchor.constraint(equalTo: movieLabel.trailingAnchor, constant: 20),
        ])
        
        view.addSubview(middleThumbnail)
        middleThumbnail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleThumbnail.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            middleThumbnail.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.addSubview(leftThumbnail)
        leftThumbnail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftThumbnail.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            leftThumbnail.trailingAnchor.constraint(equalTo: middleThumbnail.leadingAnchor, constant: -12),
        ])
        
        view.addSubview(rightThumbnail)
        rightThumbnail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightThumbnail.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            rightThumbnail.leadingAnchor.constraint(equalTo: middleThumbnail.trailingAnchor, constant: 12),
        ])
        
        view.addSubview(trailerLabel)
        trailerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trailerLabel.bottomAnchor.constraint(equalTo: leftThumbnail.safeAreaLayoutGuide.topAnchor, constant: -12),
            trailerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
    }

}
