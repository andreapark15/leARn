//
//  ViewController.swift
//  leARn
//
//  Created by Andrea Park on 2017-11-04.
//  Copyright © 2017 Andrea Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate {
    
    @IBAction func startButton(_ sender: UIButton) {
        
    }
    
    var pickerData: [String] = [String] ()
    var words : [String] = [String] ()
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
    

    @IBOutlet weak var knowLang: UIPickerView!
    @IBOutlet weak var learnLang: UIPickerView!
    
    var knowLanguages: [String] = [String] ()
    var learnLanguages : [String] = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.knowLang.delegate = (self as UIPickerViewDelegate)
        self.knowLang.dataSource = (self as UIPickerViewDataSource)
        
        self.learnLang.delegate = (self as UIPickerViewDelegate)
        self.learnLang.dataSource = (self as UIPickerViewDataSource)
        
        
        knowLanguages = ["English", "Chinese", "Spanish", "Japanese", "French", "Korean"]
        
        learnLanguages = ["English", "Chinese", "Spanish", "Japanese", "French", "Korean"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    var retString = ""
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        retString = words[pickerData[pickerViewIndex()]]?[indexPath.row] ?? "-"
//        performSegue(withIdentifier: "wordOverlay", sender: nil)
//
//    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        TableViewSample.reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//
//        if segue.identifier == "wordOverlay" {
//            let destVC = segue.destination as! ViewControllerOverlay
//            destVC.word = retString
//            segue.perform()
//        }
//
//    }
    
    func pickerViewIndex() -> Int {
        return self.knowLang.selectedRow(inComponent: 0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 1
////        return self.knowLanguages.count
//    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.knowLanguages[row]
    }

}

