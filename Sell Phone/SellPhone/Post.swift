//
//  Post.swift
//  SellPhone
//
//  Created by Imran Aftab Rana on 22/11/2016.
//  Copyright © 2016 Imran Aftab Rana. All rights reserved.
//

import Foundation

class Post : NSObject, NSCoding{
    private var _adTitle:String!
    private var _adDesc:String!
    private var _adPrice:Int!
    private var _adImgURL:String!
    
    init(adTitle:String,adDesc:String,adPrice:Int,adImgURL:String)
    {
        _adDesc = adDesc
        _adTitle = adTitle
        _adPrice = adPrice
        _adImgURL = adImgURL
    }
    
    override init(){
    }
    
    var adTitle:String{
        return _adTitle
    }
    
    var adDesc:String{
        return _adDesc
    }
    
    var adPrice:Int{
        return _adPrice
    }
    
    var adImgURL:String{
        return _adImgURL
    }
    
    static func addInt(price:String) -> Int?{
        if let p = Int.init(price){
            return p
        }
        else{
            return 0
        }
    }
    
    required convenience init?(coder aDecoder:NSCoder){
        self.init()
        self._adImgURL = aDecoder.decodeObject(forKey: "imagePath") as? String
        self._adTitle = aDecoder.decodeObject(forKey:"title") as? String
        self._adDesc = aDecoder.decodeObject(forKey: "description") as? String
        self._adPrice = aDecoder.decodeObject(forKey: "price") as? Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._adImgURL , forKey: "imagePath" )
        aCoder.encode(self._adDesc , forKey: "description" )
        aCoder.encode(self._adTitle , forKey: "title" )
        aCoder.encode(self._adPrice , forKey: "price" )
    }
    
}
