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
        
        //self.redSidePicker
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
    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let titleData = String(self.pickerContent[row])
//        let myTitle = NSAttributedString(string:titleData, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
//        return String(myTitle)
//    }
//    
//    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let titleData = String(self.pickerContent[row])
//        let myTitle = NSAttributedString(string:titleData, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
//        return myTitle
//    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = String(self.pickerContent[row])
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Arial", size:pickerView.bounds.height * 8/10 )!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        pickerLabel.attributedText = myTitle
        pickerLabel.textAlignment = .Center
        pickerLabel.backgroundColor = UIColor.clearColor()
        return pickerLabel
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("end picker : \(self.pickerContent[row])")
        //self.selectedGender = pickerContent[row]
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return self.blueSidePicker.bounds.height
    }

//    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
//        
//        
//        return view
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
