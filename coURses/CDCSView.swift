//
//  CDCSView.swift
//  coURses
//
//  Created by Juan Pablo Castano on 12/16/16.
//  Copyright © 2016 Juan Pablo Castano. All rights reserved.
//

import UIKit

class CDCSView: UIViewController{
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let urlString = "https://cdcs.ur.rochester.edu"
        
        if let url = URL(string: urlString){
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        } else {
            print("Invalid URL")
        }
        
    }
}
