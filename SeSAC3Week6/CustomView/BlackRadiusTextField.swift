//
//  BlackRadiusTextField.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/24.
//

import UIKit

final class BlackRadiusTextField: UITextField {
    
    /// Interface Builder를 사용하지 않고, UIView를 상속 받은 Custom Class를 코드로 구성할 때 (in CodeBased)
    /// 사용되는 초기화 구문이다
    override init(frame: CGRect) { // from UIView
        
        super.init(frame: frame)
        configureView()
    }
    
    /// NSCoding
    /// XIB ==> NIB의 변환 과정에서 객체를 생성할 때 필요한 init 구문 (in Storyboard)
    /// Interface Builder에서 생성된 뷰들이 초기화 될 때 실행되는 구문이다
    /// 코드 베이스가 되더라도 실행이 되려고 한다 ==> 않게끔 막아야 함
    required init?(coder: NSCoder) { // from NSCoding -> required을 통해 프로토콜에서 온 initializer인 것을 알 수 있다
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        placeholder = "Input Your ID"
        textColor = .black
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
    }
}

protocol ExampleProtocol {
    init(name: String)
}

class Mobile: ExampleProtocol {
    
    //required: 프로토콜에서 생성된 경우 사용하는 키워드
    //Required Initializer
    required init(name: String) {
//        <#code#>
    }
    
    
}
