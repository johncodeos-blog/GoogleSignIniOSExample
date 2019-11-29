//
//  LoginViewController.swift
//  GoogleSignInExample
//
//  Created by John Codeos.
//  Copyright © 2019 John Codeos. All rights reserved.
//

import GoogleSignIn
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var googleLoginBtn: UIButton!
    
    var googleSignIn = GIDSignIn.sharedInstance()
    var googleId = ""
    var googleIdToken = ""
    var googleFirstName = ""
    var googleLastName = ""
    var googleEmail = ""
    var googleProfileURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.googleLoginBtn.layer.cornerRadius = 10.0
        
        // Sign out (LogOut User from Google Account)
        // self.googleSignIn?.signOut()
        
        // Disconnect (User calls this when they want to delete their account from your app)
        // self.googleSignIn?.disconnect()
    }
    
    @IBAction func googleLoginBtnAction(_ sender: UIButton) {
        self.googleAuthLogin()
    }
    
    func googleAuthLogin() {
        self.googleSignIn?.presentingViewController = self
        self.googleSignIn?.clientID = "YOUR_CLIENT_ID"
        self.googleSignIn?.delegate = self
        self.googleSignIn?.signIn()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailseg" {
            let DestView = segue.destination as! DetailsViewController
            DestView.googleId = self.googleId
            DestView.googleIDToken = self.googleIdToken
            DestView.googleFirstName = self.googleFirstName
            DestView.googleLastName = self.googleLastName
            DestView.googleEmail = self.googleEmail
            DestView.googleProfilePicURL = self.googleProfileURL
        }
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard let user = user else {
            print("Uh oh. The user cancelled the Google login.")
            return
        }
        let userId = user.userID ?? ""
        print("Google User ID: \(userId)")
        self.googleId = userId
        
        let userIdToken = user.authentication.idToken ?? ""
        print("Google ID Token: \(userIdToken)")
        self.googleIdToken = userIdToken
        
        let userFirstName = user.profile.givenName ?? ""
        print("Google User First Name: \(userFirstName)")
        self.googleFirstName = userFirstName
        
        let userLastName = user.profile.familyName ?? ""
        print("Google User Last Name: \(userLastName)")
        self.googleLastName = userLastName
        
        let userEmail = user.profile.email ?? ""
        print("Google User Email: \(userEmail)")
        self.googleEmail = userEmail
        
        let googleProfilePicURL = user.profile.imageURL(withDimension: 150)?.absoluteString ?? ""
        print("Google Profile Avatar URL: \(googleProfilePicURL)")
        self.googleProfileURL = googleProfilePicURL
        
        self.performSegue(withIdentifier: "detailseg", sender: self)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Call your backend server to delete user's info after they requested to delete their account
    }
}
