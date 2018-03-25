//
//  Ball.swift
//  Unity-iPhone
//
//  Created by Nikolay Riskov on 3/21/18.
//

import UIKit

class Ball: UIView {

    private var originalFrame: CGRect!
    var isDragging = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        originalFrame = frame
        layer.cornerRadius = bounds.width/2
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        originalFrame = self.frame
        layer.cornerRadius = bounds.width/2
        clipsToBounds = true
    }
    
    func getOriginalFrame() -> CGRect{
        return originalFrame
    }
    
    func returnToOriginalPos(animated: Bool){
        let duration = animated ? 0.75 : 0
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .beginFromCurrentState, animations: {
            self.frame = self.originalFrame
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
}
