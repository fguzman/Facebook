//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    
    var selectedImageView: UIImageView!
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("photoSegue", sender: self)
        
        println("tap recognized")
    }
    
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject!) {
        
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        
        destinationViewController.image = selectedImageView.image
        
        imageTransition = ImageTransition()
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        destinationViewController.transitioningDelegate = imageTransition
    }
}
