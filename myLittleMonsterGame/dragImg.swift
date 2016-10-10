//
//  dragImg.swift
//  myLittleMonsterGame
//
//  Created by Kacper Kowalski on 07.09.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import Foundation
import UIKit

class dragImg: UIImageView {
    
    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first, let target = dropTarget {
            
            let position = touch.locationInView(self.superview)
            
            if CGRectContainsPoint(target.frame, position) {
        }
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name:"onTargetDropped", object:nil))
            
            
        
        
        self.center = originalPosition
    }
    
    

}
}