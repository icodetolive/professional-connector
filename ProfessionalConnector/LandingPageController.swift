//
//  ViewController.swift
//  ProfessionalConnector
//
//  Created by Sugandha Naolekar on 10/13/16.
//  Copyright © 2016 icode. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {
    
    
    
    @IBOutlet weak var btnLinkedInSignIn: UIButton!
    
    @IBOutlet weak var btnProfileView: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        btnLinkedInSignIn.enabled = true
        btnLinkedInSignIn.alpha = 1.0
        btnProfileView.enabled = false
        btnProfileView.alpha = 0.5
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        //checkExistingAccessToken()
    }
    
    func checkExistingAccessToken() {
        
    }
}

