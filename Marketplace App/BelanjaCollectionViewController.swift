//
//  BelanjaCollectionViewController.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 3/30/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//

import Kingfisher
import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

private let reuseIdentifier = "Cell"
var produkData = [ProdukData]()
class BelanjaCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let link = Api.produkPerKategori+String(SubKategoriTableViewController.kategoriId!)
        Alamofire.request(link, method: .get, encoding: JSONEncoding.default).responseObject{ (response: DataResponse<Produk>) in
            
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    let produk = response.result.value
                    produkData = (produk?.data)!
                    self.collectionView?.reloadData()
                    break
                  
                default:
                    print("error with response status: \(status)")
                }
            }
            
        }

             self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return produkData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"belanjaCell", for: indexPath) as! BelanjaCollectionViewCell
        cell.nama.text = produkData[indexPath.row].nama
        cell.toko.text = produkData[indexPath.row].slug
        cell.harga.text = "Rp. " + produkData[indexPath.row].harga!
        print(produkData[indexPath.row].gambar_pertama)
        //let url = URL(string: ()
       // cell.image.kf.setImage(with: url)
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
