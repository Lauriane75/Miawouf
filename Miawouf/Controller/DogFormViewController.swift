//
//  FormViewController.swift
//  Miawouf
//
//  Created by Lauriane Haydari on 06/08/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class DogFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    var dog: Pet!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var majorirySwitch: UISwitch!
    @IBOutlet weak var genderSegmentedControler: UISegmentedControl!
    @IBOutlet weak var racePickerView: UIPickerView!
    @IBOutlet weak var phoneTextfield: UITextField!

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }

    // works with protocol UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func dismissKeybord(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextfield.resignFirstResponder()

    }

    @IBAction func validate() {
        createPetObject()
        performSegue(withIdentifier: "dogSegueToSucces", sender: self)
    }

    private func createPetObject() {
        let name = nameTextField.text
        let phone = phoneTextfield.text
        let hasMajoriry = majorirySwitch.isOn
        let genderIndex = genderSegmentedControler.selectedSegmentIndex
        let gender : Pet.Gender = (genderIndex == 0) ? .female : .male
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        dog = Pet(name: name, phone: phone, hasMajority: hasMajoriry, race: race, gender: gender)
        }

    fileprivate func presentAlert(_ error: (String)) {
        let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
    }

    private func checkPetStatus() {
        switch dog.status {
        case .accepted:
            performSegue(withIdentifier: "dogSegueToSuccess", sender: self)
        case .rejected(let error):
            presentAlert(error)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dogSegueToSuccess" {
            let controllerSuccess = segue.destination as! DogSuccessViewController
            controllerSuccess.dog = dog
        }
    }

} // end
