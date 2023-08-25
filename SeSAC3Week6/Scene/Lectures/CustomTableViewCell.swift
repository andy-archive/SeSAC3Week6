//
//  CustomTableViewCell.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/25.
//

import UIKit
import SnapKit

final class CustomTableViewCell: UITableViewCell {
    
    let label = UILabel()
    let button = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints() // addSubview 이후 Constraints 설정
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        contentView.addSubview(label)
        label.backgroundColor = .systemGray
        
        contentView.addSubview(button)
        button.backgroundColor = .green
    }
    
    func setConstraints() {
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.trailingMargin.equalTo(contentView)
        }
        
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView)
            make.trailing.equalTo(button.snp.leading).inset(8)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
