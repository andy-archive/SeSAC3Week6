//
//  PosterImageView.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/25.
//

import UIKit

final class PosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        print(#function, frame.width, frame)
        backgroundColor = .yellow
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function, frame.width, frame)
        layer.cornerRadius = frame.width / 2 // * 순서가 중요하다
    }
}
