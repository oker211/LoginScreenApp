//
//  AutorizationScreenViewController.swift
//  LoginScreen
//
//  Created by Филипп Слабодецкий on 09.02.2021.
//

import UIKit

class AutorizationScreenViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private let user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let startVC = tabBarController.viewControllers?.first as? StartWindowViewController else {return}
        
        guard let tabBarController2 = segue.destination as? UITabBarController else { return }
        guard let infofmVC = tabBarController2.viewControllers?.last as? InformationViewController else {return}
        
        startVC.user = user
        infofmVC.user = user
    }

    // MARK: - IB Action
    
    @IBAction func logInButton() {
        guard
            userNameTextField.text == user.login,
            passwordTextField.text == user.password
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordTextField)
            return
        }
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func logOutButton(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotLoginButton() {
        showAlert(title: "Oops!", message: "Your name is \(user.login) 😉")
        }
    
    @IBAction func forgotPassword() {
        showAlert(title: "Oops!", message: "Your password is \(user.password) 😉")
    }
    
    // MARK:- Close Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }

}
   
    // MARK: - Extension

// MARK: - Alert Controller
extension AutorizationScreenViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Text Field Delegate
extension AutorizationScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButton()
        }
        return true
    }
}
        

