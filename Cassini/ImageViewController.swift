//
//  ImageViewController.swift
//  Cassini
//
//  Created by Jelmar Van Aert on 10/02/2017.
//  Copyright © 2017 Jelmar Van Aert. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1
        }
    }
    
    var imageURL: NSURL? {
        didSet{
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private func fetchImage(){
        if let url = imageURL {
            spinner.startAnimating()
            //DispatchQueue replaces 'dispatch_async' in swift 3
            //Go to the background thread
            DispatchQueue.global(qos: .userInitiated).async {
                let contentsOfUrl =  NSData(contentsOf: url as URL)
                //Go back to the main queue to do UI updates
                DispatchQueue.main.async {
                    if url == self.imageURL {
                        if let imageData = contentsOfUrl{
                            self.image = UIImage(data: imageData as Data)
                        }
                    }else {
                        print("ignored data returned")
                        self.spinner?.stopAnimating()
                    }
                }
            }
        }
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }
    
}
