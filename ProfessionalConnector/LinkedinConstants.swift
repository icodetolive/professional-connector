//
//  LinkedinConstants.swift
//  ProfessionalConnector
//
//  Created by Sugandha Naolekar on 10/15/16.
//  Copyright © 2016 icode. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Linkedin {
        static let BaseURL = "https://www.linkedin.com/uas/oauth2"
        static let AuthorizationEndPoint = "authorization"
        static let AccessTokenEndPoint = "accessToken"
        static let RedirectURI = "https://www.pretentiousgeek.me/oauth"
    }
    
    struct LinkedinAuthorization {
        static let URL = Constants.Linkedin.BaseURL+"/"+Constants.Linkedin.AuthorizationEndPoint
        
        struct ParameterKeys {
            static let ResponseType = "response_type"
            
            static let APIKey = "client_id"
            
            static let APISecret = "client_secret"
            
            static let RedirectURI = "redirect_uri"
            
            static let State = "state"
            
            static let Scope = "scope"
            
            static let Format = "format"
        }
        
        
        struct ParameterValues {
            
            static let ResponseType = "code"
            
            static let APIKey = "Your_API_Key"
            
            static let APISecret = "Your_API_Secret"
            
            static let State = "linkedin\(Int(NSDate().timeIntervalSince1970))"
            
            static let RedirectURL = Constants.Linkedin.RedirectURI.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())!
            
            static let BasicScope = "r_basicprofile"
            
            static let EmailScope = "r_emailaddress"
            
            static let JSONFormat = "json"
            
        }
    }
    
    struct LinkedinAccessToken {
        static let URL = Constants.Linkedin.BaseURL+"/"+Constants.Linkedin.AccessTokenEndPoint
    }
}

