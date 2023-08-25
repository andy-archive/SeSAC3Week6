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

class CustomTableViewController: UIViewController {

    let tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension // Automatic Dimension 빼먹지 말기
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
        
        designUI()
    }
    
    func designUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.delegate = self // delegate 프로토콜 연결
        tableView.dataSource = self // datasource 프로토콜 연결
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell") // UINib -> Xib
    }

}

//MARK: UITableView
extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
        cell.textLabel?.text = "Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell Test Cell "
        cell.textLabel?.text = list[indexPath.row].text
        cell.textLabel?.numberOfLines = list[indexPath.row].isExpand ? 0 : 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        isExpand.toggle()
        list[indexPath.row].isExpand.toggle() // Boolean 변환
//        tableView.reloadData() // 뷰 전체 갱신
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
//        tableView.reloadRows(at: [indexPath, IndexPath(row: 3, section: 0)], with: .middle) // 특정 셀을 같이 하는 게 가능하다
    }
}
