//
//  LinkedinSignInViewController.swift
//  ProfessionalConnector
//
//  Created by Sugandha Naolekar on 10/15/16.
//  Copyright © 2016 icode. All rights reserved.
//

import UIKit

class LinkedinSignInViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        
        startAuthorization()
    }
    
    func startAuthorization() {
     
                
        var authorizationURLString = Constants.LinkedinAuthorization.URL+"?"
        authorizationURLString += Constants.LinkedinAuthorization.ParameterKeys.ResponseType+"="+Constants.LinkedinAuthorization.ParameterValues.ResponseType+"&"
        authorizationURLString += Constants.LinkedinAuthorization.ParameterKeys.APIKey+"="+Constants.LinkedinAuthorization.ParameterValues.APIKey+"&"
        authorizationURLString += Constants.LinkedinAuthorization.ParameterKeys.RedirectURI+"="+Constants.LinkedinAuthorization.ParameterValues.RedirectURL+"&"
        authorizationURLString += Constants.LinkedinAuthorization.ParameterKeys.State+"="+Constants.LinkedinAuthorization.ParameterValues.State+"&"
        authorizationURLString += Constants.LinkedinAuthorization.ParameterKeys.Scope+"="+Constants.LinkedinAuthorization.ParameterValues.BasicScope+","+Constants.LinkedinAuthorization.ParameterValues.EmailScope+"&"
        authorizationURLString += Constants.LinkedinAuthorization.ParameterKeys.Format+"="+Constants.LinkedinAuthorization.ParameterValues.JSONFormat
        
        print(authorizationURLString)
        
        // Create a URL request and load it in the web view.
        let request = NSURLRequest(URL: NSURL(string: authorizationURLString)!)
        webView.loadRequest(request)
        
    }

}

