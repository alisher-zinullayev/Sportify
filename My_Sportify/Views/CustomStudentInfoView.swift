//
//  CustomStudentInfoView.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 26.11.2023.
//

import UIKit

class CustomStudentInfoView: UIView {

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
    
    private let championLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Чемпионат Казахстана 2022"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private let age: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Жас:"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private let givenAge: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "06.07.2019(11 жас)"
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let club: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Клуб:"
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
    
    private let coach: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Тренер:"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private let givenCoach: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Андрей Андреев"
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let coachImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "yandex_icon")
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let studentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "yandex_icon")
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Мастер спорт үміткері"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
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
        containerView.addSubview(championLabel)
        containerView.addSubview(age)
        containerView.addSubview(givenAge)
        containerView.addSubview(club)
        containerView.addSubview(givenClub)
        containerView.addSubview(clubImage)
        containerView.addSubview(coach)
        containerView.addSubview(givenCoach)
        containerView.addSubview(coachImage)
        containerView.addSubview(title)
        containerView.addSubview(studentImage)

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
        
        championLabel.snp.makeConstraints { maker in
            maker.top.equalTo(second_name.snp.bottom).offset(16) // 0
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        age.snp.makeConstraints { maker in
            maker.top.equalTo(championLabel.snp.bottom).offset(16) // 0
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        givenAge.snp.makeConstraints { maker in
            maker.top.equalTo(age.snp.bottom).offset(0) // 0
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        club.snp.makeConstraints { maker in
            maker.top.equalTo(givenAge.snp.bottom).offset(8) // 0
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        givenClub.snp.makeConstraints { maker in
            maker.top.equalTo(club.snp.bottom).offset(0) // 0
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        clubImage.snp.makeConstraints { maker in
            maker.top.equalTo(givenAge.snp.bottom).offset(8) // 0
            maker.leading.equalTo(givenClub.snp.trailing).offset(8)
            maker.width.height.equalTo(30)
        }
        
        coach.snp.makeConstraints { maker in
            maker.top.equalTo(givenClub.snp.bottom).offset(8) // 0
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        givenCoach.snp.makeConstraints { maker in
            maker.top.equalTo(coach.snp.bottom).offset(0) // 0
            maker.leading.equalTo(containerView.snp.leading).offset(16)
        }
        
        coachImage.snp.makeConstraints { maker in
            maker.top.equalTo(givenClub.snp.bottom).offset(8) // 0
            maker.leading.equalTo(givenCoach.snp.trailing).offset(8)
            maker.width.height.equalTo(30)
        }
        
        title.snp.makeConstraints { maker in
            maker.bottom.equalTo(containerView.snp.bottom).offset(-16) // 0
            maker.trailing.equalTo(containerView.snp.trailing).offset(-16) // 0
        }
        
        studentImage.snp.makeConstraints { maker in
            maker.bottom.equalTo(title.snp.top).offset(-16) // 0
            maker.trailing.equalTo(containerView.snp.trailing).offset(-32) // 0
            maker.height.width.equalTo(100)
        }
    }
    
    func setupValues(for student: StudentInfo, image: UIImage) {
        first_name.text = student.first_name
        second_name.text = student.last_name
        givenAge.text = student.date_of_birth
        givenClub.text = student.club.name
        givenCoach.text = "\(student.coach.first_name) \(student.coach.last_name)"
        title.text = student.achievement
        Task {
            do {
                if let image = try await DefaultStockImageLoad().fetchImage(urlString: student.image ?? "") {
                    studentImage.image = image
                }
            } catch {
                print("error fetching image: \(error)")
            }
        }
        
        Task {
            do {
                if let image = try await DefaultStockImageLoad().fetchImage(urlString: student.club.logo ?? "") {
                    clubImage.image = image
                }
            } catch {
                print("error fetching image: \(error)")
            }
        }
        
        Task {
            do {
                if let image = try await DefaultStockImageLoad().fetchImage(urlString: student.coach.image ?? "") {
                    coachImage.image = image
                }
            } catch {
                print("error fetching image: \(error)")
            }
        }
        if student.is_republic_winner {
            championLabel.text = "Champion"
        } else {
            championLabel.text = ""
        }
    }
    
}


