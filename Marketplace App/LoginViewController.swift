//
//  LoginViewController.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 4/4/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import UIKit
import SwiftyJSON


class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    let messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func activityIndicator(_ title: String) {
        
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
        strLabel.text = title
        strLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2 , width: 160, height: 46)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        effectView.addSubview(activityIndicator)
        effectView.addSubview(strLabel)
        view.addSubview(effectView)
    }
    
    func alert(_ title: String, _ text:String){
        let alert = UIAlertController(title: title, message: text, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func login(_ sender: Any) {
        activityIndicator("Login")
        if email.text=="" || password.text==""{
            alert("Gagal Login", "Masukan Username dan Password")
            effectView.removeFromSuperview()
            }else{
            let parameters: Parameters = [
                "email":email.text ?? "null",
                "password": password.text ?? "null"
            ]
            let link = Api.login
            if let url = URL(string: link) {
                
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
                Alamofire.request(encodedURLRequest).responseObject { (response: DataResponse<User>) in
                    if let status = response.response?.statusCode {
                        switch(status){
                        case 200:
                            print("login berhasil")
                       
                        let user = response.result.value
                        UserDefaults.standard.set(user?.access_token, forKey: "access_token")
                        UserDefaults.standard.set(user?.refresh_token, forKey: "refresh_token")
                        UserDefaults.standard.set(true, forKey: "login")
                        self.navigationController?.popViewController(animated: true)
                        self.dismiss(animated: true, completion: nil)
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
                        self.effectView.removeFromSuperview()
                }
            }

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
