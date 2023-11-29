//
//  LastFightsView.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 30.11.2023.
//

import UIKit

class LastFightsView: UIView {

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(cgColor: CGColor(red: 80/255, green: 2/255, blue: 68/255, alpha: 1))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let data: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "IX республикалық турнир"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let tournament: UILabel = {
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
        addSubview(containerView)
        containerView.addSubview(data)
        containerView.addSubview(tournament)
        containerView.snp.makeConstraints { maker in
            maker.top.left.bottom.right.equalToSuperview()
        }
        
        data.snp.makeConstraints { maker in
            maker.leading.equalTo(containerView.snp.leading).offset(16)
            maker.centerY.equalTo(containerView.snp.centerY)
        }
        
        tournament.snp.makeConstraints { maker in
            maker.leading.equalTo(data.snp.trailing).offset(16)
            maker.centerY.equalTo(containerView.snp.centerY)
        }
    }
    
    func setupValues(startTime: String, endTime: String, givenTournament: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        if let startDate = dateFormatter.date(from: startTime),
           let endDate = dateFormatter.date(from: endTime) {
            dateFormatter.dateFormat = "MM.dd"

            let formattedStartDate = dateFormatter.string(from: startDate)
            let formattedEndDate = dateFormatter.string(from: endDate)

            data.text = "\(formattedStartDate) - \(formattedEndDate)"
        } else {
            data.text = "Invalid date format"
        }
        tournament.text = givenTournament
    }
    
}
