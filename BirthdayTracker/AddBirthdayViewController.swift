//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by Alevtina on 21/03/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

import UIKit

class AddBirthdayViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthdayPicker.maximumDate = Date() // current date
    }

    @IBAction func saveBirthday(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let date = birthdayPicker.date
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newBirthday = Birthday(context: context)
        newBirthday.firstName = firstName
        newBirthday.lastName = lastName
        newBirthday.birthdate = date
        newBirthday.birthdayId = UUID().uuidString
        
        if let uniqueId = newBirthday.birthdayId {
            print("The birthday id is \(uniqueId)")
        }
        
        do {
            try context.save()
        } catch let error {
            print("Could not save context. Error: \(error)")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBirthday(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

