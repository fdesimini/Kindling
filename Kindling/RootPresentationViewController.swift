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
            
        //this case uses the .Began property of UIPanGestureRecognizer
        case UIGestureRecognizerState.Began:
            println("Gesture Started")
        
        //this case uses the .Ended property of UIPanGestureRecognizer
        case UIGestureRecognizerState.Ended:
            println("Gesture has ended")
            
            if selectionState == SelectionState.DislikeSelection{
                view.backgroundColor = UIColor.redColor()
            } else if selectionState == SelectionState.LikeSelection{
                view.backgroundColor = UIColor.purpleColor()
            } else if selectionState == SelectionState.NoSelection{
                view.backgroundColor = UIColor.blackColor()
            }
            
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
               self.horizontalCentering.constant = 0
                self.view.layoutIfNeeded()
                }, completion: {
                    (complete) -> Void in

            })
        
        //this is the default case...I could also add a lot of this functionality in the .Changed 
        //property of UIPanGestureRecognizer (as per the James example of Friday lecture)
        
        default:
            println("all other touches")
            
           //need to explain what this code does
            if abs(translation.x) < view.bounds.size.width / 2
                
            {
                horizontalCentering.constant = -translation.x
                view.layoutIfNeeded()
            
            } else {
                
                if ((view.bounds.size.width)/2 + translation.x > view.bounds.size.width){
                    println("this has been Liked")
                    selectionState = SelectionState.LikeSelection
                    
                } else if ((view.bounds.size.width)/2 + translation.x < 0){
                    println("This has been DisLiked")
                    selectionState = SelectionState.DislikeSelection
                    
                } else {
                    println("move along, nothing to see here")
                    selectionState = SelectionState.NoSelection
                    
                }
            }

            }
          
        }

}
    



