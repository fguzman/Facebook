//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Francisco Guzman on 6/6/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var actions: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    var image: UIImage!
    
    var currentCenter: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentCenter = imageView.bounds
        
        imageView.image = image
        
        scrollView.contentSize = CGSizeMake(320, 568)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        println("got pressed")
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        println("recognized scroll")
        
//        if scrollView.contentOffset.y < 0 {
//            
//            currentCenter = imageView.bounds
//            
//            var newAlpha = convertValue(CGFloat(scrollView.contentOffset.y), r1Min: CGFloat(0), r1Max: CGFloat(-600), r2Min: CGFloat(1), r2Max: CGFloat(0))
//            
//            scrollView.alpha = CGFloat(newAlpha)
//            
//            UIView.animateWithDuration(0.3, animations: { () -> Void in
//                
//                
//                self.doneButton.alpha = 0
//                self.actions.alpha = 0
//                }, completion: nil)
//            
//            
//            
//        } else if scrollView.contentOffset.y >= 0 {
//            
//            UIView.animateWithDuration(0.1, animations: { () -> Void in
//                self.doneButton.alpha = 1
//                self.actions.alpha = 1
//                }, completion: nil)
//        }
    }
    
    
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            
            currentCenter = imageView.bounds
            
            println("\(currentCenter)")
            
            if scrollView.contentOffset.y < -100  {
                
                dismissViewControllerAnimated(true, completion: nil)
                
            }
            
            println("user stopped dragging")
    }


}
