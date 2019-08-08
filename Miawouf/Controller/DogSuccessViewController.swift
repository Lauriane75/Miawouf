//
//  SuccessViewController.swift
//  Miawouf
//
//  Created by Lauriane Haydari on 06/08/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class DogSuccessViewController: UIViewController {



    @IBOutlet weak var dogWelcomeLabel: UILabel!

    var dog: Pet!

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    func loadText() {
    guard dog?.name != nil else {
        dogWelcomeLabel.text = "Wouf de bienvenue ! \(String(describing: dog!.name)))) \n Vous avez bien été ajouté à notre base de données ! Nous vous enverrons une notification dès que nous aurons une âme soeur à vous proposer !"
    return
        }
    }

    override func viewDidLoad() {
        loadText()
    }

}
