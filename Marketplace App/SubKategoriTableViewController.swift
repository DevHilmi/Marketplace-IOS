//
//  SubKategoriTableViewController.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 4/18/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//

import UIKit
import SwiftyJSON

class SubKategoriTableViewController: UITableViewController {
    static var kategoriId : Int?
    var kategori = [Sub_category] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
     kategori = KategoriTableViewController.subKategori
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.kategori.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "subkategoriCell", for: indexPath) as! SubKategoriTableViewCell
     
        cell.txtNama.text = self.kategori[indexPath.row].nama
     
     return cell
     }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "produk", sender: self)
        SubKategoriTableViewController.kategoriId = self.kategori[indexPath.row].id
        print(SubKategoriTableViewController.kategoriId!)
        
    }
}
