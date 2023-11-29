//
//  ClubViewController.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import UIKit

class ClubViewController: UIViewController {

    var id: String
    var students: [Student]?
    var coaches: [Coach]?
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
