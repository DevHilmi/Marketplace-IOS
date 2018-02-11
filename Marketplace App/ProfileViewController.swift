//
//  ProfileViewController.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 3/30/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//

import Alamofire
import UIKit
import SwiftyJSON

class ProfileViewController: UIViewController {

    @IBOutlet weak var logout: UIBarButtonItem!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var btnLog: UIButton!
    var login: Bool = false
    var loginCheck:Bool = (UserDefaults.standard.bool(forKey: "login"))
    override func viewDidLoad() {
        super.viewDidLoad()
       	// loginCheck = (UserDefaults.standard.bool(forKey: "login"))
        if(!loginCheck){
            nama.isHidden = true
            email.isHidden = true
            btnLog.isHidden = false
        }else{
            btnLog.isHidden = true
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func logoutAction(_ sender: Any) {
        print(loginCheck)
        if(!loginCheck){
            
        }else{
            
        if let url = URL(string: Api.logout) {
            
            var urlRequest = URLRequest(url: url)
            
            urlRequest.httpMethod = HTTPMethod.post.rawValue
            
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            urlRequest.addValue("Bearer " + UserDefaults.standard.string(forKey: "access_token")!, forHTTPHeaderField:"Authorization")
            var encodedURLRequest = urlRequest
            
            do {
                try encodedURLRequest =  URLEncoding.queryString.encode(urlRequest,with:nil)
                
            } catch _ as NSError {
                
            }
            // Both calls are equivalent
            Alamofire.request(encodedURLRequest).responseString { response in
                debugPrint(response)
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        UserDefaults.standard.set("nil", forKey: "access_token")
                        UserDefaults.standard.set("nil", forKey: "refresh_token")
                        UserDefaults.standard.set(false, forKey: "login")
                        print("go here")
                        self.login = false
                        self.nama.isHidden = true
                        self.email.isHidden = true
                        self.btnLog.isHidden = false
                        break
                    default:
                        break
                }
                }
            }
        }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
