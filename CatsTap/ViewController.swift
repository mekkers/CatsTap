//
//  ViewController.swift
//  CatsTap
//
//  Created by igor mekkers on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton()
    let viewSize = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = CGFloat.random(in: 20...(viewSize.width/2))
        createButton(myButton: button, x: viewSize.midX-(size/2), y: viewSize.midY-(size/2), size: size)
        
        
    }
    @IBAction func buttonPressed(sender: UIButton) {
        
        let positionOfStart = getPosition()
        sender.frame.origin.x = positionOfStart.positionX
        sender.frame.origin.y = positionOfStart.positionY
        sender.frame.size.width = positionOfStart.sizeOfButton
        sender.frame.size.height = positionOfStart.sizeOfButton
        sender.layer.cornerRadius = sender.frame.size.width/2
        sender.backgroundColor = randomColor()

    }
    func getPosition() -> (positionX: CGFloat, positionY: CGFloat, sizeOfButton: CGFloat) {
        let safe = self.view.safeAreaInsets
        let size = CGFloat.random(in: 30...viewSize.width/2)
        let x = CGFloat.random(in: 0...(viewSize.width-size))
        let y = CGFloat.random(in: safe.top...(viewSize.height - safe.top - safe.bottom - size))
        
        return (x, y, size)
        
    }
    func randomColor() -> UIColor {
        let red = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let green = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let blue = CGFloat(arc4random()) / CGFloat(UInt32.max)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    func createButton(myButton: UIButton, x: CGFloat, y: CGFloat, size: CGFloat) {
        myButton.frame = CGRect(x: x, y: y, width: size, height: size)
        myButton.backgroundColor = randomColor()
        self.view.addSubview(myButton)
        myButton.layer.cornerRadius = myButton.frame.size.width/2
        myButton.addTarget(self, action: #selector(self.buttonPressed(sender:)), for: .touchUpInside)
    }


}

