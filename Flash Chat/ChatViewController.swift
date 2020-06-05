//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import SafariServices
import Alamofire

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


class ChatViewController: UIViewController {
    
    let nil_json_imag:String = "https://static9.depositphotos.com/1055089/1121/v/450/depositphotos_11217532-stock-illustration-вектор-деревянные-пустой-реалистичные-книжный.jpg"
    @IBOutlet weak var Images: UIImageView!
    @IBOutlet weak var disc: UITextView!
    var link = "https://www.google.ru"
    
    
    @IBOutlet weak var filmOutlet: UIButton!
    @IBOutlet weak var bookOutlet: UIButton!
    var link_text: String = "go to our cite"
    var link_adres: String = "https://www.google.ru"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func GoTo(_ sender: UIButton) {
        Safrigo(for: link)
    }
    
    @IBAction func Books(_ sender: UIButton) {
      AF.request("https://whattodoapp.pythonanywhere.com",
                 method: .post,
                 parameters: ["request": "book"],
                 encoder: JSONParameterEncoder.default).response { response in
                  if let data = response.data {
                      let json = String(data: data, encoding: String.Encoding.utf8)
                      let new_json = json?.split(separator: "'")
                    if new_json!.count > 1{
                    self.disc.text = String(new_json![5] )+"..."
                    self.setImage(from: String(new_json![7]))
                    self.link = String(new_json![9] ) }
                    else{
                        self.disc.text = "Простите, но  у нас кончились книги"
                        self.setImage(from:"https://images.clipartlogo.com/files/istock/previews/9723/97234921-wood-bookshelves-on-brown-wood-wall-background-flat-design.jpg")
                        self.link = "https://www.livelib.ru"
                    }
                  }

      }
    }
    
    @IBAction func Films(_ sender: UIButton) {
        AF.request("https://whattodoapp.pythonanywhere.com",
                   method: .post,
                   parameters: ["request": "film"],
                   encoder: JSONParameterEncoder.default).response { response in
                    if let data = response.data {
                        let json = String(data: data, encoding: String.Encoding.utf8)
                        let new_json = json?.split(separator: "'")
                        if new_json!.count > 1{
                        self.disc.text = String(new_json![5] )+"..."
                        self.setImage(from: String(new_json![9]))
                        self.link = String(new_json![11] ) }
                        else{
                            self.disc.text = "Простите, но  у нас кончились фильмы"
                            self.setImage(from:"https://www.meme-arsenal.com/memes/011caa30b2daa6dfd72814c06f756293.jpg")
                            self.link = "https://www.kinopoisk.ru"
                        }
                    }

        }
    }
    
    func Safrigo(for url: String){
        guard let url = URL(string: url) else{
            return
        }
        let safriVC = SFSafariViewController(url: url)
        present(safriVC, animated: true, completion: nil)
    }
    
    
    func PostSo(re:String,n:String){
       AF.request("https://whattodoapp.pythonanywhere.com",
                  method: .post,
                  parameters: ["user" : "1", re:n],
                  encoder: JSONParameterEncoder.default).response { response in
           debugPrint(response)
       }
    }
    
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.Images.image = image
            }
        }
    }
}
