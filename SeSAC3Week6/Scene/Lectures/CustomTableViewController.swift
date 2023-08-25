//
//  CustomTableViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample {
    let text: String
    var isExpand: Bool
}

final class CustomTableViewController: UIViewController {

    // 클로저 다음에 viewDidLoad가 실행 된다
    // CustomTableViewController의 인스턴스 생성 직전에 클로저 구문이 우선 실행
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension // Automatic Dimension 빼먹지 말기
        // self -> 자기 자신의 인스턴스
        view.delegate = self // delegate 프로토콜 연결
        view.dataSource = self // datasource 프로토콜 연결
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell") // UINib -> Xib
        return view
    }()
    
    let imageView = {
        let view = PosterImageView(frame: .zero)
        return view
    }()
    
//    var isExpand = false // false 2, true 0
    var list = [
        Sample(text: "Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell ", isExpand: false),
        Sample(text: "YEAH THIS IS A CELL", isExpand: false),
        Sample(text: "Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell ", isExpand: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configure()
    }
    
    func configure() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
    }
}

//MARK: UITableView
extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomTableViewCell else { return UITableViewCell() }
        cell.label.text = list[indexPath.row].text
        cell.label.numberOfLines = list[indexPath.row].isExpand ? 0 : 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        isExpand.toggle()
        list[indexPath.row].isExpand.toggle() // Boolean
        
//        tableView.reloadData() // 뷰 전체 갱신
        tableView.reloadRows(at: [indexPath], with: .automatic)
//        tableView.reloadRows(at: [indexPath, IndexPath(row: 3, section: 0)], with: .middle) // 특정 셀을 같이 하는 게 가능하다
    }
}
