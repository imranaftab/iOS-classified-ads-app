//
//  PostsRepository.swift
//  SellPhone
//
//  Created by Imran Aftab Rana on 23/11/2016.
//  Copyright © 2016 Imran Aftab Rana. All rights reserved.
//

import Foundation
import UIKit

class PostsRepository {
    static var postsRepository = PostsRepository()
    
    private var _allPosts = [Post]()
    
    var allPost:[Post]{
        return _allPosts
    }
    
    func addPost(post: Post){
        _allPosts.append(post)
        savePost()
        loadPost()
    }
    
    private func savePost(){
        let archData = NSKeyedArchiver.archivedData(withRootObject: _allPosts)
        UserDefaults.standard.set(archData, forKey: "posts")
        UserDefaults.standard.synchronize()
    }
    
    private func loadPost(){
        let archData = UserDefaults.standard.object(forKey: "posts") as? Data
        if let posts = NSKeyedUnarchiver.unarchiveObject(with: archData!) as? [Post]{
            _allPosts = posts
            
        }
        NotificationCenter.default.post(NSNotification(name: NSNotification.Name(rawValue: "postsLoaded"), object: nil) as Notification)
    }
    
    func imageForPath(imagePath: String)-> UIImage{
        let fulPath = storagePathForImageName(name: imagePath)
        let image = UIImage(named: fulPath)
        return image!
    }
     func saveImgAndGetPath(image:UIImage) -> String{
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate).png"
        let fullPath = storagePathForImageName(name: imgPath)
        do{
            try imgData?.write(to: URL(fileURLWithPath: fullPath ))
        }
        catch{
        
        }
        return imgPath
    }
    private func storagePathForImageName(name:String)->String{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true)
        let fullPath = paths[0] as NSString
        return fullPath.appendingPathComponent(name)
    }
}
