//
//  RootPresentationViewController.swift
//  Kindling
//
//  Created by Frank Desimini on 2015-08-25.
//  Copyright (c) 2015 Frank Desimini. All rights reserved.
//

import UIKit

class RootPresentationViewController: UIViewController {
    
    

    //was using this to test PanGestures - went down wrong track with this
//    @IBAction func testPanGestureButton(sender: AnyObject) {
//        
//        println("button has been pressed")
//        
//    }

    @IBOutlet weak var cardContainer: UIView!
    
    @IBOutlet weak var horizontalCentering: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPan (sender:UIPanGestureRecognizer){
        
        let defaultState = sender.translationInView(view)
        
        switch sender.state {
        case UIGestureRecognizerState.Began:
            println("Gesture Started")
 
        case UIGestureRecognizerState.Changed:
            println("User cancelled this")
            

           if abs(defaultState.x) < view.bounds.size.width / 2
          
           {
                horizontalCentering.constant = -defaultState.x
                view.layoutIfNeeded()
            }
            
            
        case UIGestureRecognizerState.Ended:
            println("Gesture has ended")
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
               self.horizontalCentering.constant = 0
                self.view.layoutIfNeeded()
                }, completion: {
                    (complete) -> Void in

            })
            
        default:
            println("all other touches")
            
            horizontalCentering.constant = -defaultState.x
          
            //why do we need this function called?
            view.layoutIfNeeded()
            
        }
        
    }
    



}
