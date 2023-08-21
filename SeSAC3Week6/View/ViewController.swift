//
//  ViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/21.
//

import UIKit

// 기존에 하던 AutoLayout의 방식:
// -> 객체를 얹고, 레이아웃을 잡고, 아웃렛을 연결하고, 속성을 조절하고

// CodeBase로 UI를 구성하기
// 1. 뷰 객체 프로퍼티를 선언 (클래스 인스턴스를 생성)
// 2. 명시적으로 루트 뷰에 클래스 인스턴스를 추가
// 3. 크기와 위치를 정의
// 4. 속성을 정의
//  frame으로 좌측 상단부터 -> 한계가 명확
//  AutoResizingMask vs AutoLayout => 스토리보드 대응 (다만, 둘 다 쓸 수 없다!)
//      AutoResizingMask 쓰는 게 디폴트
//  NSLayoutConstraints => 코드베이스 대응

class ViewController: UIViewController {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        
        // MARK: addSubView
        [emailTextField, passwordTextField].forEach {
            view.addSubview($0)
        }
//        view.addSubview(emailTextField)
//        view.addSubview(passwordTextField)
        
        // MARK: emailTextField
        // (1) frame 기반으로 AutoLayout 잡기 (좌측 상단에서부터 적용)
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        emailTextField.backgroundColor = .lightGray
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "닉네임을 입력해주세요."
        
        // MARK: passwordTextField
        // (2) NSLayoutConstraints으로 AutoLayout을 잡고, 이를 활성화하기
        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true // 좌측에서는 우측으로(양수)
        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true // 우측에서는 좌측으로(음수)
        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false // AutoResizing과의 충돌 방지하기
        passwordTextField.backgroundColor = .brown
    }

}

