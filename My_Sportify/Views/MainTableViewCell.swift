//
//  MainTableViewCell.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 25.11.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {

    static let identifier = String(describing: MainTableViewCell.self)
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let federationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "IX республикалық турнир"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "27.06-29.06"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let tournamentNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.text = "Kekushinkai federation"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.text = "Астана қаласы"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let separatorLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .white
        return line
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 0
        containerView.layer.cornerRadius = 0
    }
    
    func setValues(tournament: String, date: String, federation: String, city: String, isMainVC: Bool) {
        tournamentNameLabel.text = tournament
        dateLabel.text = date
        federationLabel.text = federation
        cityLabel.text = city
        if isMainVC {
            containerView.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
            tournamentNameLabel.textColor = UIColor.white
            dateLabel.textColor = UIColor.white
            federationLabel.textColor = UIColor.white
            cityLabel.textColor = UIColor.white
        } else {
            containerView.backgroundColor = UIColor.white
            tournamentNameLabel.textColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
            dateLabel.textColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
            federationLabel.textColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
            cityLabel.textColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        }
    }
    private func setupUI() {
        
        contentView.addSubview(containerView)
        containerView.addSubview(federationLabel)
        containerView.addSubview(tournamentNameLabel)
        containerView.addSubview(cityLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(separatorLine)
        
        containerView.snp.makeConstraints { maker in
            maker.top.bottom.left.right.equalToSuperview()
        }

        federationLabel.snp.makeConstraints { maker in
            maker.left.equalTo(containerView.snp.left).offset(16)
            maker.top.equalTo(containerView.snp.top).offset(12)
        }
        
        dateLabel.snp.makeConstraints { maker in
            maker.right.equalTo(containerView.snp.right).offset(-8)
            maker.centerY.equalTo(containerView.snp.centerY)
        }
        
        tournamentNameLabel.snp.makeConstraints { maker in
            maker.left.equalTo(containerView.snp.left).offset(16)
            maker.top.equalTo(federationLabel.snp.bottom).offset(6)
//            maker.right.equalTo(dateLabel.snp.left).offset(-8)
        }
        
        cityLabel.snp.makeConstraints { maker in
            maker.left.equalTo(containerView.snp.left).offset(16)
            maker.top.equalTo(tournamentNameLabel.snp.bottom).offset(8)
            maker.bottom.equalTo(containerView.snp.bottom).offset(-8)
        }
        
        separatorLine.snp.makeConstraints { maker in
            maker.top.equalTo(cityLabel.snp.bottom).offset(7)
            maker.height.equalTo(1)
            maker.left.equalTo(contentView).offset(0)
            maker.right.equalTo(contentView).offset(0)
        }
    }
    
}
