//
//  KategoriTableViewController.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 4/12/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftyJSON
class KategoriTableViewController: UITableViewController {
    static var kategoriObj = [Kategori]()
    static var subKategori = [Sub_category]()
     override func viewDidLoad() {
        super.viewDidLoad()
        // Both calls are equivalent
        Alamofire.request(Api.kategori, method: .get, encoding: JSONEncoding.default).responseArray { (response: DataResponse<[Kategori]>) in
            //to get status code
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    let jsonKategori = response.result.value;
                    KategoriTableViewController.kategoriObj = jsonKategori!;
                    self.tableView.reloadData()
                    break
                default:
                    print("error with response status: \(status)")
                }
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return KategoriTableViewController.kategoriObj.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let   cell = tableView.dequeueReusableCell(withIdentifier: "katergoriCell",for: indexPath) as! KategoriTableViewCell

        cell.txtkategori.text = KategoriTableViewController.kategoriObj[indexPath.row].nama

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        KategoriTableViewController.subKategori = KategoriTableViewController.kategoriObj[indexPath.row].sub_category!
        performSegue(withIdentifier: "subkategori", sender: self)
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}