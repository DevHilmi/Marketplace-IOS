

import Foundation
import ObjectMapper

public class GambarProduk:Mappable {
    public var gambar : String?
    required public init?(map: Map){
        mapping(map:map)
    }
    
    public func mapping(map: Map) {
         gambar <- map["gambar"]
    }
    public class func modelsFromDictionaryArray(array:NSArray) -> [GambarProduk]
    {
        var models:[GambarProduk] = []
        for item in array
        {
            models.append(GambarProduk(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    required public init?(dictionary: NSDictionary) {
        
        gambar = dictionary["gambar"] as? String
     
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.gambar, forKey: "gambar")
       
        
        return dictionary
    }

}
