//
//  Extension+UIViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/24.
//

import UIKit

extension UIViewController {
    
    enum TransitionStyle {
        case present // 네비게이션 없이 present
        case presentNavigation // 네비게이션이 임베드 된 present
        case presentFullNavigation // 네비게이션이 임베드 된 fullscreen present
        case push
    }
    
    /*
     "고래밥" -> String
     String -> String.self > String.Type (메타 타입 - 상위 버전이 하나 더 있다)
     UIViewController.Type -> UIVC 타입 그 자체
     */
    func transition<T: UIViewController>(viewController: T.Type, storyboard: String, style: TransitionStyle) {
        
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else { return }
        
        switch style {
        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    /// Type Parameter
    /// 타입의 종류는 알려주지는 않으나, 모두 같은 타입이 들어갈 것을 암시한다. 일종의 Placeholder 같은 역할을 한다
    
    /// Type Constraints
    /// 클래스의 제약과 프로토콜의 제약
    
    /// Generics를 사용할 때는 일반적으로 "T" => Type Parameter를 많이 쓴다.
    /// 한두 개를 더 추가한다면 "U" => Uppercased를 쓴다.
    func configureBorder<T: UIView>(view: T) {
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
    
    ///Generics: 타입을 유연하게 대응하기 위한 문법
    ///코드의 중복과 재사용에 대응하기 좋아서 추상적으로 표현이 가능하다
    ///제네릭에 대한 명칭은 마음대로 지정할 수 있지만 "T"를 일반적으로 사용한다
    func sum<Andy: AdditiveArithmetic>(a: Andy, b: Andy) -> Andy {
        return a + b
    }
    
    /// 아래처럼 할 수도 있지만 타입에 따라 여러 함수를 만들어야 하니 번거롭다
    func sumInt(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func sumDouble(a: Double, b: Double) -> Double {
        return a + b
    }
    
    func sumFloat(a: Float, b: Float) -> Float {
        return a + b
    }
}
