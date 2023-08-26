//
//  MovieMainViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/24.
//

import UIKit

final class MovieMainViewController: UIViewController {
    
    private let popcornImageView = {
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [.white, .blue])
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 30)
        let image = UIImage(systemName: "popcorn.fill", withConfiguration: colorConfig.applying(sizeConfig))
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let tvLabel = {
        let label = MovieCategoryLabel()
        label.text = "TV 프로그램"
        return label
    }()
    
    private let movieLabel = {
        let label = MovieCategoryLabel()
        label.text = "영화"
        return label
    }()
    
    private let favoriteLabel = {
        let label = MovieCategoryLabel()
        label.text = "내가 찜한 콘텐츠"
        return label
    }()
    
    private let trailerBackView = {
        let view = UIView()
        view.backgroundColor = .systemIndigo
        return view
    }()
    
    private let trailerLabel = {
        let label = MovieCategoryLabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "미리 보기"
        return label
    }()
    
    private let middleThumbnail = {
        let image = UIImage().designCircleThumbnail()
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let leftThumbnail = {
        let image = UIImage().designCircleThumbnail()
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let rightThumbnail = {
        let image = UIImage().designCircleThumbnail()
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let buttonBackView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
    }()
    
    private let favoriteButton = {
        let button = UIButton()
        button.configuration = .designMovieButton(buttonType: .favorite)
        return button
    }()
    
    private let infoButton = {
        let button = UIButton()
        button.configuration = .designMovieButton(buttonType: .info)
        return button
    }()
    
    private let playButton = {
        let button = UIButton()
        button.configuration = .designPlayButton(buttonType: .play)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        
        // MARK: view
        view.backgroundColor = .systemGray2
        
        // MARK: view on top
        view.addSubview(popcornImageView)
        popcornImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popcornImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            popcornImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
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
        
        // MARK: view on bottom
        view.addSubview(trailerBackView)
        trailerBackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trailerBackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.34, constant: 40),
            trailerBackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            trailerBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailerBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        trailerBackView.addSubview(middleThumbnail)
        middleThumbnail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleThumbnail.bottomAnchor.constraint(equalTo: trailerBackView.bottomAnchor, constant: -8),
            middleThumbnail.centerXAnchor.constraint(equalTo: trailerBackView.centerXAnchor),
        ])

        trailerBackView.addSubview(leftThumbnail)
        leftThumbnail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftThumbnail.bottomAnchor.constraint(equalTo: trailerBackView.bottomAnchor, constant: -8),
            leftThumbnail.trailingAnchor.constraint(equalTo: middleThumbnail.leadingAnchor, constant: -12),
        ])

        trailerBackView.addSubview(rightThumbnail)
        rightThumbnail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightThumbnail.bottomAnchor.constraint(equalTo: trailerBackView.bottomAnchor, constant: -8),
            rightThumbnail.leadingAnchor.constraint(equalTo: middleThumbnail.trailingAnchor, constant: 12),
        ])

        trailerBackView.addSubview(trailerLabel)
        trailerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trailerLabel.leadingAnchor.constraint(equalTo: trailerBackView.leadingAnchor, constant: 20),
            trailerLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailerBackView.trailingAnchor),
            trailerLabel.bottomAnchor.constraint(equalTo: leftThumbnail.topAnchor, constant: -8)
        ])
        
        // MARK: view on middle
        view.addSubview(buttonBackView)
        buttonBackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonBackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            buttonBackView.bottomAnchor.constraint(equalTo: trailerBackView.topAnchor),
            buttonBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        buttonBackView.addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteButton.leadingAnchor.constraint(equalTo: buttonBackView.leadingAnchor, constant: 12),
            favoriteButton.centerYAnchor.constraint(equalTo: buttonBackView.centerYAnchor),
        ])
        
        buttonBackView.addSubview(infoButton)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.trailingAnchor.constraint(equalTo: buttonBackView.trailingAnchor, constant: -60),
            infoButton.centerYAnchor.constraint(equalTo: buttonBackView.centerYAnchor),
        ])
        
        buttonBackView.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: buttonBackView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: buttonBackView.centerYAnchor),
            
        ])
    }

}
