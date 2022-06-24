//
//  JXBannerBaseCell.swift
//  JXBanner_Example
//
//  Created by Code_JX on 2019/5/18.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

open class JXBannerBaseCell: UICollectionViewCell {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        jx_addSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        jx_addSubviews()
    }
    
    open func jx_addSubviews() {
        contentView.addSubview(textField)
        textField.subviews.first!.addSubview(imageView)
    }
    
    // MARK:- Lazy loading Cell subView
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = textField.bounds
        imageView.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]
        return imageView
    }()

    public lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.isUserInteractionEnabled = false
        textfield.isSecureTextEntry = true
        DispatchQueue.main.async {
            textfield.frame = self.contentView.bounds
            textfield.autoresizingMask = [
                .flexibleWidth,
                .flexibleHeight
            ]
        }
        return textfield
    }()
}
