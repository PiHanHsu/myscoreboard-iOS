    //
    //  ViewController.swift
    //  MyScoreBoardapp
    //
    //  Created by stephanie yang on 2016/4/24.
    //  Copyright © 2016年 PiHan Hsu. All rights reserved.
    //

    import UIKit

        class ViewController: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
            
            @IBOutlet weak var profile: UIButton!
            @IBOutlet weak var rank: UIButton!
            @IBOutlet weak var team: UIButton!
            
            
            var pageViewController:UIPageViewController!
            let pages = ["pageOneMyTeam","pageTwoAddTeam"]

            //MARK: Page View Controller DataSource
            
            func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
                
                if let index = pages.indexOf(viewController.restorationIdentifier!){
                
                    if index > 0 {
                    return viewControllerAtIndex(index - 1 )
                    }
                }
                return nil
            }
            
            func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
                
                if let index = pages.indexOf(viewController.restorationIdentifier!){
                    
                    if index < pages.count - 1 {
                        return viewControllerAtIndex(index + 1 )
                    }
                }
                return nil
            }
            
    //        UIViewController? optional時機？
            func viewControllerAtIndex(index: Int) -> UIViewController? {
                let vc = storyboard?.instantiateViewControllerWithIdentifier(pages[index])
                return vc
            
            }
            
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                if let vc = storyboard?.instantiateViewControllerWithIdentifier("PageViewController"){
                
                self.addChildViewController(vc)
                self.view.addSubview(vc.view)
                    
                pageViewController = vc as! UIPageViewController
                pageViewController.dataSource = self
                pageViewController.delegate = self
                    
                pageViewController.setViewControllers([viewControllerAtIndex(0)!], direction: .Forward, animated: true, completion: nil)
                pageViewController.didMoveToParentViewController(self)
                
                
                }

            }

            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
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
