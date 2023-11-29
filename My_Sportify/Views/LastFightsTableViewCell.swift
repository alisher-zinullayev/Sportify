//
//  LastFightsTableViewCell.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import UIKit

class LastFightsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: LastFightsTableViewCell.self)
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
//        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let redCornerCity: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "IX республикалық турнир"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let blueCornerCity: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "IX республикалық турнир"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let redCornerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "IX республикалық турнир"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let blueCornerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "IX республикалық турнир"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let didWinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "IX республикалық турнир"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
//    private let typeWin: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.text = "IX республикалық турнир"
//        label.textColor = UIColor.white
//        label.font = UIFont.boldSystemFont(ofSize: 10)
//        label.textAlignment = .center
//        return label
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
//        setupValues()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(redCornerCity)
        containerView.addSubview(blueCornerCity)
        containerView.addSubview(redCornerName)
        containerView.addSubview(blueCornerName)
        containerView.addSubview(didWinLabel)
//        containerView.addSubview(typeWin)
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        redCornerCity.snp.makeConstraints { make in
            make.left.equalTo(containerView.snp.left).offset(16)
            make.centerY.equalTo(containerView.snp.centerY).offset(8)
        }
        
        blueCornerCity.snp.makeConstraints { make in
            make.left.equalTo(containerView.snp.left).offset(16)
            make.centerY.equalTo(containerView.snp.centerY).offset(-8)
        }
        
        redCornerName.snp.makeConstraints { make in
            make.left.equalTo(redCornerCity.snp.right).offset(8)
            make.centerY.equalTo(containerView.snp.centerY).offset(8)
        }
        
        blueCornerName.snp.makeConstraints { make in
            make.left.equalTo(blueCornerCity.snp.right).offset(8)
            make.centerY.equalTo(containerView.snp.centerY).offset(-8)
        }
        
        didWinLabel.snp.makeConstraints { make in
            make.right.equalTo(containerView.snp.right).offset(-16)
            make.centerY.equalTo(containerView.snp.centerY)
        }
    }
    
    func setValues(lastFight: Games) {
        blueCornerName.text = ("\(lastFight.blue_corner.student_info.last_name) \(lastFight.blue_corner.student_info.first_name)")
        redCornerName.text = ("\(lastFight.red_corner.student_info.last_name) \(lastFight.red_corner.student_info.first_name)")
        blueCornerCity.text = ("(\(lastFight.blue_corner.student_info.club.location))")
        redCornerCity.text = ("(\(lastFight.red_corner.student_info.club.location))")
        didWinLabel.text = lastFight.result
        if didWinLabel.text == "Win" {
            didWinLabel.textColor = .green
        } else {
            didWinLabel.textColor = .red
        }
//        typeWin.text = "loading"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
