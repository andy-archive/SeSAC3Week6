//
//  UIButton+.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/26.
//

import UIKit

@available(iOS 15.0, *)
extension UIButton.Configuration {
    
    enum ButtonType {
        case favorite, info, play
        
        var image: UIImage? {
            switch self {
            case .favorite: return UIImage(systemName: "checkmark")
            case .info: return UIImage(systemName: "info.circle")
            case .play: return UIImage(systemName: "play.fill")
            }
        }
        
        var title: String {
            switch self {
            case .favorite: return "내가 찜한 컨텐츠"
            case .info: return "정보"
            case .play: return "재생"
            }
        }
    }
    
    static func designMovieButton(buttonType: ButtonType) -> UIButton.Configuration {
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.buttonSize = .mini
        configuration.baseForegroundColor = .white
        configuration.image = buttonType.image
        configuration.imagePadding = 8
        configuration.imagePlacement = .top
        configuration.title = buttonType.title
        configuration.titleAlignment = .center
        
        return configuration
    }
    
    static func designPlayButton(buttonType: ButtonType) -> UIButton.Configuration {
        
        var configuration = UIButton.Configuration.filled()
        
        configuration.baseForegroundColor = .black
        configuration.baseBackgroundColor = .white
        configuration.image = buttonType.image
        configuration.imagePadding = 8
        configuration.imagePlacement = .leading
        configuration.title = buttonType.title
        configuration.titleAlignment = .automatic
        
        return configuration
    }
}
