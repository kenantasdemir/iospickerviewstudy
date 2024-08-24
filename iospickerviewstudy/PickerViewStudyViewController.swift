//
//  PickerViewStudyViewController.swift
//  iospickerviewstudy
//
//  Created by kenan on 14.08.2024.
//

import UIKit

class PickerViewStudyViewController: UIViewController {


    @IBOutlet weak var tfCountry: UITextField!
    
    var pickerView:UIPickerView?
    
    var countries:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       countries = ["Türkiye","Almanya","Fransa","Japonya"]
        
        pickerView = UIPickerView()
        pickerView?.dataSource = self
        pickerView?.delegate = self
        
        tfCountry.inputView = pickerView
        
        let toolbar = UIToolbar()
        toolbar.tintColor = UIColor.red
        toolbar.sizeToFit()
        
        let okButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(PickerViewStudyViewController.okClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClicked))
        
        toolbar.setItems([cancelButton,spaceButton,okButton], animated: true)
        tfCountry.inputAccessoryView = toolbar
    }
    


}

extension PickerViewStudyViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tfCountry.text = countries[row]
    }
    
    @objc func okClicked(){
        tfCountry.text = ""
        tfCountry.placeholder = "Select country"
        view.endEditing(true)
    }
    
   @objc func cancelClicked(){
       view.endEditing(true)
    }
}
