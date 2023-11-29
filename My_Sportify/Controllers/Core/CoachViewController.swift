//
//  CoachViewController.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import UIKit

class CoachViewController: UIViewController {
    
    var coach: CoachInfo?
    var students: [Student]?
    var id: String
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewInformation: CustomCoachInfoView = {
        let view = CustomCoachInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let studentsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.register(StudentsTableViewCell.self, forCellReuseIdentifier: StudentsTableViewCell.identifier)
        return tableView
    }()
    
    private let studentsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Шәкірттер", for: .normal)
//        button.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
//        button.layer.cornerRadius = 10
        button.clipsToBounds = true
//        button.addTarget(self, action: #selector(republicButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 23.0/255.0, green: 12.0/255.0, blue: 54.0/255.0, alpha: 1)
        setupUI()
        studentsTableView.delegate = self
        studentsTableView.dataSource = self
        Task { [weak self] in
            do {
                let values = try await DefaultCoachInformation.shared.fetchCoachInformation(for: id)
                self?.coach = values
                self?.students = values.students
            } catch {
                print("error fetching coach: \(error)")
            }
            
            Task {
                do {
                    if let image = try await DefaultStockImageLoad().fetchImage(urlString: coach?.image ?? "") {
                        print("success")
                        
                            // DO NOT MAKE COACH FORCE UNWRAP
                            
                        viewInformation.setupValues(for: coach!, image: image)
                    }
                } catch {
                    print("error fetching image: \(error)")
                }
            }
            studentsTableView.reloadData()
        }
    }
    
    private func setupUI() {
        view.addSubview(viewInformation)
        view.addSubview(studentsButton)
        view.addSubview(studentsTableView)
        
        viewInformation.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(300)
        }
        
        studentsButton.snp.makeConstraints { maker in
            maker.top.equalTo(viewInformation.snp.bottom).offset(8)
            maker.leading.equalToSuperview().offset(16)
//            maker.width.equalTo(150)
            maker.height.equalTo(30)
        }
        
        studentsTableView.snp.makeConstraints { make in
            make.top.equalTo(studentsButton.snp.bottom).offset(8)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
}

extension CoachViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StudentsTableViewCell.identifier, for: indexPath) as? StudentsTableViewCell else {
            return UITableViewCell()
        }
        cell.setupValues(for: students?[indexPath.row] ?? Student(id: "", first_name: "", last_name: "", image: ""))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(StudentProfileViewController(id: students?[indexPath.row].id ?? ""), animated: true)
    }
}

/*
 
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
 
 */
