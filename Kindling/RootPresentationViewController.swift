//
//  RootPresentationViewController.swift
//  Kindling
//
//  Created by Frank Desimini on 2015-08-25.
//  Copyright (c) 2015 Frank Desimini. All rights reserved.
//

import UIKit

class RootPresentationViewController: UIViewController {
    
    enum SelectionState {
        
        case NoSelection
        case LikeSelection
        case DislikeSelection
    
    }
    
    var selectionState = SelectionState.NoSelection
    
 
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
        
        // translationInView is translation in the coordinate system of the specified view
        let translation = sender.translationInView(view)
        
        switch sender.state {
        case UIGestureRecognizerState.Began:
            println("Gesture Started")
 
//        case UIGestureRecognizerState.Changed:
//            println("changed state")
            
//           if abs(translation.x) < view.bounds.size.width / 2
//          
//           {
//                horizontalCentering.constant = -translation.x
//                view.layoutIfNeeded()
//            }
            
            
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
            
//            horizontalCentering.constant = -translation.x
            
            if abs(translation.x) < view.bounds.size.width / 2
                
            {
                horizontalCentering.constant = -translation.x
                view.layoutIfNeeded()
            
            } else {
                if ((view.bounds.size.width)/2 > view.bounds.size.width){
                    println("this is now been moved to the left")
                } else if ((view.bounds.size.width)/2 < view.bounds.size.width){
                    println("This has been moved to the right")
                } else {
                    println("nothing to see here")
                }
            }

            }
          
        }

}
    



