//
//  ViewController.swift
//  Jan30Test
//
//  Created by Big Mac on 1/30/18.
//  Copyright © 2018 ICEN450. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var enterTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    
    //MARK: Actions
    
    
    
    
    //Function associated with "Button to send data"
    //This function will trigger when a user pushes the button
    //Code based on tutorial: http://swiftdeveloperblog.com/http-get-request-example-in-swift/
    
    
    @IBAction func sendDataButton(sender: AnyObject) {
        
        //Start by reading data in "enterTextField"
        let dataInput = enterTextField.text
        
        
        //Check if our user didn't actually enter a string
        if dataInput?.isEmpty == true
        {
            return
        }
            
        //if not we can send the value
        else
        {
            
            //Start declaring variables to throw in our NSURL object
            
            
            /*
            Our stuff:  https://beenotified.com
            IP Address: 54.85.94.92
            
            
            There is other stuff we can add to our NSURL and 
            request variables depending on what we want to do.
            
            
            My goal here:
            -Connect to a server
            -Get proof of connecting to a server
            -Return some kind of information
                ex: IP, web page information, etc
            
            
            */
            
            //Throw in a URL to test, plus our data however we want to
            
            let stringUrl =  dataInput!
            
            
            //Create NSURL object to talk to the server
            let ourUrl = NSURL(string: stringUrl)
            
            //Create our URL request
            let request = NSMutableURLRequest(URL: ourUrl!)
            
            
            //Set HTTP method for our request object
            request.HTTPMethod = "GET"
            
            
            
            //Execute our HTTP Request
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
                data, response, error in
            
            
            
            
            // Check for error
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Print out response string
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            
            
            // Convert server json response to NSDictionary
            do {
                if let convertedJsonIntoDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    
                    // Print out dictionary
                    print(convertedJsonIntoDict)
                    
                    // Get value by key
                    let firstNameValue = convertedJsonIntoDict["userName"] as? String
                    print(firstNameValue!)
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
            
            
            
        }//else
        
        
        
        
    }//sendDataButton
    
    
    
}//UIViewController

