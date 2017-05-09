//
//  ViewController.swift
//  coolorsApp
//
//  Created by benzentarou on 2017/05/08.
//  Copyright © 2017年 benzentarou. All rights reserved.
//

import UIKit

extension UIColor {
    class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}

class ViewController: UIViewController {

    
    @IBOutlet var colorLabels: [UILabel]!
    
    var colors = [Int]()
    var colorsHex = [String]()
    var colorsFloat = [Float]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func generateColor(){
        for i in 0..<15 {
                colors.append(Int(arc4random_uniform(225)))
        }
        print(colors)
    }
    
    func add0(str: String) -> String{
        var str1 = str
        if(str.characters.count == 1){
            str1 = "0" + str
        }
        return str1
    }

    func translateCode(){
        //16進数に変換
        for i in 0..<15{
                colorsHex.append(add0(str: String(colors[i], radix: 16)))
        }
        //0~1の間に変換
        for i in 0..<5{
            for j in 0..<3{
//                colorsFloat.append(colors[i * 5 + j] / 255.0)
            }
        }
        print(colorsFloat)
    }
    
    func changeLabel(){
        for i in 0..<5{
            colorLabels[i].text = "#" + colorsHex[i+0] + colorsHex[i+1] + colorsHex[i+2]
        }
    }
    func changeColor(){
        for i in 0..<5{
            //extensionを使ってみた例
//            colorLabels[i].backgroundColor = UIColor.rgb(r: colors[i], g: colors[i+1], b: colors[i+2], alpha: 1)
            
            //上のコードと同じ
            colorLabels[i].backgroundColor = UIColor(red: CGFloat(colors[i]) / 255.0, green: CGFloat(colors[i+1]) / 255.0, blue: CGFloat(colors[i+2]) / 255.0, alpha: 1)
        }
        
    }
    
    @IBAction func reloadButton(_ sender: Any) {
        colors = []
        colorsFloat = []
        colorsHex = []
        generateColor()
        translateCode()
        changeLabel()
        changeColor()
    }

}

