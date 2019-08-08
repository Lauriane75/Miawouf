//
//  CatSuccessViewController.swift
//  Miawouf
//
//  Created by Lauriane Haydari on 07/08/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class CatSuccessViewController: UIViewController {

    var cat: Pet!

    @IBOutlet weak var catWelcomeLabel: UILabel!

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        loadText()
    }

    func loadText() {
        catWelcomeLabel.text = "Miaouh de bienvenue ! \(String(describing: cat.name)) \n Vous avez bien été ajouté à notre base de données ! Nous vous enverrons une notification dès que nous aurons une âme soeur à vous proposer !"
    }


}
