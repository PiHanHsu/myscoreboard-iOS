//
//  AddTeamMemberViewController.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/5/2.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

protocol AddMemberDelegate {
    func addMemberChanged(newMember:String)
}

class AddTeamMemberViewController: UIViewController {
    @IBOutlet weak var addMemberText: UITextField!
    
    var team:Team?
    var deldgate:AddMemberDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMemberText.text = team?.TeamName
        
        let teams = Teams.sharedInstance
        
        print(teams)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTeamNameBtn(sender: AnyObject) {
        
        
    }
//    @IBAction func saveBtn(sender: AnyObject) {
//        delegate?.nameChanged(NameTextField.text!)
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }

    
    
    @IBAction func goBackTeam(sender: AnyObject) {
       self.navigationController?.popViewControllerAnimated(true)
        
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
