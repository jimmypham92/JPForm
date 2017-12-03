//
//  UIViewExtensions.swift
//  JPForm
//
//  Created by Jimmy Pham on 11/12/17.
//  Copyright © 2017 Jimmy Pham. All rights reserved.
//

import UIKit

extension UIView {
    
    var size: CGSize {
        get {
            return self.frame.size
        } set(value) {
            self.frame.size = value
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        } set(value) {
            self.frame.origin.x = value
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame.origin.y = value
        }
    }
    
    var w: CGFloat {
        get {
            return self.frame.size.width
        } set(value) {
            self.frame.size.width = value
        }
    }
    
    var h: CGFloat {
        get {
            return self.frame.size.height
        } set(value) {
            self.frame.size.height = value
        }
    }
    
    var maxX: CGFloat {
        return self.frame.maxX
    }
    
    var maxY: CGFloat {
        return self.frame.maxY
    }
}
