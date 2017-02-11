//
//  SelectorViewController.swift
//  Cassini
//
//  Created by Jelmar Van Aert on 11/02/2017.
//  Copyright © 2017 Jelmar Van Aert. All rights reserved.
//

import UIKit

class SelectorViewController: UIViewController, UISplitViewControllerDelegate {
    
    private struct Storyboard {
        static let SHOW_IMAGE = "Show Image"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        //If there is nothing in the detailView don't collapse over the master
        if primaryViewController.content == self {
            if let ivc = secondaryViewController as? ImageViewController, ivc.imageURL == nil {
                return false
            }
        }
        return true
    }
    
    @IBAction func showImage(_ sender: UIButton) {
        if let ivc = splitViewController?.viewControllers.last?.content as? ImageViewController{
            let imageName = sender.currentTitle
            ivc.imageURL = Constants.NASAImageNamed(imageName: imageName)
            ivc.title = imageName
        }else {
            performSegue(withIdentifier: Storyboard.SHOW_IMAGE, sender: sender)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.SHOW_IMAGE {
            if let ivc = segue.destination.content as? ImageViewController {
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageURL = Constants.NASAImageNamed(imageName: imageName)
                ivc.title = imageName
            }
        }
    }
}

extension UIViewController {
    var content: UIViewController {
        if let vc = self as? UINavigationController {
            return vc.visibleViewController ?? self
        } else {
            return self
        }
    }
}
