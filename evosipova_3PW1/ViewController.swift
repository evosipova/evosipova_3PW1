//
//  ViewController.swift
//  evosipova_3PW1
//
//  Created by Elizabeth on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    @IBAction func button(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicFunctionality()
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        var set = Set<UIColor>()
        while set.count < views.count {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        let button = sender as? UIButton
        button?.isEnabled = false
        UIView.animate(withDuration: 2, animations: {
            for view in self.views {
                view.layer.cornerRadius = CGFloat(Int.random(in: 5..<25))
                view.backgroundColor = set.popFirst()

            }
        }) { completion in
            button?.isEnabled = true
        }
    }
    
    func basicFunctionality(){
        var set = Set<UIColor>()
        while set.count < views.count {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        UIView.animate(withDuration: 2, animations: {
            for view in self.views {
                view.layer.cornerRadius = CGFloat(Int.random(in: 5..<20))
                view.backgroundColor = set.popFirst()
            }
        })
    }
}
