//
//  EchoViewController.swift
//  EchoFoo
//
//  Created by Sharon Kass on 2/3/17.
//  Copyright © 2017 RoboTigers. All rights reserved.
//

import UIKit
import Ensembles

class EchoViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var dataForLabel : String = ""
    
    @IBAction func echo(_ sender: UIButton) {
        print("Button pressed")
        dataForLabel = text.text!
        label.text = dataForLabel
        
        // write the value to the data store
        // SHARON: Replace this with CoreDataStack below
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let echo = Echo(context: managedContext)
//        echo.text = dataForLabel
//        echo.created = NSDate()
//        do {
//            try managedContext.save()
//        } catch let error as NSError {
//            print("Could not save the echo. \(error), \(error.userInfo)")
//        }
        
        let echo : Echo = NSEntityDescription.insertNewObject(forEntityName: "Echo", into: CoreDataStack.defaultStack.managedObjectContext) as! Echo
        echo.text = dataForLabel
        echo.created = NSDate()
        CoreDataStack.defaultStack.saveContext()
        CoreDataStack.defaultStack.syncWithCompletion(nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("in viewDidLoad")
        label.text = dataForLabel;
    }

}
