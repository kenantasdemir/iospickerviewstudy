//
//  ViewController.swift
//  iospickerviewstudy
//
//  Created by kenan on 14.08.2024.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var customLabel: UILabel!
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var countries:[String] = [String]()
  
    var selectedCountry:String?
   
    @IBAction func selectItem(_ sender: UIButton) {
        print(selectedCountry!)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        countries = ["Türkiye","Almanya","Japonya","Rusya","İtalya"]
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    @IBAction func goToPage2(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gidilecekViewController = storyboard.instantiateViewController(withIdentifier: "page2") as! PickerViewStudyViewController
        self.present(gidilecekViewController,animated: true,completion: nil)
    }
    
    
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
        customLabel.text = countries[row]
        selectedCountry = countries[row]
    }


}

