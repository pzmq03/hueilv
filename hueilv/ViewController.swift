//
//  ViewController.swift
//  hueilv
//
//  Created by 吴迪 on 2020/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rmbLabel: UILabel!
    @IBOutlet weak var ryLabel: UILabel!
    @IBOutlet weak var jineTextfield: UITextField!
    var hueilv: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        jineTextfield.delegate = self
        hueilv = UserDefaults.standard.double(forKey: "huilu")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let num:Double = 100
        ryLabel.text = xiaoshudian(data: Double(num/hueilv))
        rmbLabel.text = xiaoshudian(data: Double(num*hueilv))
    }
    
    func xiaoshudian(data:Double) -> String{
        let str = String(format: "%.2f", data)
        return str
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let num:Double = text.isEmpty ? 100 : Double(text)!
        //inputview个性化设置
        ryLabel.text = xiaoshudian(data: Double(num/hueilv))
        rmbLabel.text = xiaoshudian(data: Double(num*hueilv))
        return true
    }
}
