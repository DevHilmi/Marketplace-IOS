//
//  ViewController.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 3/27/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//


import UIKit
import ImageSlideshow
import Alamofire
import SwiftyJSON


class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let model: [String] = ["","Fresh Market","Recommended Product","New Product"]
    let judul: [[String]] = [[],["Test 1","Test 2"],["Test 3"],["Test 4"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count// your number of cell here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row==0){
            return  tableView.dequeueReusableCell(withIdentifier: "CellTableImage",for: indexPath) as UITableViewCell
        }else{
            let   cell = tableView.dequeueReusableCell(withIdentifier: "CellTable",for: indexPath) as! HomeTableViewCell
            
            cell.titleCell.text = model[indexPath.row]
            return cell
        }
        
        
    }
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        if(indexPath.row>0){
            guard let tableViewCell = cell as? HomeTableViewCell else { return }
            tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        }
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return judul[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeCollectionViewCell
        cell.textJudul.text = judul[collectionView.tag][indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         performSegue(withIdentifier: "listHomeBelanja", sender: self)
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
    
}

