//
//  PhotoDetailViewController.swift
//  InstagramFeed
//
//  Created by Nguyen Nam Long on 10/14/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var photoDetail:InstaModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        self.avatarImage.setImageWith(URL(string: (self.photoDetail?.avatarURL)!)!)
        self.fullName.text = self.photoDetail?.fullName
        self.userName.text = self.photoDetail?.username
        self.captionLabel.text = self.photoDetail?.captionText
        self.statusImage.setImageWith(URL(string: (self.photoDetail?.imageStandardURL)!)!)
        self.likeCountLabel.text = String(describing: self.photoDetail.likeCount)
        if let location = photoDetail.locationName {
            self.locationLabel.text = "Location: \(location)"
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
