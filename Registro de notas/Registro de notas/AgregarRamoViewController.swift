//
//  AgregarRamoViewController.swift
//  Registro de notas
//
//  Created by Ignacio Pozo Wandersleben on 09-01-18.
//  Copyright © 2018 Ignacio Pozo Wandersleben. All rights reserved.
//

import UIKit

class AgregarRamoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nombreRamoTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nombreRamoTextField.delegate = self
        
    }

    func fieldIsEmpty() {
        let text = nombreRamoTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
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
