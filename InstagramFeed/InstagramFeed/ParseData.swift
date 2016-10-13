//
//  ParseData.swift
//  InstagramFeed
//
//  Created by Nguyen Nam Long on 10/13/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import Foundation

struct ParseData {
    
    
    func getDataFirst(completion: @escaping ([InstaModel]) -> () ){
        let userId = "435569061"
        let accessToken = "435569061.c66ada7.d12d19c8687e427591f254586e4f3e47"
        let url = URL(string: "https://api.instagram.com/v1/users/\(userId)/media/recent/?access_token=\(accessToken)")
        
        if let url = url {
            let request = URLRequest(
                url: url,
                cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData,
                timeoutInterval: 10)
            let session = URLSession(
                configuration: URLSessionConfiguration.default,
                delegate: nil,
                delegateQueue: OperationQueue.main)
            let task = session.dataTask(
                with: request,
                completionHandler: { (dataOrNil, response, error) in
                    if let data = dataOrNil {
                        if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                            
                            if let photoData = responseDictionary["data"] as? [[String: AnyObject]] {
                                var listData = [InstaModel]()
                                for item in photoData {
                                    let item = InstaModel(JsonData: item)
                                    listData.append(item)
                                }
                                completion(listData)
                                
                            }
                        }
                    }
            })
            task.resume()
        }
    }
}
