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
        var colors = getRandomColorsSet()
        for view in views{
            view.layer.cornerRadius = .random(in: 0...40)
            view.backgroundColor = colors.popFirst()
        }
    }
    
    func getRandomColorsSet() -> Set<UIColor>{
        var colorsArray = Set<UIColor>()
        var num: UInt64 = 0
        while (colorsArray.count < views.count) {
            var color = "#"
            let symbols = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a","b","c","d","e","f"]
            while (color.count < 9) {
                color += String(symbols[Int.random(in: 0..<16)])
            }
            let scanner = Scanner(string:
                                    String(color[color.index(color.startIndex,
                                                             offsetBy:1)...]))
            scanner.scanHexInt64(&num)
            colorsArray.insert(UIColor(red: CGFloat((num & 0xff000000) >> 24) / 255,
                                  green: CGFloat((num & 0x00ff0000) >> 16) / 255,
                                  blue: CGFloat((num & 0x0000ff00) >> 8) / 255,
                                  alpha: CGFloat(num & 0x000000ff) / 255))
        }
        return colorsArray
    }
    
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        var set =  getRandomColorsSet()
        let button = sender as? UIButton
        button?.isEnabled = false
        UIView.animate(withDuration: 2, animations: {
            for view in self.views {
                view.layer.cornerRadius = CGFloat(Int.random(in: 5..<20))
                view.backgroundColor = set.popFirst()
                view.transform = CGAffineTransform(
                                        scaleX: CGFloat.random(in: -2...2),
                                            y: CGFloat.random(in: -2...2)
                                    )
            }
        }) { completion in
            button?.isEnabled = true
        }
    }
}
