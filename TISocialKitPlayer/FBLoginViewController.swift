//
//  FBLoginViewController.swift
//  TISocialKitPlayer
//
//  Created by 房懷安 on 2020/6/2.
//  Copyright © 2020 房懷安. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SDWebImage

class FBLoginViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var loginButtonContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
        loginButton.center = loginButtonContainer.center
        loginButton.frame = loginButtonContainer.bounds
        loginButtonContainer.addSubview(loginButton)
        
        loginButton.permissions = ["public_profile", "email"]
        
        if let token = AccessToken.current, !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            
            Profile.loadCurrentProfile { (profile, error) in
                if let profile = profile {
                    print(profile.name!)
                    
                    self.profileNameLabel.text = profile.name!
                    
                    
                    let imageURL : URL = profile.imageURL(forMode: .square, size: CGSize(width: 300, height: 300))!
                    print(imageURL)
                    
                    self.profileImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "fbplaceholder"))
                    
                }
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
