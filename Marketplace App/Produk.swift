import Foundation
import ObjectMapper

public class Produk:Mappable {
    public var kategori : String?
    public var slug : String?
    public var total : Int?
    public var per_page : Int?
    public var current_page : Int?
    public var last_page : Int?
    public var next_page_url : String?
    public var prev_page_url : String?
    public var from : Int?
    public var to : Int?
    public var data : Array<ProdukData>?
    
    required public init?(map: Map){
        mapping(map:map)
    }
    
    public func mapping(map: Map) {
        kategori <- map["kategori"]
        slug <- map["slug"]
        total <- map["total"]
        per_page <- map["per_page"]
        current_page <- map["current_page"]
        last_page <- map["last_page"]
        next_page_url <- map["next_page_url"]
        prev_page_url <- map["prev_page_url"]
        from <- map["from"]
        to <- map["to"]
        data <- map["data"]
    }
    public class func modelsFromDictionaryArray(array:NSArray) -> [Produk]
    {
        var models:[Produk] = []
        for item in array
        {
            models.append(Produk(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        kategori = dictionary["kategori"] as? String
        slug = dictionary["slug"] as? String
        total = dictionary["total"] as? Int
        per_page = dictionary["per_page"] as? Int
        current_page = dictionary["current_page"] as? Int
        last_page = dictionary["last_page"] as? Int
        next_page_url = dictionary["next_page_url"] as? String
        prev_page_url = dictionary["prev_page_url"] as? String
        from = dictionary["from"] as? Int
        to = dictionary["to"] as? Int
        if (dictionary["data"] != nil) { data = ProdukData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.kategori, forKey: "kategori")
        dictionary.setValue(self.slug, forKey: "slug")
        dictionary.setValue(self.total, forKey: "total")
        dictionary.setValue(self.per_page, forKey: "per_page")
        dictionary.setValue(self.current_page, forKey: "current_page")
        dictionary.setValue(self.last_page, forKey: "last_page")
        dictionary.setValue(self.next_page_url, forKey: "next_page_url")
        dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
        dictionary.setValue(self.from, forKey: "from")
        dictionary.setValue(self.to, forKey: "to")
        
        return dictionary
    }
    
}
