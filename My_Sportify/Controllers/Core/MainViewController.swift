//
//  ViewController.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 25.11.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    private var tournaments: [TournamentDetail] = []
    
    private var regions: [Region] = []//["Астана қаласы", "Ақмола облысы", "Атырау облысы", "Алматы облысы", "Батыс Қазақстан облысы", "Маңғыстау облысы"]
    
    var isRepublic: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        setupUI()
        setDelegates()
        
        let regionJson: [Region] = DefaultRegionsDataSource().listRegions()
        regions = regionJson
        
        Task { [weak self] in
            do {
                let values = try await DefaultListOfTournaments.shared.fetchTournaments()
                self?.tournaments = values
                tournamentsTableView.reloadData()
            } catch {
                print("error fetching tournaments: \(error)")
            }
        }
    }

    private let republicButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Республикалық турнирлер", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(republicButtonTapped), for: .touchUpInside)
        return button
    }()

    private let regionalButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Облыстық турнирлер", for: .normal)
        button.backgroundColor = .red // UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(regionalButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func republicButtonTapped() {
        isRepublic = true
        tournamentsTableView.reloadData()
    }
    
    @objc func regionalButtonTapped() {
        isRepublic = false
        tournamentsTableView.reloadData()
    }
    
    private let tournamentsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        return tableView
    }()

    private func setupUI() {
        
        view.addSubview(republicButton)
        view.addSubview(regionalButton)
        view.addSubview(tournamentsTableView)
        
        republicButton.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            maker.leading.equalToSuperview().offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(30)
        }
        
        regionalButton.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            maker.leading.equalTo(republicButton.snp.trailing).offset(10)
            maker.trailing.equalToSuperview().inset(20)
            maker.width.equalTo(republicButton.snp.width)
            maker.height.equalTo(republicButton.snp.height)
        }
        
        tournamentsTableView.snp.makeConstraints { maker in
            maker.top.equalTo(republicButton.snp.bottom).offset(20)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        view.layoutIfNeeded()
        
    }
    
    private func setDelegates() {
        tournamentsTableView.delegate = self
        tournamentsTableView.dataSource = self
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isRepublic {
            return tournaments.count
        } else {
            return regions.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        if isRepublic {
            cell.setValues(tournament: tournaments[indexPath.row].name, date: tournaments[indexPath.row].start_date, federation: tournaments[indexPath.row].federation, city: tournaments[indexPath.row].location, isMainVC: true)
        } else {
            cell.setValues(tournament: regions[indexPath.row].region, date: "", federation: "", city: "", isMainVC: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isRepublic {
            
        } else {
            navigationController?.pushViewController(RegionDetailViewController(myRegion: regions[indexPath.row]), animated: true)
        }
    }
}
