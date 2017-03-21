//
//  DraggedImageView.swift
//  Preschool Game
//
//  Created by jn12abd on 20/02/2017.
//  Copyright © 2017 jn12abd. All rights reserved.
//

import UIKit

class DraggedImageView: UIImageView {
    
    var startLocation:CGPoint?
    var originalSize:CGSize?
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        startLocation = touches.first?.locationInView(self)
        
        // save original apple size and increase current size
        originalSize = self.frame.size
        let newSize = CGSize(width: self.frame.size.width * 1.4, height: self.frame.size.width * 1.4)
        self.frame = CGRect(origin: self.frame.origin, size: newSize)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {

        // Calculate offset
        let pt = touches.first?.locationInView(self)
        let dx = pt!.x - startLocation!.x
        let dy = pt!.y - startLocation!.y
        
        var newcenter = CGPoint(x: CGFloat(self.center.x + dx), y: CGFloat(self.center.y + dy))
        // Constrain movement into parent bounds
        let halfx = self.bounds.midX
        newcenter.x = max(halfx, newcenter.x)
        newcenter.x = min(self.superview!.bounds.size.width - halfx, newcenter.x)
        let halfy = self.bounds.midY
        // (self.superview!.bounds.size.height * 0.4) moves top boundary limit down by
        // 40% of screen height
        newcenter.y = max(halfy + (self.superview!.bounds.size.height * 0.4), newcenter.y)
        newcenter.y = min(self.superview!.bounds.size.height - halfy, newcenter.y)

        // Set new location
        self.center = newcenter
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Reset size
        self.frame = CGRect(origin: self.frame.origin, size: originalSize!)
    }
}
