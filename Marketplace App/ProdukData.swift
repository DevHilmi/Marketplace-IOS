import Foundation
import ObjectMapper

public class ProdukData:Mappable {
    public var id : Int?
    public var lapak_id : Int?
    public var slug : String?
    public var kategori_id : Int?
    public var sku : Int?
    public var nama : String?
    public var deskripsi : String?
    public var berat : Int?
    public var stok : Int?
    public var harga : String?
    public var gambar_pertama : Array<GambarProduk>?
    
    
    required public init?(map: Map){
        mapping(map:map)
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        lapak_id <- map["lapak_id"]
        slug <- map["slug"]
        kategori_id <- map["kategori_id"]
        sku <- map["sku"]
        nama <- map["nama"]
        deskripsi <- map["deskripsi"]
        berat <- map["berat"]
        stok <- map["stok"]
        harga <- map["harga"]
        gambar_pertama <- map["gambar_pertama"]
    }
    public class func modelsFromDictionaryArray(array:NSArray) -> [ProdukData]
    {
        var models:[ProdukData] = []
        for item in array
        {
            models.append(ProdukData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? Int
        lapak_id = dictionary["lapak_id"] as? Int
        slug = dictionary["slug"] as? String
        kategori_id = dictionary["kategori_id"] as? Int
        sku = dictionary["sku"] as? Int
        nama = dictionary["nama"] as? String
        deskripsi = dictionary["deskripsi"] as? String
        berat = dictionary["berat"] as? Int
        stok = dictionary["stok"] as? Int
        harga = dictionary["harga"] as? String
         if (dictionary["gambar_pertama"] != nil) { gambar_pertama = GambarProduk.modelsFromDictionaryArray(array: dictionary["gambar_pertama"] as! NSArray) }
          }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.lapak_id, forKey: "lapak_id")
        dictionary.setValue(self.slug, forKey: "slug")
        dictionary.setValue(self.kategori_id, forKey: "kategori_id")
        dictionary.setValue(self.sku, forKey: "sku")
        dictionary.setValue(self.nama, forKey: "nama")
        dictionary.setValue(self.deskripsi, forKey: "deskripsi")
        dictionary.setValue(self.berat, forKey: "berat")
        dictionary.setValue(self.stok, forKey: "stok")
        dictionary.setValue(self.harga, forKey: "harga")
        
        return dictionary
    }
    
}
