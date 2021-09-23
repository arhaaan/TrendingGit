//
//  DetailViewController.swift
//  Trending Git
//
//  Created by Karim Arhan on 23/09/21.
//  Copyright © 2021 Karim Arhan. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var starLbl: UILabel!
    @IBOutlet weak var forkLbl: UILabel!
    
    @IBOutlet weak var SFView: UIView!
    
    @IBOutlet weak var webView: WKWebView!
    
    var item : Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SFView.layer.cornerRadius = 6
        SFView.layer.borderColor = UIColor.black.cgColor
        SFView.layer.borderWidth = 0.5
        
        imageView.load(url: (item?.owner!.avatar_url)!)
        nameLbl.text = item?.name
        descLbl.text = item?.description
        starLbl.text = "\(item!.stargazers_count)"
        forkLbl.text = "\(item!.forks)"
        
        let url = URL(string: item?.html_url ?? "")!
        webView.load(URLRequest(url: url))
        
    }
    

   

}
