//
//  CommonNotasCell.swift
//  Registro de notas
//
//  Created by Julián Arias on 09-02-18.
//  Copyright © 2018 Ignacio Pozo Wandersleben. All rights reserved.
//

import UIKit

class CommonNotasCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var subsubtitle: UILabel!
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var nota: UILabel!

    override func awakeFromNib() {
        // Codigo que se ejecuta cuando se muestra la celda
    }

}
