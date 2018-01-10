//
//  MasterViewController.swift
//  Registro de notas
//
//  Created by Ignacio Pozo Wandersleben on 07-01-18.
//  Copyright © 2018 Ignacio Pozo Wandersleben. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var nombreRamo: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Acá crea y setéa el botón de +
        // El selector es lo que llama la acción, lo cambié por show alert.
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAlert))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Este era el que agregaba la linea :)
    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSTextContainer(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                
                
                func nombreRamo(textField: UITextField!) {
                   // nombreRamo = textField
                    //nombreRamo?.placeholder = "Matemática"
                }
                _ = objects[indexPath.row] as! NSTextContainer
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController

                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: "Ingresa el nombre del ramo", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { textField in
            self.nombreRamo = textField
        })
        
        let aceptar = UIAlertAction(title: "Aceptar", style: .default)
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        
        alertController.addAction(aceptar)
        alertController.addAction(cancelar)
        
        navigationController?.present(alertController, animated: true, completion: {
            // acá lo que pasa cuando se termina de mostrar.
        })
        
    }
        
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row] // as! NSTextContainer
        cell.textLabel!.text = (object as AnyObject).description
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

