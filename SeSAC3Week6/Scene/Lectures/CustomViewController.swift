//
//  CustomViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/24.
//

import UIKit
import SnapKit

final class CustomViewController: UIViewController {

    let idTextField = {
        let textField = BlackRadiusTextField()
        textField.configureView()
        textField.placeholder = "Input Your ID"
        return textField
    }()
    
    let passwordTextField = {
        let textField = BlackRadiusTextField()
        textField.placeholder = "Input Your Password"
        return textField
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
    }
    
    func designUI() {
        view.backgroundColor = .white
        
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.center.equalToSuperview().offset(100)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }
}
