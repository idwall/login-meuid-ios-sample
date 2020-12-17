//
//  SuccessViewController.swift
//  SampleLoginMeuID
//
//  Created by Paulo Rosa on 08/12/20.
//  Copyright © 2020 Idwall. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
   
    // MARK: - Outlets
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var codeVerifierLabel: UILabel!
    
    // MARK: - Properties
    let codeString = "code"
    let codeVerifierString = "code_verifier"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Public Functions
    func setParametersFromURL(url: URL) {
        if let codeParam = getQueryStringParameter(url: url.absoluteString, param: codeString),
            let codeVerifierParam = getQueryStringParameter(url: url.absoluteString, param: codeVerifierString) {
            codeLabel.text = "code: \(codeParam)"
            codeVerifierLabel.text = "code_verifier: \(codeVerifierParam)"
        }
    }
    
    // MARK: - Private Functions
    private func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
}
