//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    //1. UIImagePickerController의 인스턴스 생성
    let picker = UIImagePickerController()
    
    let photoImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemMint
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleTextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "Input Title"
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 15)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //2. available - 사용 가능한 상태인가?
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("Not able to use the Gallery App. Alert to the User.")
            return
        }

        picker.delegate = self

        //3. 어떠한 타입을 띄울 것인지 설정해야 한다
        picker.sourceType = .camera // .photoLibrary

        picker.allowsEditing = true // 사진 찍고 나서 수정을 허용할 것인가?
        
        // 이런 PickerVC도 있다
//        let picker = UIFontPickerViewController() // 폰트를 선택할 수 있는 VC
//        let picker = UIColorPickerViewController() // 컬러를 선택할 수 있는 VC
        
        present(picker, animated: true) // ImagePicker 띄우기
    }
    
    func configureView() {
        
        view.backgroundColor = .white
        
        [photoImageView, titleTextField].forEach {
            view.addSubview($0)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20) // leading.equalTo(view).inset(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
    }
}

extension TextViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // 취소 버튼을 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) // 취소 버튼 시 돌아가기
        print(#function)
    }
    
    // 사진을 선택하거나 카메라 촬영 직후 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.photoImageView.image =  image
            dismiss(animated: true)
        }
        
    }
}
