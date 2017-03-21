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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        startLocation = touches.first?.locationInView(self)
        
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
}
