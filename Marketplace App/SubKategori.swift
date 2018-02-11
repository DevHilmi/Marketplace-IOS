
import Foundation
import ObjectMapper

public class Sub_category:Mappable {
    public var id : Int?
    public var nama : String?
    
    required public init?(map: Map){
        mapping(map:map)
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        nama <- map["nama"]
    }
    public class func modelsFromDictionaryArray(array:NSArray) -> [Sub_category]
    {
        var models:[Sub_category] = []
        for item in array
        {
            models.append(Sub_category(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? Int
        nama = dictionary["nama"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.nama, forKey: "nama")
        
        return dictionary
    }
    
}
