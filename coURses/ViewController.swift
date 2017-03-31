//
//  ViewController.swift
//  coURses
//
//  Created by Juan Pablo Castano on 12/15/16.
//  Copyright © 2016 Juan Pablo Castano. All rights reserved.
//

import UIKit
import CoreData

class MainView: UIViewController {

    @IBOutlet weak var MyPlanButton: UIButton!
    @IBOutlet weak var AddCourseButton: UIButton!
    @IBOutlet weak var WebButton: UIButton!
    @IBOutlet weak var ImageButton: UIButton!
    
    
    var allcourses = [NSManagedObject]()
    
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    @IBAction func assCourse(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddWindowPopUp") as! PopOverAddCourseController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        MyPlanButton.layer.borderColor = UIColor.black.cgColor
        MyPlanButton.layer.borderWidth = 0.5;
        
        AddCourseButton.layer.borderColor = UIColor.black.cgColor
        AddCourseButton.layer.borderWidth = 0.5;
        
        WebButton.layer.borderColor = UIColor.black.cgColor
        WebButton.layer.borderWidth = 0.5;
        
        ImageButton.layer.borderColor = UIColor.black.cgColor
        ImageButton.layer.borderWidth = 0.5;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

