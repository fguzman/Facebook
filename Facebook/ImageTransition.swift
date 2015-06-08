//
//  ImageTransition.swift
//  Facebook
//
//  Created by Francisco Guzman on 6/7/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
   
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var feedViewController = fromViewController as! NewsFeedViewController
        var photoViewController = toViewController as! PhotoViewController
        
        var destinationImageFrame = photoViewController.imageView.frame
        photoViewController.imageView.frame = feedViewController.selectedImageView.frame
        
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(0.3, animations: {
            
            toViewController.view.alpha = 1
            
            photoViewController.imageView.frame = destinationImageFrame
            
            }) { (finished: Bool) -> Void in
                self.finish()
        }
        
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var feedViewController = toViewController as! NewsFeedViewController
        var photoViewController = fromViewController as! PhotoViewController
        
        var destinationImageFrame = feedViewController.selectedImageView.frame
        var photoPosition = photoViewController.currentCenter
        feedViewController.selectedImageView.bounds = photoPosition
        
        feedViewController.selectedImageView.frame = photoViewController.imageView.frame
        
        fromViewController.view.alpha = photoViewController.scrollView.alpha
        
        fromViewController.view.alpha = 1
        
        UIView.animateWithDuration(0.3, animations: {
            
            fromViewController.view.alpha = 0
            
            feedViewController.selectedImageView.frame = destinationImageFrame
            
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
}
