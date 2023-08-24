//
//  UIImage+.swift
//  SeSAC3Week6
//
//  Created by Taekwon Lee on 2023/08/24.
//

import UIKit

extension UIImage {
    func designCircleThumbnail() -> UIImage {
        let spacing: CGFloat = 12
        let screenWidth = (UIScreen.main.bounds.size.width - (spacing * 4)) / 3
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: screenWidth, height: screenWidth))
        let renderedimage = renderer.image { context in
            context.cgContext.setFillColor(UIColor.systemBrown.cgColor)
            context.cgContext.setStrokeColor(UIColor.cyan.cgColor)
            context.cgContext.setLineWidth(5)
            
            let rectangle = CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth)
            context.cgContext.addEllipse(in: rectangle)
            context.cgContext.drawPath(using: .fillStroke)
        }
        return renderedimage
    }
}
