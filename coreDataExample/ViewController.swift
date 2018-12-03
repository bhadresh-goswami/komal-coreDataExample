//
//  ViewController.swift
//  coreDataExample
//
//  Created by tops-mac on 02/12/18.
//  Copyright © 2018 tops-mac. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    var managedContext:NSManagedObjectContext!
    var userManagedObject:NSManagedObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate    
        self.managedContext = appDelegate.persistentContainer.viewContext
    
    
        
        
    }
    @IBAction func btnSave(_ sender: UIButton) {
        
        //create entity UserInfo
        let userEntity = NSEntityDescription.entity(forEntityName: "UserInfo", in: self.managedContext)
        
        self.userManagedObject = NSManagedObject(entity: userEntity!, insertInto: self.managedContext)
        self.userManagedObject.setValue("bhadresh", forKey: "name")
        self.userManagedObject.setValue("bhadresh@tops-int.com", forKey: "emailid")
        self.userManagedObject.setValue("india", forKey: "country")
        
        
        do{
            try self.managedContext.save()
            print("Data Saved!")
        }
        catch let err as NSError{
            print(err.localizedDescription)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

