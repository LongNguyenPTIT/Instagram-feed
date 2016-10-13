//
//  InstaModel.swift
//  InstagramFeed
//
//  Created by Nguyen Nam Long on 10/13/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import Foundation

struct InstaModel {
    var locationName:String?
    var likeCount:Int = 0
    var imageLowURL:String?
    var imageStandardURL:String?
    var captionText:String?
    var avatarURL:String?
    var username:String?
    var fullName:String?
    
//    init() {
//        self.locationName = ""
//        imageLowURL = ""
//        imageStandardURL =
//    }
    
    init(JsonData: [String: AnyObject]) {
        if let location = JsonData["location"] as? [String: AnyObject] {
            self.locationName = location["name"] as? String
        }
        if let likes = JsonData["likes"] as? [String: AnyObject] {
            self.likeCount = likes["count"] as! Int
        }
        if let images = JsonData["images"] as? [String: AnyObject] {
            if let lowResolution = images["low_resolution"] as? [String: AnyObject] {
                self.imageLowURL = (lowResolution["url"] as! String)
            }
            if let lowResolution = images["standard_resolution"] as? [String: AnyObject] {
                self.imageStandardURL = (lowResolution["url"] as! String)
            }
        }
        if let caption = JsonData["caption"] as? [String: AnyObject] {
            self.captionText = (caption["text"] as! String)
        }
        if let userInfo = JsonData["user"] as? [String: AnyObject] {
            self.username = (userInfo["username"] as! String)
            self.avatarURL = userInfo["profile_picture"] as? String
            self.fullName = (userInfo["full_name"] as! String)
        }
    }
}
