//
//  LoginViewController.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 08/08/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterProtocol?
    @IBOutlet weak var contentViewLogin: UIView!
    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter?.viewDidLoad()
    }

    // MARK: - publics
    // Add public functions here

    // MARK: - IBActions
    // Add IBActions in this area
    @IBAction func buttonLoginAction(_ sender: Any) {
        presenter?.navigateToMain()
    }
    
    // MARK: - Privates
    private func setupViews() {
        // TODO: Add setting up views here
        [textUserName, textPassword].forEach ({ $0?.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)})
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        switch textField {
        case textUserName:
            if textField.text?.count == 1 {
                if textField.text?.first == " " {
                    textField.text = ""
                    break
                }
            }
            guard textUserName.text == "" else {
                buttonLogin.isEnabled = false
                buttonLogin.alpha = 0.5
                break
            }
        case textPassword:
            if textField.text?.count == 1 {
                if textField.text?.first == " " {
                    textField.text = ""
                    break
                }
            }
            guard textPassword.text == "" else {
                buttonLogin.isEnabled = false
                buttonLogin.alpha = 0.5
                break
            }
        default:
            break
        }
        
        buttonLogin.isEnabled = true
        buttonLogin.alpha = 1
    }
}

// MARK: - View Protocol
extension LoginViewController: LoginViewProtocol {
    func populateData() {
        // TODO: Populate data
    }

    func showProgressDialog(show: Bool) {
        DispatchQueue.main.async {
            
        }
    }

    func showAlertMessage(title: String, message: String) {
        DispatchQueue.main.async {
            
        }
    }

    func showErrorMessage(message: String) {
        DispatchQueue.main.async {
            
        }
    }
}
