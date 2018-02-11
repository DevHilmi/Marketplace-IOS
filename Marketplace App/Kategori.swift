
import Foundation
import ObjectMapper

public class Kategori:Mappable {
    public var id : Int?
    public var nama : String?
    public var sub_category : Array<Sub_category>?
    
    required public init?(map: Map){
        mapping(map:map)
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        nama <- map["nama"]
        sub_category <- map["sub_category"]
    }
    public class func modelsFromDictionaryArray(array:NSArray) -> [Kategori]
    {
        var models:[Kategori] = []
        for item in array
        {
            models.append(Kategori(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? Int
        nama = dictionary["nama"] as? String
        if (dictionary["sub_category"] != nil) { sub_category = Sub_category.modelsFromDictionaryArray(array: dictionary["sub_category"] as! NSArray) }
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.nama, forKey: "nama")
        
        return dictionary
    }
    
}
