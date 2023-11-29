//
//  RegionDetailViewController.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 25.11.2023.
//

import UIKit

final class RegionDetailViewController: UIViewController {

    var myRegion: Region
    
    private var tournaments: [TournamentDetail] = []
    
    init(myRegion: Region) {
        self.myRegion = myRegion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var last_fights: [StudentLastFights] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setDelegates()
        setupNavigationBar()
        
//        let customBackButton = UIBarButtonItem(title: "Облыстық турнирлер", style: .plain, target: self, action: #selector(self.backButtonTapped))
//        customBackButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
//        customBackButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .highlighted)
//        self.navigationItem.leftBarButtonItem = customBackButton
        
        view.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        
//        Task { [weak self] in
//            guard let self = self else {return}
//            do {
//                let values = try await DefaultLastFightsOfStudent.shared.fetchLastFights(for: "564a7c35-8a2c-4ca3-974b-311c28a01075")
//                self.last_fights = values
//                print("........................................................................")
//                print(last_fights)
//                print("........................................................................")
//            } catch {
//                print("error fetching last fights information for a given student \(error)")
//            }
//        }
//
        Task {
            do {
                if let image = try await DefaultStockImageLoad().fetchImage(urlString: "http://77.243.80.52:8000/media/regions/\(myRegion.slug).png") {
                    DispatchQueue.main.async {
                        self.picture.image = image
                    }
                }
            } catch {
                print("error fetching image: \(error)")
            }
        }
        
        Task { [weak self] in
            do {
                let values = try await DefaultListOfTournamentsForRegion.shared.fetchTournamentsForRegion(for: myRegion.slug)
                self?.tournaments = values
                tournamentsTableView.reloadData()
            } catch {
                print("error fetching tournaments: \(error)")
            }
        }
    }
    
    private let customBackButton: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private let backButtonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "arrowshape.backward.fill")
        imageView.tintColor = .tintColor
        return imageView
    }()

    private let backButtonTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Облыстық турнирлер"
        label.textColor = .tintColor
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private func setupBackButton() {
        view.addSubview(customBackButton)
        customBackButton.addSubview(backButtonImage)
        customBackButton.addSubview(backButtonTitle)
        
        backButtonImage.snp.makeConstraints { maker in
            maker.centerY.equalTo(customBackButton)
            maker.leading.equalTo(customBackButton).offset(0)
        }
        
        backButtonTitle.snp.makeConstraints { maker in
            maker.centerY.equalTo(customBackButton)
            maker.leading.equalTo(backButtonImage.snp.trailing).offset(5)
        }
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        customBackButton.addSubview(button)
        
        button.snp.makeConstraints { maker in
            maker.edges.equalTo(customBackButton)
        }
        
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        setupBackButton()
        let customBackBarButtonItem = UIBarButtonItem(customView: customBackButton)
        self.navigationItem.leftBarButtonItem = customBackBarButtonItem
    }
    
    private let regionImageView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
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
        label.text = "Ohio"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let tournamentsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        return tableView
    }()
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    

    private func setupUI() {
        
        view.addSubview(regionImageView)
        view.addSubview(tournamentsTableView)
        regionImageView.addSubview(picture)
        regionImageView.addSubview(city)
        
        regionImageView.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(300)
        }
        
        picture.snp.makeConstraints { maker in
            maker.centerX.equalTo(regionImageView.snp.centerX)
            maker.centerY.equalTo(regionImageView.snp.centerY)
            maker.width.equalTo(100)
        }
        
        city.snp.makeConstraints { maker in
            maker.top.equalTo(picture.snp.bottom).offset(-20)
            maker.centerX.equalTo(regionImageView.snp.centerX)
        }
        
        city.text = myRegion.region
        
        tournamentsTableView.snp.makeConstraints { maker in
            maker.top.equalTo(regionImageView.snp.bottom)
            maker.bottom.equalToSuperview()
            maker.left.right.equalToSuperview()
        }
        
        view.layoutIfNeeded()
        
    }
    
    private func setDelegates() {
        tournamentsTableView.delegate = self
        tournamentsTableView.dataSource = self
    }
    
}

extension RegionDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tournaments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.setValues(
            tournament: tournaments[indexPath.row].name,
            date: tournaments[indexPath.row].start_date,
            federation: tournaments[indexPath.row].federation,
            city: tournaments[indexPath.row].location,
            isMainVC: false
        )
        return cell
    }
}
