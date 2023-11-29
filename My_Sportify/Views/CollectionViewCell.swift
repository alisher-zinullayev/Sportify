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
    var results: [ResultInCompetition]? {
        didSet {
            tableView.reloadData()
        }
    }
    var last_fights: [StudentLastFights]? {
        didSet {
            tableView.reloadData()
        }
    }
    
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
            if let lastFights = last_fights, lastFights.indices.contains(section) {
                return lastFights[section].games.count
            } else {
                return 0
            }
        } else {
            return results?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if pageNumber == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LastFightsTableViewCell.identifier, for: indexPath) as? LastFightsTableViewCell else {
                return UITableViewCell()
            }
            if let lastFights = last_fights, lastFights.indices.contains(indexPath.section) {
                let games = lastFights[indexPath.section].games
                if games.indices.contains(indexPath.row) {
                    let game = games[indexPath.row]
                    cell.setValues(lastFight: game)
                }
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FightResultsTableViewCell.identifier, for: indexPath) as? FightResultsTableViewCell else {
                return UITableViewCell()
            }
            if let results = results, indexPath.row < results.count {
                cell.setValues(results: results[indexPath.row], index: indexPath.row)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if pageNumber == 0 {
            return results?.count ?? 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if pageNumber == 0 {
            let headerView = LastFightsView()
            if let lastFights = last_fights, lastFights.indices.contains(section) {
                let competition = lastFights[section].competition
                headerView.setupValues(startTime: competition.start_date, endTime: competition.end_date, givenTournament: competition.name)
            } else {
                headerView.setupValues(startTime: "", endTime: "", givenTournament: "")
            }
            tableView.sectionHeaderTopPadding = 0
            return headerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if pageNumber == 0 {
            return 50
        } else {
            tableView.sectionHeaderTopPadding = 0
            return 0
        }
    }
}
