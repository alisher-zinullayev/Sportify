//
//  CollectionViewCell.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CollectionViewCell.self)

    var pageNumber: Int = 0
    var results: [ResultInCompetition]?
    var last_fights: [StudentLastFights]?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.register(LastFightsTableViewCell.self, forCellReuseIdentifier: LastFightsTableViewCell.identifier)
        tableView.register(FightResultsTableViewCell.self, forCellReuseIdentifier: FightResultsTableViewCell.identifier)
        return tableView
    }()
    
    private func setupUI() {
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if pageNumber == 0 {
            return last_fights?.count ?? 10
        } else {
            return results?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if pageNumber == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LastFightsTableViewCell.identifier, for: indexPath) as? LastFightsTableViewCell else {
                return UITableViewCell()
            }
//            print(last_fights)
//            if let results = results, indexPath.row < results.count {
//                cell.setValues(results: results[indexPath.row])
//            }
//            return cell
//            if !last_fights.isEmpty, indexPath.row < last_fights.count {
//                let studentLastFight = last_fights[indexPath.row]
//                print(last_fights[indexPath.row].games.count)
//                print(".............")
//                print(studentLastFight.competition)
//            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FightResultsTableViewCell.identifier, for: indexPath) as? FightResultsTableViewCell else {
                return UITableViewCell()
            }
            print("......................")
            print(results)
            print(last_fights)
            print("......................")
            if let results = results, indexPath.row < results.count {
                cell.setValues(results: results[indexPath.row])
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if pageNumber == 1 {
            return 80
        }
        return 60
    }
}
