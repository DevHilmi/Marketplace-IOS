
import ObjectMapper

public class User: Mappable  {
    public var access_token : String?
    public var refresh_token : String?
    public var expires_in : Int?
    
    required public init?(map: Map){
        mapping(map:map)
    }
    
    public func mapping(map: Map) {
        access_token <- map["access_token"]
        refresh_token <- map["refresh_token"]
        expires_in <- map["expires_in"]
    }
    public class func modelsFromDictionaryArray(array:NSArray) -> [User]
    {
        var models:[User] = []
        for item in array
        {
            models.append(User(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        access_token = dictionary["access_token"] as? String
        refresh_token = dictionary["refresh_token"] as? String
        expires_in = dictionary["expires_in"] as? Int
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.access_token, forKey: "access_token")
        dictionary.setValue(self.refresh_token, forKey: "refresh_token")
        dictionary.setValue(self.expires_in, forKey: "expires_in")
        
        return dictionary
    }
    
}
