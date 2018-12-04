//
//  UserProfileHeader.swift
//  instagramFirebase
//
//  Created by Seungjun Lim on 01/12/2018.
//  Copyright © 2018 Seungjun Lim. All rights reserved.
//

import UIKit
import Firebase

class UserProfileHeader: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
       let iv = UIImageView()
        iv.backgroundColor = .red
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 80, height: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        profileImageView.clipsToBounds = true
        guard let profileImageUrl = user?.profileImageUrl else { return }
        
        guard let url = URL(string: user?.profileImageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // check for the errer, then construct the image using data
            if let err = err {
                print("Failed to fatch profile image:", err)
                return
            }
            
            guard let data = data else { return }
            let image = UIImage(data: data)
            
            //need to get back onto the main UI tharead
            DispatchQueue.main.async {
                self.profileImageView.image = image
            }
            
            }.resume()
    }
    
    var user: User? {
        didSet {
            setupProfileImage()
        }
    }
    
    fileprivate func setupProfileImage() {
        guard let profileImageUrl = user?.profileImageUrl else { return }
        
        guard let url = URL(string: profileImageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // check for the errer, then construct the image using data
            if let err = err {
                print("Failed to fatch profile image:", err)
                return
            }
            
            guard let data = data else { return }
            let image = UIImage(data: data)
            
            //need to get back onto the main UI tharead
            DispatchQueue.main.async {
                self.profileImageView.image = image
            }
            
            }.resume()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

