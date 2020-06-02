//
//  ViewController.swift
//  TISocialKitPlayer
//
//  Created by 房懷安 on 2020/6/2.
//  Copyright © 2020 房懷安. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let fetures : [String] = ["Facebook Share", "Facebook Login", "Weibo Share"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = self.fetures[ indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FeatureViewCell.identifier ) as! FeatureViewCell
        
        cell.updateContent(title: name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "moveToFacebookShare", sender: self)
            break
        case 1:
            self.performSegue(withIdentifier: "moveToFacebookLogin", sender: self)
            break
        case 2:
            self.performSegue(withIdentifier: "moveToWeiboShare", sender: self)
            break
        case 3:
                
            
            
            break
        default:
            
            break
        }
        
    }
    
}

