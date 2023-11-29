//
//  RegionImageView.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 25.11.2023.
//

import UIKit

class RegionImageView: UIView {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let picture: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "yandex_icon")
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let city: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "IX республикалық турнир"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        containerView.snp.makeConstraints { maker in
            maker.top.left.bottom.right.equalToSuperview()
        }
        picture.snp.makeConstraints { maker in
            maker.leading.equalTo(containerView.snp.leading).offset(30)
            maker.trailing.equalTo(containerView.snp.trailing).offset(-30)
            maker.top.bottom.equalTo(containerView).offset(30)
        }
    }
    
    func setupValues(image: UIImage, city: String) {
        picture.image = image
    }
    
}
