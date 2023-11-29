//
//  LastFightsTableViewCell.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import UIKit

class LastFightsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: LastFightsTableViewCell.self)
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.09, green: 0.047, blue: 0.212, alpha: 1)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
