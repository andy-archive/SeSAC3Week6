//
//  ExampleButton.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/24.
//

import UIKit

final class ExampleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        designButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func designButton() {
        backgroundColor = .systemBlue
        setTitle("Example", for: .normal)
        setTitleColor(.white, for: .normal)
    }
}
