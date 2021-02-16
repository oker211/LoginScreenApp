//
//  StartWindowViewController.swift
//  LoginScreen
//
//  Created by Филипп Слабодецкий on 10.02.2021.
//

import UIKit

class StartWindowViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // MARK: - Public properties
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        helloLabel.text = user.login
        
    }

    @IBAction func logOutBotton() {
        dismiss(animated: true)
    }
}
