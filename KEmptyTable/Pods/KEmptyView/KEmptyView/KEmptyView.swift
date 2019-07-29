//
//  KEmptyView.swift
//  KEmptyView
//
//  Created by Kenan Atmaca on 25.07.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit

open class KEmptyView: UIView {
    
    public typealias Handle = (() -> Void)
    
    public enum ViewPositionType {
        case top
        case center
        case bottom
    }
    
    public enum ViewAnimationType {
        case alpha
        case shake
        case scale
        case bottom
        case top
    }
    
    public enum ImageSize {
        case small
        case medium
        case large
    }
    
    private var imageView:UIImageView = {
        let image = UIImageView()
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "..."
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var actionButton:UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    
    private var container = UIStackView()
    private var imageW = NSLayoutConstraint()
    private var imageH = NSLayoutConstraint()
    
    var frontViewFrame:CGRect? {
        didSet {
            self.setupLayouts()
        }
    }
    
    open var buttonAction: Handle?
    open var screenTapAction: Handle?
    open var position:ViewPositionType?
    open var animation:ViewAnimationType?
    open var emptyBackgroundColor:UIColor? = nil
    open var animationDuration:TimeInterval = 1
    open var isActionButtonShow:Bool = true
    open var isImageShow:Bool = true
    open var isTitleShow:Bool = true
    open var isTapScreen:Bool = false
    open var containerSpacing:CGFloat = 0
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleButton() {
        buttonAction?()
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isTapScreen { screenTapAction?() }
    }
    
    private func setupLayouts() {
        self.backgroundColor = emptyBackgroundColor ?? UIColor.white
        self.frame = frontViewFrame ?? CGRect()
        imageW = imageView.widthAnchor.constraint(equalToConstant: 128)
        imageW.isActive = true
        imageH = imageView.heightAnchor.constraint(equalToConstant: 128)
        imageH.isActive = true
        self.addSubview(container)
        container.axis = .vertical
        container.distribution = .equalSpacing
        container.alignment = .center
        container.spacing = containerSpacing
        container.translatesAutoresizingMaskIntoConstraints = false
        if isImageShow && imageView.image != nil { container.addArrangedSubview(imageView) }
        if isTitleShow { container.addArrangedSubview(titleLabel) }
        
        if isActionButtonShow {
            self.addSubview(actionButton)
            actionButton.widthAnchor.constraint(equalToConstant: self.frame.width / 2).isActive = true
            actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            actionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
            actionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        }
        
        if let positionType = self.position {
            switch positionType {
            case .top:
                container.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
                container.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
            case .center:
                container.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
                container.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
            case .bottom:
                container.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
                if isActionButtonShow {
                    container.bottomAnchor.constraint(equalTo: self.actionButton.topAnchor, constant: -30).isActive = true
                } else {
                    container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
                }
            }
        } else {
            container.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
            container.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        }
    }
    
    func showAnimation() {
        guard let animationType = animation else { return }
        switch animationType {
        case .alpha:
            self.alpha = 0
            UIView.animate(withDuration: animationDuration) {
                self.alpha = 1
            }
        case .bottom:
            self.transform = CGAffineTransform.init(translationX: 0, y: 1000)
            UIView.animate(withDuration: animationDuration) {
                self.transform = CGAffineTransform.identity
            }
        case .shake:
            let animation = CABasicAnimation(keyPath: "position.x")
            animation.duration = 0.1
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = self.center.x - 10
            animation.toValue = self.center.x + 10
            self.layer.add(animation, forKey: "position")
        case .top:
            self.transform = CGAffineTransform.init(translationX: 0, y: -1000)
            UIView.animate(withDuration: animationDuration) {
                self.transform = CGAffineTransform.identity
            }
        case .scale:
            self.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
            UIView.animate(withDuration: animationDuration) {
                self.transform = CGAffineTransform.identity
            }
        }
    }
    
    open func setButtonCustomize(title:String?,titleColor:UIColor,image:UIImage? = nil, backgroundColor:UIColor? = nil, font:UIFont? = nil, overlay:Bool? = false) {
        actionButton.setTitle(title, for: .normal)
        actionButton.setTitleColor(titleColor, for: .normal)
        if let img = image {
            actionButton.setImage(img, for: .normal)
        }
        actionButton.backgroundColor = backgroundColor
        if let title = actionButton.titleLabel {
            title.font = font ?? UIFont(name: "Helvatica", size: 13)
        }
        if let overlay = overlay, overlay {
            actionButton.layer.cornerRadius = 10
        }
    }
    
    open func setTitleCustomize(title:String, textColor:UIColor? = nil, font:UIFont? = nil) {
        titleLabel.text = title
        titleLabel.textColor = textColor ?? UIColor.black
        titleLabel.font = font ?? UIFont(name: "Helvatica", size: 18)
    }
    
    open func setImageCustomize(image:UIImage, overlay:Bool = false, borderColor:UIColor? = nil, borderWidth:CGFloat? = nil) {
        imageView.image = image
        if overlay {
            imageView.clipsToBounds = true
            self.imageView.layer.cornerRadius = self.imageView.frame.height / 2
        }
        if let bColor = borderColor,
            let bWidth = borderWidth {
            imageView.layer.borderWidth = bWidth
            imageView.layer.borderColor = bColor.cgColor
        }
    }
    
    open func setImageSize(size: ImageSize) {
        guard let frontSize = frontViewFrame else { return }
        switch (size) {
        case .small:
            imageW.constant = 64
            imageH.constant = 64
        case .medium:
            imageW.constant = 128
            imageH.constant = 128
        case .large:
            imageW.constant = frontSize.width * 0.5
            imageH.constant = frontSize.height * 0.5
        }
    }
    
    open func setImageSize(size: CGSize) {
        imageW.constant = size.width
        imageH.constant = size.height
    }
}
