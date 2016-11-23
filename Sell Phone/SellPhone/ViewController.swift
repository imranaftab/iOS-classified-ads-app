//
//  ViewController.swift
//  SellPhone
//
//  Created by Imran Aftab Rana on 22/11/2016.
//  Copyright © 2016 Imran Aftab Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    var posts:[Post]!
    
    
    func postAdded(){
        posts = PostsRepository.postsRepository.allPost
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: "postAdded", name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
        posts = PostsRepository.postsRepository.allPost
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "IdAdCell") as? AdCell{
            cell.loadData(post: post)
            return cell
        }
        else{
            let cel = AdCell()
            cel.loadData(post: post)
            return cel
        }
    }
    

}

