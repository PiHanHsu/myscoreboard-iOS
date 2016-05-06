//
//  GameScoreViewController.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/6/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class GameScoreViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var redSidePicker: UIPickerView!
    @IBOutlet weak var blueSidePicker: UIPickerView!
    
    var pickerContent:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.blueSidePicker.dataSource = self
        self.blueSidePicker.delegate = self
        self.redSidePicker.dataSource = self
        self.redSidePicker.delegate = self
        
        for i in 0...21 {
            self.pickerContent.append(i)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIPickerViewDataSource
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerContent.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(self.pickerContent[row])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("end picker : \(self.pickerContent[row])")
        //self.selectedGender = pickerContent[row]
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
