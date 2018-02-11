//
//  RegisterViewController.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 4/3/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//
import Alamofire
import UIKit
import SwiftyJSON

class RegisterViewController: UIViewController {

    @IBOutlet weak var nama: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repassword: UITextField!
    @IBOutlet weak var jeniskelamin: UITextField!
    @IBOutlet weak var notlp: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func alert(_ title: String, _ text:String){
        let alert = UIAlertController(title: title, message: text, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func register(_ sender: Any) {
        if nama.text==""||email.text=="" || password.text==""||repassword.text==""||jeniskelamin.text==""||notlp.text==""{
            alert("Gagal Register", "Harap lengkapi form")
    
        }else{
            let parameters: Parameters = [
                "nama": nama.text ?? "null",
                "email":email.text ?? "null",
                "password": password.text ?? "null",
                "jenis_kelamin": jeniskelamin.text ?? "null",
                "telepon": notlp.text ?? "null"
            ]
            
            if let url = URL(string: "https://pasarsuroboyo.id/api/register") {
                
                var urlRequest = URLRequest(url: url)
                
                urlRequest.httpMethod = HTTPMethod.post.rawValue
                
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
                urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
                
                var encodedURLRequest = urlRequest
                
                do {
                    try encodedURLRequest =  URLEncoding.queryString.encode(urlRequest, with: parameters)
                    
                } catch _ as NSError {
                    
                }
                // Both calls are equivalent
                Alamofire.request(encodedURLRequest).responseString { response in
                    debugPrint(response)
                    if let status = response.response?.statusCode {
                        switch(status){
                        case 200:
                            let jsonRegister = JSON(response.result.value ?? "null");
                           print(jsonRegister)
                            break
                        case 401:
                            self.alert("Gagal Login", "Username atau password salah")
                            break
                        case 422:
                            self.alert("Gagal Login", "Format email salah")
                            break
                        default:
                            self.alert("Gagal Login", "")
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
