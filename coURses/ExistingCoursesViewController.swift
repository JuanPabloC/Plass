//
//  ExistingCoursesViewController.swift
//  coURses
//
//  Created by Juan Pablo Castano on 12/16/16.
//  Copyright © 2016 Juan Pablo Castano. All rights reserved.
//

import UIKit

class ExistingCoursesViewController: UITableViewController {
        
    var allCourses : [Course] = []
    var newCourse: Course!
    var semesterToAdd: Int32!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToInd" {
            let cell = sender as! ChosenCell
            cell.course.semester = semesterToAdd!
        }
    }
    
    @IBAction func addNewCourse(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddWindowPopUp") as! PopOverAddCourseController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(allCourses[indexPath.row].semester)
        print("Hello")
        allCourses[indexPath.row].semester = semesterToAdd!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.performSegue(withIdentifier: "UnwindToInd", sender: tableView.cellForRow(at: indexPath))
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCourses.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chosenCell", for: indexPath) as! ChosenCell
        
        let course = allCourses[indexPath.row]
        
        cell.title.text = course.courseTitle
        cell.code = course.courseCode
        cell.credits.text = String(course.credits)
        cell.department.text = course.department
        cell.course = course
        
        return cell
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            allCourses = try context.fetch(Course.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight,
                                  left: 0,
                                  bottom: 0,
                                  right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 75
        
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
