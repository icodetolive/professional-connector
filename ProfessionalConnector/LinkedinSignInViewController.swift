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
        authorizationURLString += Constants.Linkedin.ClientID+"="+Constants.Linkedin.APIKey+"&"
        authorizationURLString += Constants.Linkedin.RedirectURI+"="+Constants.Linkedin.escapedRedirectURL+"&"
        authorizationURLString += Constants.LinkedinAuthorization.ParameterKeys.State+"="+Constants.LinkedinAuthorization.ParameterValues.State+"&"
        authorizationURLString += Constants.LinkedinAuthorization.ParameterKeys.Scope+"="+Constants.LinkedinAuthorization.ParameterValues.BasicScope+","+Constants.LinkedinAuthorization.ParameterValues.EmailScope+"&"
        authorizationURLString += Constants.LinkedinAuthorization.ParameterKeys.Format+"="+Constants.LinkedinAuthorization.ParameterValues.JSONFormat
        
        print(authorizationURLString)
        
        // Create a URL request and load it in the web view.
        let request = NSURLRequest(URL: NSURL(string: authorizationURLString)!)
        webView.loadRequest(request)
        
    }
    
    //before a webview begins loading a new frame, this function returns a Bool value - if the webview should begin loading the new content
    //    A response containing authorization code somehwat looks like this:
    
    //"Your_redirect_URI?code="returned_auth_code&state="state_set_constants"
   func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        //get access to the URL through the request parameter
        let url = request.URL!
        
        
        print("Url::\(url)")
        if url.absoluteString.rangeOfString("error") != nil {
            print("user pressed cancel")
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        //examine the host property of the url to ensure if it's the authorization callback url set as per the app settings
        if url.host == "www.pretentiousgeek.me" {
            
            //state check to prevent CSRF attack
            let urlComponents = url.absoluteString.componentsSeparatedByString("?")
            //            let state =
            //make sure, authorization code is contained
            if url.absoluteString.rangeOfString("code") != nil {
                
                //Extract authorization code
                let code = urlComponents[1].componentsSeparatedByString("=")[1]
                
                requestForAccessToken(code)
            }
        }
        
        return true
    }
    
    
    func requestForAccessToken(authorizationCode: String) {
        
        // Set the POST parameters.
        var postParams = Constants.LinkedinAccessToken.ParameterKeys.GrantType+"="+Constants.LinkedinAccessToken.ParameterValues.AuthorizationCode+"&"
        postParams += Constants.LinkedinAccessToken.ParameterKeys.Code+"="+authorizationCode+"&"
        postParams += Constants.Linkedin.RedirectURI+"="+Constants.Linkedin.escapedRedirectURL+"&"
        postParams += Constants.Linkedin.ClientID+"="+Constants.Linkedin.APIKey+"&"
        postParams += Constants.Linkedin.ClientSecret+"="+Constants.Linkedin.APISecret+"&"
        
    }

}

