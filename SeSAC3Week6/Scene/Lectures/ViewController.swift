//
//  ViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/21.
//

import UIKit
import SnapKit

// 기존에 하던 AutoLayout의 방식:
// -> 객체를 얹고, 레이아웃을 잡고, 아웃렛을 연결하고, 속성을 조절하고

// CodeBase로 UI를 구성하기
// 1. 뷰 객체 프로퍼티를 선언 (클래스 인스턴스를 생성)
// 2. 명시적으로 루트 뷰에 클래스 인스턴스를 추가
// 3. 크기와 위치를 정의
// 4. 속성을 정의
//  frame으로 좌측 상단부터 -> 한계가 명확
//  AutoResizingMask vs AutoLayout => 스토리보드 대응 (다만, 둘 다 쓸 수 없다!)
//      (AutoResizingMask 쓰는 게 디폴트)
//  NSLayoutConstraints => 코드베이스 대응
//      1. .isActive = true  (쓰지 않을 시 경고 메시지 Result of 'NSLayoutConstraint' initializer is unused)
//      2. addConstraints

final class ViewController: UIViewController {
    
    // 클래스의 인스턴스 생성
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()
    
    let exampleOneButton = {
        let button = ExampleButton()
        button.setTitle("Example One - Layout", for: .normal)
        return button
    }()
    
    let exampleTwoButton = {
        let button = ExampleButton()
        button.setTitle("Example Two - Kakao Talk Profile", for: .normal)
        return button
    }()
    
    let movieButton = {
        let button = ExampleButton()
        button.setTitle("Go to Movie Scene", for: .normal)
        button.backgroundColor = .systemRed
        return button
    }()
    
    let pageButton = {
        let button = ExampleButton()
        button.setTitle("PageViewController", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setLayoutAnchor()
        setButton()
    }
    
    func configureView() {
        
        view.backgroundColor = .white
        
        // MARK: addSubView & translatesAutoresizingMaskIntoConstraints
        // 루트 뷰에 인스턴스 추가 및 AutoResizing에 대한 기본값(true)을 false로 변경
        [emailTextField, passwordTextField, signButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // MARK: emailTextField
        // (1) frame 기반으로 AutoLayout 잡기 (좌측 상단에서부터 적용)
        // emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        // emailTextField.backgroundColor = .lightGray
        // emailTextField.isSecureTextEntry = true
        // emailTextField.keyboardType = .numberPad
        // emailTextField.placeholder = "닉네임을 입력해주세요."
        
        // MARK: passwordTextField
        // (2) NSLayoutConstraints으로 레이아웃을 잡고, 이를 활성화하기
        // (2-a) .isActive = true 방식
        // NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true // 좌측에서는 우측으로(양수)
        // NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true // 우측에서는 좌측으로(음수)
        // NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
        // NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
        
        // (2-b) addConstraints 방식
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50)
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        
        view.addConstraints([leading, trailing, height, top])
        
        passwordTextField.text = "NSLayoutConstraint"
        passwordTextField.textAlignment = .center
        passwordTextField.backgroundColor = .brown
    }
    
    // 스토리보드 없이 연결하기
    @objc func signButtonClicked() {
        // let vc = SnapViewController() // 뷰컨에 대한 인스턴스를 만든 것
        // let vc = TextViewController()
        // let vc = LocationViewController()
        // let nav = UINavigationController(rootViewController: vc)
        let vc = GenericsViewController()
        present(vc, animated: true)
        
        // 클래스 자체를 넘겨 주기
        // transition(viewController: GenericsViewController.self , storyboard: "Main", style: .presentFullNavigation)
    }
    
    @objc func exampleOneButtonClicked() {
        let vc = ExampleOneViewController()
        present(vc, animated: true)
    }
    
    @objc func exampleTwoButtonClicked() {
        let vc = ExampleTwoViewController()
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
    
    @objc func movieButtonClicked() {
        let vc = MovieMainViewController()
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
    
    @objc func pageButtonClicked() {
        let vc = OnboardingViewController()
        present(vc, animated: true)
    }
    
    // MARK: signButton
    func setLayoutAnchor() {
        signButton.backgroundColor = .systemGray
        signButton.setTitle("TRANSITION VIEW", for: .normal)
        signButton.setTitle("YEAH", for: .highlighted)
        
        // 코드로 Action 연결
        signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
//            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor) // Safe Area를 고려함
        ])
    }
    
    func setButton() {
        exampleOneButton.addTarget(self, action: #selector(exampleOneButtonClicked), for: .touchUpInside)
        view.addSubview(exampleOneButton)
        exampleOneButton.snp.makeConstraints { make in
            make.top.equalTo(signButton.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.height.equalTo(40)
        }
        
        exampleTwoButton.addTarget(self, action: #selector(exampleTwoButtonClicked), for: .touchUpInside)
        view.addSubview(exampleTwoButton)
        exampleTwoButton.snp.makeConstraints { make in
            make.top.equalTo(exampleOneButton.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.height.equalTo(40)
        }
        
        movieButton.addTarget(self, action: #selector(movieButtonClicked), for: .touchUpInside)
        view.addSubview(movieButton)
        movieButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
            make.height.equalTo(40)
        }
        
        pageButton.addTarget(self, action: #selector(pageButtonClicked), for: .touchUpInside)
        view.addSubview(pageButton)
        pageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            pageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90),
            pageButton.topAnchor.constraint(equalTo: signButton.topAnchor, constant: -80),
            pageButton.heightAnchor.constraint(equalToConstant: 50),
            pageButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
}
