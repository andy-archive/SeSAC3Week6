//
//  SnapViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/22.
//

import UIKit
import SnapKit

class SnapViewController: UIViewController {

    let redView = UIView()
    let yellowView = UIView()
    let blueView = UIView()
    let greenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        
        view.backgroundColor = .lightGray
        
        [redView, yellowView, blueView].forEach {
            view.addSubview($0)
        }
        
        redView.backgroundColor = .systemRed
        redView.layer.cornerRadius = 10
        redView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
            make.width.equalTo(120)
        }
        
        yellowView.backgroundColor = .systemYellow
        yellowView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide) // .horizontalEdges = .leading.trailing
            make.height.equalTo(100)
        }
        
        blueView.backgroundColor = .systemBlue
        blueView.snp.makeConstraints { make in
            make.center.equalTo(view) // .center == .centerX.centerY
            make.size.equalTo(200) // .size == .height.width
        }
        
        blueView.addSubview(greenView)
        greenView.backgroundColor = .systemGreen
        greenView.snp.makeConstraints { make in
//            make.size.equalTo(50)
//            make.leading.top.equalToSuperview()
//            make.edges.equalTo(blueView).offset(50) // 50씩 바깥으로 이동
            make.edges.equalTo(blueView).inset(50) // 50씩 안쪽으로 이동
        }
        
    }
    
}
