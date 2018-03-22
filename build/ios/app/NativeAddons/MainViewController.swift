//
//  MainViewController.swift
//  Unity-iPhone
//
//  Created by Nikolay Riskov on 3/20/18.
//

import UIKit

class MainViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var unityViewPlaceholder: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var ball: Ball!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Communicator.setDelegate(self)
    }
    
    @IBAction func onButton(_ sender: UIButton){
        let unityWindow = appDelegate.getUnityWindow()!
        unityWindow.frame = unityViewPlaceholder.frame;
        view.addSubview(unityWindow)
        
        view.bringSubview(toFront: ball)
    }
    
    @IBAction func onSliderChange(_ slider: UISlider){
        appDelegate.unityCallFunction("changeBoxPos", msg: "\(slider.value)")
    }
    
    
    //MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: view) else { return }
        ball.isDragging = ball.frame.contains(point)            
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ball.isDragging {
            guard let point = touches.first?.location(in: view) else { return }
            ball.center = point
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ball.isDragging, unityViewPlaceholder.frame.contains(ball.center) {
            var point = view.convert(ball.center, to: unityViewPlaceholder)
            point.x /= unityViewPlaceholder.bounds.width
            point.y /= unityViewPlaceholder.bounds.height
            appDelegate.unityCallFunction("spawnBall", msg: "\(point.x),\(point.y),4")
        }
        
        ball.isDragging = false
        UIView.animate(withDuration: 0.7, animations: {
            self.ball.transform.scaledBy(x: 0.5, y: 0.5)
        }) { _ in
            self.ball.returnToOriginalPos(animated: false)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        ball.isDragging = false
        ball.returnToOriginalPos(animated: true)
    }

}

extension MainViewController: CommunicatorDelegate{
    
    func display(_ string: String!) {
        statusLabel.text = string
    }
}
