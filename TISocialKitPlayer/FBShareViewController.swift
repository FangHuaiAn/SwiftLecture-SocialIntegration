//
//  FBShareViewController.swift
//  TISocialKitPlayer
//
//  Created by 房懷安 on 2020/6/2.
//  Copyright © 2020 房懷安. All rights reserved.
//

import UIKit
import FacebookShare

class FBShareViewController: UIViewController {

    @IBOutlet weak var shareImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Buttons' Event
    @IBAction func shareButtonClicked(_ sender: UIButton) {
        
        
        let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .actionSheet)
        let twitterAction = UIAlertAction(title: "Twitter", style: .default, handler: nil)
        let facebookAction = UIAlertAction(title: "Facebook", style: .default) { (action) in

            let selectedImageName : String = ""

            guard let selectedImage = UIImage(named: selectedImageName) else {
                return
            }

            let photo = SharePhoto(image: selectedImage, userGenerated: false)
            let content = SharePhotoContent()
            content.photos = [ photo ]

            let shareDialog = ShareDialog(fromViewController: self, content: content, delegate: nil)
            shareDialog.show()

        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        shareMenu.addAction(twitterAction)
        shareMenu.addAction(facebookAction)
        shareMenu.addAction(cancelAction)

        self.present(shareMenu, animated: true, completion: nil)
        
        
        
    }
    
}
