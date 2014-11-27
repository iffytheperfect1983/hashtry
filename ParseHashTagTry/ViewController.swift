//
//  ViewController.swift
//  ParseHashTagTry
//
//  Created by iffytheperfect on 11/19/14.
//  Copyright (c) 2014 iffytheperfect. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                self.myTextView.text = "ABCD #abx #al"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func parseHashTagButtonPressed(sender: AnyObject) {
        
        self.parseHashtag()
        
    }

    func parseHashtag() -> [String]?
    {
        println("Parsing Hash Tag..")
//        let regex: NSRegularExpression = NSRegularExpression(pattern: "#(\\w+)", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)!

        let regex: NSRegularExpression = NSRegularExpression(pattern: "#([A-Za-z]\\w+)", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)!
        let text = self.myTextView.text as NSString
        
        let matches = regex.matchesInString(text, options: NSMatchingOptions.allZeros, range: NSMakeRange(0, text.length))
        
        var arrayOfTags = [String]()
        
        for match in matches
        {
            let wordRange = match.rangeAtIndex(1) as NSRange
            let word = text.substringWithRange(wordRange) as NSString
            let wordString = String(word)
            println("Found tag \(word)")
            arrayOfTags.append(wordString)
        }
        
        return arrayOfTags
        
//        let emailRegex: NSString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}"
//        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)!
//        return emailTest.evaluateWithObject(emailString)
    }
    
}

