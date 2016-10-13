//
//  PhotoViewController.swift
//  InstagramFeed
//
//  Created by Nguyen Nam Long on 10/13/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let respondData:ParseData? = ParseData()
    var photoDataList = [InstaModel]()
    
    @IBOutlet weak var PhotoTableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        PhotoTableView.delegate = self
        PhotoTableView.dataSource = self
        respondData?.getDataFirst(completion: { (responds) in
            self.photoDataList = responds
            print(self.photoDataList)
            self.PhotoTableView.reloadData()
            
        })

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
        cell.configCell(dataCell: photoDataList[indexPath.row])
        return cell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? PhotoDetailViewController
        let indexPath = PhotoTableView.indexPath(for: sender as! UITableViewCell)
        destVC?.photoDetail = photoDataList[(indexPath?.row)!]
    }

}
