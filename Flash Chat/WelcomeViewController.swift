//
//  WelcomeViewController.swift
//  Flash Chat
//
//  This is the welcome view controller - the first thign the user sees
//

import UIKit
import Alamofire


class WelcomeViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
//        AF.request("https://whattodoapp.pythonanywhere.com",
//                   method: .post,
//                   parameters: ["request": "book"],
//                   encoder: JSONParameterEncoder.default).response { response in
//                    //debugPrint(response)
//                    if let data = response.data {
//                        let json = String(data: data, encoding: String.Encoding.utf8)
//                        let new_json = json?.split(separator: "'")
//                        //print(json)
//                        print(new_json![3])
//                    }
//
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
