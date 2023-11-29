//
//  StudentProfileViewController.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 26.11.2023.
//

import UIKit

final class StudentProfileViewController: UIViewController {

    var last_fights: [StudentLastFights] = []
    var student_info: StudentInfo?
    var results_in_competitions: [ResultInCompetition]?
    var id: String
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewInformation: CustomStudentInfoView = {
        let view = CustomStudentInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lastFightsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Последние бои", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(lastFightsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var fightResultsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Результаты в соревнованиях", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(fightResultsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func lastFightsButtonTapped() {
        let secondPageIndexPath = IndexPath(item: 0, section: 0)
        collectionView.scrollToItem(at: secondPageIndexPath, at: .left, animated: true)
    }
    
    @objc func fightResultsButtonTapped() {
        let secondPageIndexPath = IndexPath(item: 1, section: 0)
        collectionView.scrollToItem(at: secondPageIndexPath, at: .left, animated: true)
    }

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 340 - UIApplication.shared.statusBarFrame.height - 50)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        setupUI()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        Task { [weak self] in
            guard let self = self else {return}
            do {
                let values = try await DefaultStudentInformation.shared.fetchStudentInformation(for: id)
                self.student_info = values
                
            } catch {
                print("error fetching information for a given student \(error)")
            }

            viewInformation.setupValues(for: student_info ?? StudentInfo(id: "1", first_name: "1", last_name: "1", image: "1", club: Club(id: "", name: "", logo: "", location: ""), location: "", coach: Coach(id: "", first_name: "", last_name: "", image: ""), date_of_birth: "", achievement: "", is_republic_winner: false), image: UIImage())
            
            collectionView.reloadData()
        }
        
        
        Task { [weak self] in
            guard let self = self else {return}
            do {
                let values = try await DefaultStudentResults.shared.fetchStudentResults(for: id)
                self.results_in_competitions = values
            } catch {
                print("error fetching information for a given student \(error)")
            }
            collectionView.reloadData()
        }
        
        // working
        
        Task { [weak self] in
            guard let self = self else {return}
            do {
                let values = try await DefaultLastFightsOfStudent.shared.fetchLastFights(for: id)
                self.last_fights = values
            } catch {
                print("error fetching last fights information for a given student \(error)")
            }
            collectionView.reloadData()
        }
    }
    
    private func setupUI() {
        view.addSubview(viewInformation)
        view.addSubview(lastFightsButton)
        view.addSubview(fightResultsButton)
        view.addSubview(collectionView)
        
        viewInformation.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(300)
        }
        
        lastFightsButton.snp.makeConstraints { maker in
            maker.top.equalTo(viewInformation.snp.bottom).offset(5)
            maker.leading.equalToSuperview().offset(16)
        }
        
        fightResultsButton.snp.makeConstraints { maker in
            maker.top.equalTo(viewInformation.snp.bottom).offset(5)
            maker.leading.equalTo(lastFightsButton.snp.trailing).offset(8)
        }
        
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(fightResultsButton.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
    }
}

extension StudentProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
            cell.pageNumber = 0
            cell.last_fights = last_fights
            cell.results = results_in_competitions
            return cell
        }
        if indexPath.row == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
            cell.pageNumber = 1
            cell.results = results_in_competitions
            cell.last_fights = last_fights
            return cell
        }
        return UICollectionViewCell()
    }
}
