//
//  MovieCategoryLabel.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/24.
//

import UIKit

final class MovieCategoryLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        designLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func designLabel() {
        textColor = .white
        font = .boldSystemFont(ofSize: 17)
        numberOfLines = 1
    }
}
