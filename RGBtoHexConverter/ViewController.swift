//
//  ViewController.swift
//  RGBtoHexConverter
//
//  Created by UMUT GUDUL on 1.05.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectedColor: UILabel!
    var selectedIndex : Int = 0 // for selected segment
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        selectedIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        if selectedIndex == 0 {
            btnConvert.setTitle("Convert: RGB to HEX", for: UIControl.State.normal)
        } else {
            btnConvert.setTitle("Convert: HEX to RGB", for: UIControl.State.normal)
        }
        
    }
    
    @IBAction func btnConvertClicked(_ sender: UIButton) {
        
        if selectedIndex == 0 {
            // RGB to HEX
            convertRGBtoHEX()
        } else {
            // HEX to RGB
            convertHEXtoRGB()
        }
        
        
        
    }
    
    func convertRGBtoHEX() {
        if let redValue = UInt8(txtRed.text!){
            if let greenValue = UInt8(txtGreen.text!) {
                if let blueValue = UInt8(txtBlue.text!){
                    let redHex = String(format: "%2X", redValue)
                    let greenHex = String(format: "%2X", greenValue)
                    let blueHex = String(format: "%2X", blueValue)
                    lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
        
        
        
    }
    func convertHEXtoRGB(){
        
        if let redValue = UInt8(txtRed.text!, radix: 16){
            if let greenValue = UInt8(txtGreen.text!, radix: 16) {
                if let blueValue = UInt8(txtBlue.text!, radix: 16){
                    lblResult.text = "RED : \(redValue) \n GREEN : \(greenValue) \n BLUE : \(blueValue)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
        
        
    }
    
    


}

