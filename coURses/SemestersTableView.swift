//
//  SemestersTableView.swift
//  coURses
//
//  Created by Juan Pablo Castano on 12/15/16.
//  Copyright © 2016 Juan Pablo Castano. All rights reserved.
//

import UIKit
import CoreData

class SemestersTableView: UITableViewController{
    
    var courses : [Course] = []
    var totalCredits = 0.0
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            courses = try context.fetch(Course.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
    
    func getTotalCredits(_ semester: Int32) -> Double {
        totalCredits = 0.0
        for course in courses{
            if (course.semester == semester) {
                totalCredits = totalCredits + course.credits
            }
        }
        
        return totalCredits
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SemesterCell", for: indexPath) as! SemesterCell
        getData()
        switch (indexPath.row){
        case 0:
            cell.title.text = "First Semester"
            print(getTotalCredits(1).description)
            print(getTotalCredits(1).description)
            cell.totalCredits.text = getTotalCredits(1).description
            break
        case 1:
            cell.title.text = "Second Semester"
            print(getTotalCredits(1).description)
            cell.totalCredits.text = getTotalCredits(2).description
            break
        case 2:
            cell.title.text = "Third Semester"
            cell.totalCredits.text = getTotalCredits(3).description
            break
        case 3:
            cell.totalCredits.text = getTotalCredits(4).description
            cell.title.text = "Fourth Semester"
            break
        case 4:
            cell.totalCredits.text = getTotalCredits(5).description
            cell.title.text = "Fifth Semester"
            break
        case 5:
            cell.totalCredits.text = getTotalCredits(6).description
            cell.title.text = "Sixth Semester"
            break
        case 6:
            cell.totalCredits.text = getTotalCredits(7).description
            cell.title.text = "Seventh Semester"
            break
        case 7:
            cell.totalCredits.text = getTotalCredits(8).description
            cell.title.text = "Eigth Semester"
            break
        case 8:
            cell.totalCredits.text = getTotalCredits(9).description
            cell.title.text = "Ninth Semester"
            break
        case 9:
            cell.totalCredits.text = getTotalCredits(10).description
            cell.title.text = "Tenth Semester"
            break
        default:
            break
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toIndSemester" {
            let indSemester = segue.destination as! IndSemesterViewController
            let cell = sender as! SemesterCell
            indSemester.title = cell.title.text
            
            print("Entering switch with ")
            print(cell.title.text!)
            switch (cell.title.text!){
            case "First Semester":
                indSemester.semesterNumber = 1
                break
            case "Second Semester":
                indSemester.semesterNumber = 2
                break
            case "Third Semester":
                indSemester.semesterNumber = 3
                break
            case "Fourth Semester":
                indSemester.semesterNumber = 4
                break
            case "Fifth Semester":
                indSemester.semesterNumber = 5
                break
            case "Sixth Semester":
                indSemester.semesterNumber = 6
                print(indSemester.semesterNumber)
                break
            case "Seventh Semester":
                indSemester.semesterNumber = 7
                break
            case "Eigth Semester":
                indSemester.semesterNumber = 8
                break
            case "Ninth Semester":
                indSemester.semesterNumber = 9
                break
            case "Tenth Semester":
                indSemester.semesterNumber = 10
                break
            default:
                print("Went to default")
                break
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getData()
        tableView.reloadData()
        self.title = "My Plan";
        
        
    }
    
}
