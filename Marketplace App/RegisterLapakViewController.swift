//
//  RegisterLapakViewController.swift
//  Pasar Suroboyo
//
//  Created by Hilmi on 4/4/17.
//  Copyright © 2017 PasarSuroboyo. All rights reserved.
//

import UIKit
import Alamofire
class RegisterLapakViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var fotoKTP: UIImageView!
    @IBOutlet weak var fotoNPWP: UIImageView!
    var logoImages: UIImage? =   nil
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
  picker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        logoImages = chosenImage
       

        fotoKTP.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func fotoNPWPAction(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }

    @IBAction func fotoKTPAction(_ sender: Any) {
    }
    @IBAction func daftar(_ sender: Any) {
         let data = UIImageJPEGRepresentation(logoImages!, 1.0)
        let parameters: Parameters = [
            "nama":"hilmi",
            "alamat": "admin",
            "telepon": "086124612",
            "npwp": "12412345",
            "ktp": "1234151",
            "picture-npwp": data!,
            "picture-ktp": data!
        ]
        
        // Both calls are equivalent
        Alamofire.request("https://pasarsuroboyo.id/api/lapak/register", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
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
