//
//  IndSemesterViewController.swift
//  coURses
//
//  Created by Juan Pablo Castano on 12/15/16.
//  Copyright © 2016 Juan Pablo Castano. All rights reserved.
//

import UIKit
import CoreData

class IndSemesterViewController: UITableViewController {

    @IBOutlet weak var EditButton: UIBarButtonItem!
    
    var courses : [Course] = []
    var tempCourse: Course!
    var semesterNumber: Int32!
    
    @IBAction func edit(_ sender: UIBarButtonItem) {
        if isEditing == false{
            setEditing(true, animated: true)
            sender.title = "Done"
        } else {
            setEditing(false, animated: true)
            sender.title = "Edit"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddCourse" {
            let addCourseView = segue.destination as! ExistingCoursesViewController
            print(semesterNumber!)
            addCourseView.semesterToAdd = semesterNumber!
        }
    }
    
    @IBAction func unwindToInd(segue: UIStoryboardSegue){
        print("Called unwind to int")
        let source = segue.source as! ExistingCoursesViewController
        semesterNumber = source.semesterToAdd
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            courses = []
            let allCourses = try context.fetch(Course.fetchRequest())
            let all = (allCourses as! [Course])
            for course in all{
                if (course.semester == semesterNumber){
                    courses.append(course)
                }
            }
        }
        catch {
            print("Fetching Failed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseCell
        
        let course = courses[indexPath.row]
        
        cell.title.text = course.courseTitle
        cell.code = course.courseCode
        cell.credits.text = String(course.credits)
        cell.department.text = course.department
        cell.course = course
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Hello")
            courses[indexPath.row].semester = 0
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            getData()
            tableView.reloadData()
            
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
