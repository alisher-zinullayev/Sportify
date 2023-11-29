//
//  TournamentViewController.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 30.11.2023.
//

import UIKit

class TournamentViewController: UIViewController {

    private let ageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TournamentCollectionViewCell.self, forCellWithReuseIdentifier: TournamentCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let weightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TournamentCollectionViewCell.self, forCellWithReuseIdentifier: TournamentCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        ageCollectionView.delegate = self
        ageCollectionView.dataSource = self
        weightCollectionView.delegate = self
        weightCollectionView.dataSource = self
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(ageCollectionView)
        view.addSubview(weightCollectionView)
        
        ageCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        weightCollectionView.snp.makeConstraints { make in
            make.top.equalTo(ageCollectionView.snp.bottom).offset(0)
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
}

extension TournamentViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == ageCollectionView {
            return 10
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TournamentCollectionViewCell.identifier, for: indexPath) as? TournamentCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
