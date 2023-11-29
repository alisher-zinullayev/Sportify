//
//  StudentsTableViewCell.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import UIKit

final class StudentsTableViewCell: UITableViewCell {

    static let identifier = String(describing: StudentsTableViewCell.self)
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Alisher"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let surname: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Zinullayev"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Master Sport"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let studentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "yandex_icon")
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let separatorLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .white
        return line
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
//        setupValues()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupValues(for student: Student) {
        name.text = ("\(student.first_name) ")
        surname.text = student.last_name
        Task {
            do {
                if let image = try await DefaultStockImageLoad().fetchImage(urlString: student.image ?? "") {
                    studentImage.image = image
                }
            } catch {
                print("error fetching image: \(error)")
            }
        }
//        title.text = student
//        first_name.text = coach.first_name
//        second_name.text = coach.last_name
//        givenClub.text = coach.club.name
//        Task {
//            do {
//                if let image = try await DefaultStockImageLoad().fetchImage(urlString: coach.image ?? "") {
//                    coachImage.image = image
//                }
//            } catch {
//                print("error fetching image: \(error)")
//            }
//
//        }
//
//        Task {
//            do {
//                if let image = try await DefaultStockImageLoad().fetchImage(urlString: coach.club.logo ?? "") {
//                    clubImage.image = image
//                }
//            } catch {
//                print("error fetching image: \(error)")
//            }
//        }
    }
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(studentImage)
        containerView.addSubview(name)
        containerView.addSubview(surname)
        containerView.addSubview(title)
        containerView.addSubview(separatorLine)
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        studentImage.snp.makeConstraints { maker in
            maker.left.equalToSuperview().offset(16)
            maker.height.width.equalTo(30)
            maker.centerY.equalToSuperview()
        }
        
        name.snp.makeConstraints { maker in
            maker.left.equalTo(studentImage.snp.right).offset(16)
            maker.centerY.equalToSuperview()
        }
        
        surname.snp.makeConstraints { maker in
            maker.left.equalTo(name.snp.right).offset(0)
            maker.centerY.equalToSuperview()
        }
        
        title.snp.makeConstraints { maker in
            maker.right.equalToSuperview().offset(-8)
            maker.centerY.equalToSuperview()
        }
        
//        separatorLine.snp.makeConstraints { maker in
//            maker.top.equalTo(title.snp.bottom).offset(7)
//            maker.height.equalTo(1)
//            maker.left.equalTo(contentView).offset(0)
//            maker.right.equalTo(contentView).offset(0)
//        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        contentView.layer.cornerRadius = 0
//        containerView.layer.cornerRadius = 0
    }
    
}
