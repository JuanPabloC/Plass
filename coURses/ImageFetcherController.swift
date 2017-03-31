//
//  ImageRenderController.swift
//  coURses
//
//  Code taken from Bobby's GitHub
//  Created by Juan Pablo Castano on 12/16/16.
//  Copyright © 2016 Juan Pablo Castano. All rights reserved.
//

import UIKit

class ImageFetcherController: UIViewController {
    
    @IBOutlet weak var SearchButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageFetcher: ImageFetcher!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.masksToBounds = true
        
        imageFetcher = ImageFetcher()
        
        SearchButton.tintColor = UIColor.blue
        imageView.image = UIImage(named: "oops")
    }
    
    @IBAction func fetchImage(_ sender: Any) {
        print(searchBar.text!)
        let searchURL = searchBar.text!
        
        imageFetcher.fetchImage(url: searchURL){
            (fetchResult) -> Void in
            
            switch(fetchResult) {
            case let .ImageSuccess(image):
                OperationQueue.main.addOperation() {
                    self.imageView.image = image
                }
            case .ImageFailure(_):
                OperationQueue.main.addOperation() {
                    self.imageView.image = UIImage(named: "oops")
                }
            }
        }
        
    }
}
