//
//  main.swift
//  Second-Nano-Challenge
//
//  Created by Shorouq Alyami on 27/12/2021.
//
import Foundation


var myCV = cv()
let jobss:[String] = ["Data Scientist",
                      "Software Developer",
                      "Information Security Analyst",
                      "iOS Developer",
                      "Web Developer",
                      "Sales Engineer"]
Introduction()

// INTRODUCTION FUNC
func Introduction()
{
    print("""
         
                                        WELCOME TO THE FUTURE JOB
          ------------------------------------------------------------------------------------------
         |                                                                                          |
         |                                   1- Jobs List                                           |
         |                                   2- Search for a specific job                           |
         |                                   3- Create CV                                           |
         |                                   4- Open my CV                                          |
         |                                                                                          |
          ------------------------------------------------------------------------------------------
          \n
         """)
    print("Enter:")
    Main()
}

func Main ()
{
    if let userChOice = readLine()
    {
        print("\n")
        switch(userChOice)
        {
        case "1":
            jobsList()
        case "2":
            search()
        case "3":
           myCV.createCV(back: 0)
        case "4":
           myCV.printCV(back: 0)
        default:
            print("Invalid input")
            Introduction()
        }
    }
}

// JOBS LIST FUNC
func jobsList ()
{
    let jobsListt =
    """
     ------------------------------------------------------------------------------------------
    |        JOB TITLE        |   EPERIENCE     |  SALARY RANGE   |  CITY  |       COMPANY     |
    |-------------------------|-----------------|-----------------|--------|-------------------|
    | 1- Data Scientist       |   2 - 3 Years   | 9,000 - 12,000  | Riyadh |       Aramco      |
    |-------------------------|-----------------|-----------------|--------|-------------------|
    | 2- Software Developer   | Fresh Graduated | 10,000 - 13,000 | Riyadh |        SDAIA      |
    |-------------------------|-----------------|-----------------|--------|-------------------|
    | 3- Information Security |   0 - 1 Years   |  7,000 - 10,000 | Jeddah |   King Abdulaziz  |
    |    Analyst              |                 |                 |        |     University    |
    |-------------------------|-----------------|-----------------|--------|-------------------|
    | 4- iOS Developer        |   2 - 5 Years   | 12,000 - 15,000 | Riyadh |   Tuwaiq Academy  |
    |-------------------------|-----------------|-----------------|--------|-------------------|
    | 5- Web Developer        | Fresh Graduated | 10,000 - 14,000 | Riyadh |        PNAU       |
    |-------------------------|-----------------|-----------------|--------|-------------------|
    | 6- Sales Engineer       |   1 - 3 Years   | 10,000 - 12,000 | Najran | Najran University |
     ------------------------------------------------------------------------------------------
    """
    print(jobsListt)
    print("\n")
    print( """
            1- Apply
            2- Home page
           """)
    if let ApplyOrBack = readLine()
    {
        print("-------------------------------------------------------------------------------------------")
        
        if ApplyOrBack == "1"
        {
            print("\nEnter the job number:")
            if let jobNumber = readLine()
            {
                var jobNumberINT = Int (jobNumber)! - 1
                if jobNumberINT <= 5 && jobNumberINT >= 0
                {
                    for job in 0...5
                    {
                        if job == jobNumberINT
                        {
                            print("\nYour choice is:", jobss[jobNumberINT], "\n")
                            Apply()
                        }
                    }
                }
                else
                {
                    print("No match, please check the available jobs")
                    jobsList()
                }
            }
        }
        else { Introduction() }
    }
}

// APPLY FUNC
func Apply ()
{
        print("1- Apply \n2- Back to Jobs List")
        if var apply = readLine()
        {
            if apply == "1"
            {
                if myCV.firstName != ""
                {
                    print("Thanks \(myCV.firstName), your requset has been received✅")
                }
                else
                {
                    print("You don't have a CV yet, please press 1 to create it")
                    if let createCV = readLine()
                    {
                        if createCV == "1" { myCV.createCV(back: 1) }
                        else { Introduction() }
                    }
                }
            }
            else { jobsList() }
        }
    }

func completeMyRequest()
{
    print("Your CV is completed, Press 1 to submit your request☺️")
    if let press = readLine()
    {
        if press == "1"
        {
            print("Thanks \(myCV.firstName), your requset has been received✅")
            jobsList()
        }
        else
        {
            Introduction()
        }
    }
}
    
func search ()
{
    print("Enter the Job Name:")
    if let searchButton = readLine()
    {
        var isIt = true
        if isIt
        {
            for job in 0...5
            {
                if searchButton == jobss[job]
                {
                    print("The result:", jobss[job])
                    Apply()
                    isIt = false
                    break
                }
            }
            print("No match")
            search()
        }
    }
}

class cv
{
    var firstName: String = ""
    var middleName: String? = ""
    var lastName: String = ""
    var ID: String = ""
    var gender: String = ""
    var degree: String = ""
    var university: String = ""
    var major: String = ""
    var GPA: String = ""
    var experience: String = ""
    
// CREATE CV
    func createCV(back: Int)
    {
        print("---------------------------------------CREATE CV-------------------------------------------")
        print("\nFirst Name:")
        if let firstName = readLine()
        {
            self.firstName = firstName
        }
        print("\nMiddle Name:")
        if let middleName = readLine()
        {
            self.middleName = middleName
        }
        print("\nLast Name:")
        if let lastName = readLine()
        {
            self.lastName = lastName
        }
        print("\nNational ID:")
        if let ID = readLine()
        {
            self.ID = ID
        }
        print("\nGender:")
        if let gender = readLine()
        {
            self.gender = gender
        }
        print("\nDegree:")
        if let degree = readLine()
        {
            self.degree = degree
        }
        print("\nUniversity:")
        if let university = readLine()
        {
            self.university = university
        }
        print("\nMajor:")
        if let major = readLine()
        {
            self.major = major
        }
        print("\nGPA:")
        if let GPA = readLine()
        {
            self.GPA = GPA
        }
        print("\nExperience Years:")
        if let experience = readLine()
        {
            self.experience = experience
        }
        print("-------------------------------------------------------------------------------------------")
        print("\n1- Save")
        if var save = readLine()
        {
            print("\n-------------------------------------------------------------------------------------------")
            if save == "1"
            {
                print("\nYour CV has been saved✅")
                
                print("1- Preview my CV")
                if var preview = readLine()
                {
                    if preview == "1"
                    {
                        print("\n")
                        if back == 1 { printCV(back: 1) }
                        else { printCV(back: 0) }
                    }
                    else { Introduction() }
                }
            }
            else { printCV(back: 0) }
        }
    }
    
// PRINT CV
    func printCV(back: Int)
    {
        print("------------------------------------------CV-----------------------------------------------")
        if firstName != ""
        {
            
            print("\nFirst Name:", firstName)
            print("Middle Name:", middleName)
            print("Last Name:", lastName)
            print("National ID:", ID)
            print("Gender:", gender)
            print("Degree:", degree)
            print("University:", university)
            print("Major:", major)
            print("GPA:", GPA)
            print("Years of Experience:", experience, "\n")
            print("-------------------------------------------------------------------------------------------\n")
            print("1- Ok")
            if var Ok = readLine()
            {
                if back == 1 { completeMyRequest() }
                else { Introduction() }
            }
        }
        else{
            print("You did not create your cv yet")
            print("1- Let's create it")
            if var create = readLine()
            {
                if create == "1" { createCV(back: 0) }
                else
                {
                    if back == 1 { printCV(back: 1) }
                    else { printCV(back: 0) }
                }
            }
        }
    }
}


