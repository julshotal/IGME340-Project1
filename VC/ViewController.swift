//
//  ViewController.swift
//  Hotaling_Magneto1
//
//  Created by Student on 9/17/19.
//  Copyright © 2019 Student. All rights reserved.
//

//MARK: - Setup
import UIKit
let mySetChangedNotification = NSNotification.Name("setChangedNotification")
let isPad = UIDevice.current.userInterfaceIdiom == .pad

//MARK: - View Controller Class
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: - Variables
    var wordSet:[String] = []
    var backgroundImage:UIImage?
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let w = Words.shared
        let paleGreen = UIColor(red: 0.705, green: 0.772, blue: 0.745, alpha: 1)
        view.backgroundColor = paleGreen
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(setChanged), name: mySetChangedNotification, object: nil)
        
        //If there is no user default yet, use the example word set
        let defaultSet = UserDefaults.standard.array(forKey: "UsedSet") as? [String] ?? w.getWords("Example Haiku")
        placeWords(set: defaultSet)
        
    }
    
    
    //MARK: - Storyboard Action Functions
    @IBAction func unwindToMain(segue:UIStoryboardSegue) {
        if segue.identifier == "DoneTapped"{
        
            removeWords()
            
            let menuVC = segue.source as! MenuVC
            wordSet = menuVC.selectedSet
            
            //Set new wordset to the user default
            UserDefaults.standard.set(wordSet, forKey: "UsedSet")
            
            placeWords(set: wordSet)
        }
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    //Share poem via the activity view controller for phone and Ipad
    @IBAction func share(_ sender:AnyObject) {
        let image =  self.view.takeSnapshot()
        let textToShare = "Check out my poetry!"
        let objectToShare:[AnyObject] = [textToShare as AnyObject, image!]
        let activityVC = UIActivityViewController(activityItems: objectToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.print]
        
        //for iPad
        let popoverMenuViewController = activityVC.popoverPresentationController
        popoverMenuViewController?.permittedArrowDirections = .any
        popoverMenuViewController?.barButtonItem = sender as? UIBarButtonItem
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    //MARK: - Display Functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image:UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        backgroundImage = image
        (self.view as! UIImageView).contentMode = .center
        (self.view as! UIImageView).image = backgroundImage
        picker.dismiss(animated:true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Removes all labels from the view
    func removeWords() {
        for v in view.subviews{
            if v is UILabel{
                v.removeFromSuperview()
            }
        }
    }
    
    //Takes in an array of strings and places them as labels in neat rows
    func placeWords(set:[String]) {
        var increment = 10
        var rows = 1
        
        var x = 10
        var y = 0
        
        for word in set {
            let l = UILabel()
            l.backgroundColor = UIColor.white
            l.text = " \(word) "
            l.font = l.font.withSize(screenWidth/18)
            l.sizeToFit()
            
            let magnetW = Int(l.frame.size.width)
            let magnetH = Int(l.frame.size.height)
            
            x = increment + magnetW/2
            
            if (x + magnetW/2) >= (Int(screenWidth) - 5) {
                x = 10 + (magnetW/2)
                increment = 10
                rows += 1
            }
            
            y = (rows * Int(screenHeight/15)) + magnetH/2
            
            l.center = CGPoint(x:x, y:y)
            view.addSubview(l)
            
            increment += (magnetW + 10)
            
            l.layer.masksToBounds = true
            l.layer.cornerRadius = 5
            
            l.isUserInteractionEnabled = true
            
            //Add gesture recognziers for moving and removing
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(doPanGesture))
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
            tapGesture.numberOfTapsRequired = 2

            l.addGestureRecognizer(tapGesture)
            l.addGestureRecognizer(panGesture)
        }
    }
    
    //MARK: - @objc Functions
    //Change the displayed wordset when selected
    @objc func setChanged(n: Notification) {
        let data = n.userInfo!
        let set = data["set"] as! [String]
        
        removeWords()
        placeWords(set: set)
    }
    
    //Drag and move the words
    @objc func doPanGesture(panGesture:UIPanGestureRecognizer) {
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }
    
    //Double tap words to remove them
    @objc func labelTapped(tapGesture: UITapGestureRecognizer){
        let label = tapGesture.view as! UILabel
        label.removeFromSuperview()
    }
    
    //MARK: - Deinit
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}



