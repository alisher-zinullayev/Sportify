//
//  CustomCoachInfoView.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import UIKit

class CustomCoachInfoView: UIView {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()

    private let first_name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Нұрдаулет"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let second_name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Өтегенов"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        return label
    }()
    
    private let coachLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Тренер"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private let club: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Клуб"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private let givenClub: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Хамза"
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let clubImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "yandex_icon")
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let coachImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "yandex_icon")
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        addSubview(containerView)
        containerView.addSubview(first_name)
        containerView.addSubview(second_name)
        containerView.addSubview(coachLabel)
        containerView.addSubview(club)
        containerView.addSubview(givenClub)
        containerView.addSubview(clubImage)
        containerView.addSubview(coachImage)

        containerView.snp.makeConstraints { maker in
            maker.top.bottom.leading.trailing.equalToSuperview()
        }
        
        first_name.snp.makeConstraints { maker in
            maker.top.equalTo(containerView.snp.top).offset(32)
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        second_name.snp.makeConstraints { maker in
            maker.top.equalTo(first_name.snp.bottom).offset(0) // 0
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        coachLabel.snp.makeConstraints { maker in
            maker.top.equalTo(second_name.snp.bottom).offset(8)
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        coachImage.snp.makeConstraints { maker in
            maker.centerY.centerX.equalToSuperview()
            maker.height.width.equalTo(100)
        }
        
        givenClub.snp.makeConstraints { maker in
            maker.bottom.equalTo(containerView.snp.bottom).offset(-50) // 0
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        club.snp.makeConstraints { maker in
            maker.bottom.equalTo(givenClub.snp.top).offset(0) // 0
            maker.leading.equalTo(containerView.snp.leading).offset(16)
//            maker.width.height.equalTo(30)
        }
        
        clubImage.snp.makeConstraints { maker in
            maker.bottom.equalTo(givenClub.snp.bottom)//.offset(8) // 0
            maker.leading.equalTo(givenClub.snp.trailing).offset(8)
            maker.width.height.equalTo(30)
        }
        
    }
    
    func setupValues(for coach: CoachInfo, image: UIImage) {
        first_name.text = coach.first_name
        second_name.text = coach.last_name
        givenClub.text = coach.club.name
        Task {
            do {
                if let image = try await DefaultStockImageLoad().fetchImage(urlString: coach.image ?? "") {
                    coachImage.image = image
                }
            } catch {
                print("error fetching image: \(error)")
            }
            
        }

        Task {
            do {
                if let image = try await DefaultStockImageLoad().fetchImage(urlString: coach.club.logo ?? "") {
                    clubImage.image = image
                }
            } catch {
                print("error fetching image: \(error)")
            }
        }
//
//        Task {
//            do {
//                if let image = try await DefaultStockImageLoad().fetchImage(urlString: student.coach.image ?? "") {
//                    coachImage.image = image
//                }
//            } catch {
//                print("error fetching image: \(error)")
//            }
//        }
//        if student.is_republic_winner {
//            championLabel.text = "Champion"
//        } else {
//            championLabel.text = ""
//        }
    }
}
