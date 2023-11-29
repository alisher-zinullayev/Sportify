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
    
    
    private let viewInformation: CustomStudentInfoView = {
        let view = CustomStudentInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lastFightsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Последние бои", for: .normal)
        button.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(lastFightsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let fightResultsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Результаты в соревнованиях", for: .normal)
        button.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
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
        view.backgroundColor = .white // UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        setupUI()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        Task { [weak self] in
            guard let self = self else {return}
            do {
                let values = try await DefaultStudentInformation.shared.fetchStudentInformation(for: "a6f8ee69-053b-4936-bd29-4e44973364f3")
                self.student_info = values
                
            } catch {
                print("error fetching information for a given student \(error)")
            }

            viewInformation.setupValues(for: student_info ?? StudentInfo(id: "1", first_name: "1", last_name: "1", image: "1", club: Club(id: "", name: "", logo: "", location: ""), location: "", coach: Coach(id: "", first_name: "", last_name: "", image: ""), date_of_birth: "", achievement: "", is_republic_winner: false), image: UIImage())
        }
        
        
        Task { [weak self] in
            guard let self = self else {return}
            do {
                let values = try await DefaultStudentResults.shared.fetchStudentResults(for: "a6f8ee69-053b-4936-bd29-4e44973364f3")
                self.results_in_competitions = values
                print("results_in_competitions")
                print(results_in_competitions)
            } catch {
                print("error fetching information for a given student \(error)")
            }
        }
        
        // working
        
        Task { [weak self] in
            guard let self = self else {return}
            do {
                let values = try await DefaultLastFightsOfStudent.shared.fetchLastFights(for: "a6f8ee69-053b-4936-bd29-4e44973364f3")
                self.last_fights = values
                print("last fights")
                print(last_fights)
                
            } catch {
                print("error fetching last fights information for a given student \(error)")
            }
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
            maker.leading.equalToSuperview().offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(30)
        }
        
        fightResultsButton.snp.makeConstraints { maker in
            maker.top.equalTo(viewInformation.snp.bottom).offset(5)
            maker.leading.equalTo(lastFightsButton.snp.trailing).offset(10)
            maker.trailing.equalToSuperview().inset(20)
            maker.width.equalTo(lastFightsButton.snp.width)
            maker.height.equalTo(lastFightsButton.snp.height)
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
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
            cell.pageNumber = 0
            cell.last_fights = last_fights
            return cell
        }
        if indexPath.item == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
            cell.pageNumber = 1
            cell.results = results_in_competitions
            return cell
        }
        return UICollectionViewCell()
    }
}
