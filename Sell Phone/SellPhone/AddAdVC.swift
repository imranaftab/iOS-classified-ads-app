//
//  AddAdVC.swift
//  SellPhone
//
//  Created by Imran Aftab Rana on 22/11/2016.
//  Copyright © 2016 Imran Aftab Rana. All rights reserved.
//

import UIKit

class AddAdVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var AdImgView: UIImageView!
    @IBOutlet weak var lblAdTitle: UITextField!
    @IBOutlet weak var lblAdPrice: UITextField!
    @IBOutlet weak var lblAdDesc: UITextView!
    
    @IBOutlet weak var btnAdPic: UIButton!
    var imgPicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GoBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func addImg(_ sender: Any) {
        present(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let myImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            AdImgView.contentMode = UIViewContentMode.scaleAspectFit //3
            AdImgView.image = myImage //4
            btnAdPic.setTitle("", for: UIControlState.normal)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func btnPostAd(_ sender: Any) {
        if let title = lblAdTitle.text, let price = Post.addInt(price: lblAdPrice.text!), let desc = lblAdDesc.text, let pic = AdImgView.image{
            let path = PostsRepository.postsRepository.saveImgAndGetPath(image: pic)
            let post = Post(adTitle: title, adDesc: desc, adPrice: price, adImgURL: path)
            PostsRepository.postsRepository.addPost(post: post)
            dismiss(animated: true, completion: nil)
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
