//
//  ViewController.swift
//  SampleLoginMeuID
//
//  Created by Idwall on 26/11/20.
//  Copyright © 2020 Idwall. All rights reserved.
//

import UIKit

enum ButtonStyle {
    case Purple
    case WhiteWithoutBorder
    case WhiteWithBorder
}

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Properties
    let aplicationID = "c14eb1bd-fda5-4d1a-a7d7-65ccb4b29467"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLoginButton(style: .Purple)
    }
    
    // MARK: - Public Functions
    func setupLoginButton(style: ButtonStyle) {
        switch style {
        case .Purple:
            loginButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            loginButton.setTitle("Login com MeuID", for: .normal)
            loginButton.layer.cornerRadius = 8.0
            loginButton.backgroundColor = #colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1)
            let logo = UIImage(named: "logo_meuid_white")
            loginButton.setImage(logo , for: .normal)
            loginButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 20)
        case .WhiteWithoutBorder:
            loginButton.tintColor = #colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1)
            loginButton.setTitleColor(#colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1), for: .normal)
            loginButton.setTitle("Login com MeuID", for: .normal)
            loginButton.layer.cornerRadius = 8.0
            loginButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            let logo = UIImage(named: "logo_meuid_purple")
            loginButton.setImage(logo , for: .normal)
            loginButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 20)
        case .WhiteWithBorder:
            loginButton.tintColor = #colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1)
            loginButton.setTitleColor(#colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1), for: .normal)
            loginButton.setTitle("Login com MeuID", for: .normal)
            loginButton.layer.cornerRadius = 8.0
            loginButton.layer.borderColor = #colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1)
            loginButton.layer.borderWidth = 1.0
            loginButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            let logo = UIImage(named: "logo_meuid_purple")
            loginButton.setImage(logo , for: .normal)
            loginButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 20)
        }
    }
    
    func getDeepLink() -> String {
        return "meuid://meuid?action=MEUID_AUTHENTICATION&applicationId=\(aplicationID)&parameters=eyJvcmlnaW4iOiJNT0JJTEVfQVBQIn0%3D"
    }
    
    // MARK: - Actions
    @IBAction func didTapLogin(_ sender: UIButton) {
        if let url = URL(string: getDeepLink()) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
