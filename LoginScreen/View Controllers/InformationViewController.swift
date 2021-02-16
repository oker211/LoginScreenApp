//
//  InformationViewController.swift
//  LoginScreen
//
//  Created by Филипп Слабодецкий on 11.02.2021.
//

import UIKit

class InformationViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var trashImage: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    // MARK: - Public properties
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullNameLabel.text = user.person.fullname
    }

}
