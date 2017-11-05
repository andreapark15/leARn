//
//  ViewControllerLevels.swift
//  leARn
//
//  Created by Andrea Park on 2017-11-04.
//  Copyright © 2017 Andrea Park. All rights reserved.
//

import UIKit

class ViewControllerLevels: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var TableViewSample: UITableView!
    
    @IBOutlet weak var Easy: UIPickerView!
    var pickerData: [String] = [String] ()
    var words : [String : [String]] = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Easy.delegate = self
        self.Easy.dataSource = self
        
        self.TableViewSample.delegate = self
        self.TableViewSample.dataSource = self
        
        
        pickerData = ["Beginner", "Intermediate", "Advanced"]
        
        // B
        words[pickerData[0]] = ["human", "word2"]
        // I
        words[pickerData[1]] = ["Word3", "word4"]
        // A
        words[pickerData[2]] = ["Word5", "Word6"]
        
        //self.Easy.selectedRow(inComponent: 0)
        
    }
    
    
    var retString = ""
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        retString = words[pickerData[pickerViewIndex()]]?[indexPath.row] ?? "-"
        performSegue(withIdentifier: "wordOverlay", sender: nil)

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        TableViewSample.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "wordOverlay" {
            let destVC = segue.destination as! ViewControllerOverlay
            destVC.word = retString
            segue.perform()
        }
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words[pickerData[pickerViewIndex()]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let row = indexPath.row
        cell.textLabel?.text = words[pickerData[pickerViewIndex()]]?[row]
        return cell
    }
    
    func pickerViewIndex() -> Int {
        return self.Easy.selectedRow(inComponent: 0)
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    

}
