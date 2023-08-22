//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    let photoImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemMint
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleTextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "Input Title"
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 15)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        
        view.backgroundColor = .white
        
        [photoImageView, titleTextField].forEach {
            view.addSubview($0)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20) // leading.equalTo(view).inset(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
    }
}
