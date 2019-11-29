//
//  DetailsViewController.swift
//  GoogleSignInExample
//
//  Created by John Codeos.
//  Copyright © 2019 John Codeos. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var googleIdLabel: UILabel!
    @IBOutlet var googleFirstNameLabel: UILabel!
    @IBOutlet var googleLastNameLabel: UILabel!
    @IBOutlet var googleEmailLabel: UILabel!
    @IBOutlet var googleProfilePicUrlLabel: UILabel!
    @IBOutlet var googleIDTokenLabel: UILabel!

    var googleId = ""
    var googleFirstName = ""
    var googleLastName = ""
    var googleEmail = ""
    var googleProfilePicURL = ""
    var googleIDToken = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        googleIdLabel.text = googleId
        googleFirstNameLabel.text = googleFirstName
        googleLastNameLabel.text = googleLastName
        googleEmailLabel.text = googleEmail
        googleProfilePicUrlLabel.text = googleProfilePicURL
        googleIDTokenLabel.text = googleIDToken
    }
}
