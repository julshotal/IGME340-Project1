//
//  UIView+takeSnapshot.swift
//  Hotaling_Magneto1
//
//  Created by Student on 10/9/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

extension UIView {
    
    //Take screenshot image of the app view
    func takeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
