//
//  PopOverAddCourse.swift
//  coURses
//
//  Created by Juan Pablo Castano on 12/15/16.
//  Copyright © 2016 Juan Pablo Castano. All rights reserved.
//

import UIKit

class PopOverAddCourseController: UIViewController {

    @IBOutlet weak var TitleTextField: UITextField!
    @IBOutlet weak var CodeTextField: UITextField!
    @IBOutlet weak var DepartmentTextField: UITextField!
    @IBOutlet weak var CreditsTextField: UITextField!
    @IBOutlet weak var smallPopUp: UIView!
    
    
    @IBAction func cancel(_ sender: AnyObject) {
        self.removeAnimate()
        
    }
    
    @IBAction func addCourse(_ sender: AnyObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let course = Course(context: context)
        course.courseTitle = TitleTextField.text!
        course.courseCode = CodeTextField.text!
        course.department = DepartmentTextField.text!
        course.credits = Double(CreditsTextField.text!)!
        course.semester = 0
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        self.removeAnimate()
    }
    
    // code taken from: https://www.youtube.com/watch?v=FgCIRMz_3dE
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3);
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
        })
    }
    
    // code taken from: https://www.youtube.com/watch?v=FgCIRMz_3dE
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished: Bool) in
            if (finished){
                self.view.removeFromSuperview()
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.smallPopUp.layer.cornerRadius = 5;
        self.smallPopUp.layer.masksToBounds = true;
        self.showAnimate()
        // Do any additional setup after loading the view.
        
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
