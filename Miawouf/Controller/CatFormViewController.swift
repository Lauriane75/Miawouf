//
//  CatFormViewController.swift
//  Miawouf
//
//  Created by Lauriane Haydari on 07/08/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class CatFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    var cat: Pet!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var racePickerView: UIPickerView!
    @IBOutlet weak var phoneTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catRaces.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catRaces[row]
    }

    @IBAction func validate(_ sender: Any) {
        createPetObject()
        performSegue(withIdentifier: "catSegueToSucces", sender: self)
    }

    private func createPetObject() {
        let name = nameTextField.text
        let phone = phoneTextfield.text
        let hasMajority = majoritySwitch.isOn
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        let gender: Pet.Gender = (genderIndex == 0) ? .female : .male
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race = catRaces[raceIndex]
        cat = Pet(name: name, phone: phone, hasMajority: hasMajority, race: race, gender: gender)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextfield.resignFirstResponder()
    }

    fileprivate func presentAlert(_ error: (String)) {
        let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
    }

    private func checkPetStatus() {
        switch cat.status {
        case .accepted:
            performSegue(withIdentifier: "catSegueToSuccess", sender: self)
        case .rejected(let error):
            presentAlert(error)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "catSegueToSuccess" {
            let success = segue.destination as! CatSuccessViewController
            success.cat = cat
        }
    }

}
