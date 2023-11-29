//
//  FightResultsTableViewCell.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import UIKit

class FightResultsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: FightResultsTableViewCell.self)
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
//        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tournamentName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "IX республикалық турнир"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let place: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "10-орын"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
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
        containerView.addSubview(tournamentName)
        containerView.addSubview(place)
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        tournamentName.snp.makeConstraints { make in
            make.leading.equalTo(containerView).offset(16)
            make.centerY.equalTo(containerView)
        }
        
        place.snp.makeConstraints { make in
            make.trailing.equalTo(containerView).offset(-16)
            make.centerY.equalTo(containerView)
        }
    }
    
    func setValues(results: ResultInCompetition) {
        tournamentName.text = results.competition.name
        place.text = String(results.place)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
