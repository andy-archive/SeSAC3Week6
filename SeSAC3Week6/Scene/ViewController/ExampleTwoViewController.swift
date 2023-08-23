//
//  ExampleTwoViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/22.
//

import UIKit
import SnapKit

class ExampleTwoViewController: UIViewController {

    let xImageView = {
        let image = UIImage(systemName: "multiply.circle")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        return imageView
    }()

    let starImageView = {
        let image = UIImage(systemName: "star.circle")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        return imageView
    }()

    let moneyImageView = {
        let image = UIImage(systemName: "dollarsign.circle")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        return imageView
    }()

    let presentImageView = {
        let image = UIImage(systemName: "shippingbox.circle")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        return imageView
    }()

    let profileBackView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        return view
    }()

    let profileImageView = {
        let imageView = UIImageView()
        imageView.layer.backgroundColor = UIColor.orange.cgColor
        imageView.layer.cornerRadius = 30
        return imageView
    }()

    let profileNameLabel = {
        let label = UILabel()
        label.text = "Andy"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()

    let profileStatusLabel = {
        let label = UILabel()
        label.text = "저녁에 뭐 먹지...adls;fkja;dlfskja;dlsfkja;dlsfkja;dsflkjads;lfkjads;flkjasd;lfkjas;dlfkja;dlsfkja;lsdkj"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()

    let bottomBackView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()

    let profileChangeBackView = {
        let imageView = UIImageView()
        imageView.layer.backgroundColor = UIColor.orange.cgColor
        return imageView
    }()

    let profileChangeImageView = {
        let image = UIImage(systemName: "pencil.line")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        return imageView
    }()

    let profileChangeLabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()

    let myChatBackView = {
        let imageView = UIImageView()
        imageView.layer.backgroundColor = UIColor.orange.cgColor
        return imageView
    }()

    let myChatImageView = {
        let image = UIImage(systemName: "bubble.right.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        return imageView
    }()

    let myChatLabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()

    let myStoryBackView = {
        let imageView = UIImageView()
        imageView.layer.backgroundColor = UIColor.orange.cgColor
        return imageView
    }()

    let myStoryImageView = {
        let image = UIImage(systemName: "bubble.right.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        return imageView
    }()

    let myStoryLabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    func configureUI() {
        view.backgroundColor = .gray

        let padding = 40
        let buttonSize = 30

        [xImageView, starImageView, moneyImageView, presentImageView, bottomBackView, profileBackView].forEach { view.addSubview($0) }

        xImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.leading.equalTo(10)
            make.size.equalTo(buttonSize)
        }

        starImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(-10)
            make.size.equalTo(buttonSize)
        }

        moneyImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(starImageView).offset(padding * -1)
            make.size.equalTo(buttonSize)
        }

        presentImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(moneyImageView).offset(padding * -1)
            make.size.equalTo(buttonSize)
        }

        bottomBackView.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(120)
        }

        profileBackView.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(bottomBackView.snp.top)
            make.height.equalTo(150)
        }

        profileBackView.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(profileBackView)
            make.size.equalTo(100)
            make.centerX.equalTo(view)
        }

        profileBackView.addSubview(profileNameLabel)
        profileNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(5)
            make.centerX.equalTo(view)
        }

        profileBackView.addSubview(profileStatusLabel)
        profileStatusLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(150)
            make.top.equalTo(profileNameLabel.snp.bottom).offset(5)
            make.bottom.greaterThanOrEqualTo(profileBackView.snp.bottom)
            make.centerX.equalTo(view)
        }

        // MARK: Bottom View
        bottomBackView.addSubview(profileChangeBackView)
        profileChangeBackView.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.centerX.centerY.equalTo(bottomBackView)
        }

        profileChangeBackView.addSubview(profileChangeImageView)
        profileChangeImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.top.equalTo(profileChangeBackView.snp.top)
            make.centerX.equalTo(profileChangeBackView)
        }

        profileChangeBackView.addSubview(profileChangeLabel)
        profileChangeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(profileChangeBackView.snp.bottom)
            make.centerX.equalTo(profileChangeBackView)
        }

        bottomBackView.addSubview(myChatBackView)
        myChatBackView.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.centerY.equalTo(bottomBackView)
        }

        myChatBackView.addSubview(myChatImageView)
        myChatImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.top.equalTo(myChatBackView.snp.top)
            make.centerX.equalTo(myChatBackView)
        }

        myChatBackView.addSubview(myChatLabel)
        myChatLabel.snp.makeConstraints { make in
            make.bottom.equalTo(myChatBackView.snp.bottom)
            make.centerX.equalTo(myChatBackView)
        }

        bottomBackView.addSubview(myStoryBackView)
        myStoryBackView.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-60)
            make.centerY.equalTo(bottomBackView)
        }

        myStoryBackView.addSubview(myStoryImageView)
        myStoryImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.top.equalTo(myStoryBackView.snp.top)
            make.centerX.equalTo(myStoryBackView)
        }

        myStoryBackView.addSubview(myStoryLabel)
        myStoryLabel.snp.makeConstraints { make in
            make.bottom.equalTo(myStoryBackView.snp.bottom)
            make.centerX.equalTo(myStoryBackView)
        }
    }
}
