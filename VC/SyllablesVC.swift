//
//  SyllablesVC.swift
//  Hotaling_Magneto1
//
//  Created by Student on 10/18/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class SyllablesVC: UIViewController, UITextFieldDelegate {

    //MARK: - IBOutlet variables
    //For label and text input
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var syllaLabel: UILabel!
    
    //MARK: - JS Runner for RiTA
    let jsRunner = RitaJSRunner()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textInput.becomeFirstResponder()
        textInput.delegate = self
        syllaLabel.sizeToFit()
    }
    
    //MARK: - IBAction function
    @IBAction func syllables(_ sender: Any) {
        let words = getWords(s: textInput.text ?? "")
        
        //clear label text
        syllaLabel.text = ""
        
        //get the syllables of each word given and set the label
        for word in words {
            let sylla = jsRunner.callJSsyllables(word: word)
            syllaLabel.text! += " \(sylla)"
        }
    }
    
    //MARK: - Helper Functions
    func textFieldShouldReturn(_ textInput: UITextField) -> Bool {
        textInput.resignFirstResponder()
        return false
    }
    
    //grabs all words if multiple are entered and returns array
    func getWords(s:String)->[String]{
        let words = s.components(separatedBy: .whitespaces)
        return words
    }


}
