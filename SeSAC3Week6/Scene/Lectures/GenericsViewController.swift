//
//  GenericsViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/24.
//

import UIKit
import SnapKit

class GenericsViewController: UIViewController {
    
    let sampleLabel = UILabel()
    let sampleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Nav Title"
        view.backgroundColor = .systemBrown
        
        view.addSubview(sampleLabel)
        configureBorder(view: sampleLabel)
        sampleLabel.backgroundColor = .yellow
        sampleLabel.text = "A Test for Using Generics"
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(sampleButton)
        configureBorder(view: sampleButton)
        sampleButton.backgroundColor = .green
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        let value = sumInt(a: 3, b: 8)
        print(value)
        
        /// 타입이 달라서 사용 불가능
//        sumInt(a: 3.5, b: 2.5)
        
//        sum(a: 3, b: 4)
//        sum(a: 2.5, b: 9.1)
    }
    
}
