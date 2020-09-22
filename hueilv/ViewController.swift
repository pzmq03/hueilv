//
//  ViewController.swift
//  hueilv
//
//  Created by 吴迪 on 2020/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var xianShilabel: UILabel!
    @IBOutlet weak var renminbiTextfield: UITextField!
    @IBOutlet weak var ruyuanTextField: UITextField!
    var hueilv: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        api()
        renminbiTextfield.delegate = self
        renminbiTextfield.tag = 1
        ruyuanTextField.delegate = self
        ruyuanTextField.tag = 2
    }
    func api(){
        do {
            try ApiClient.huilvApi(completion: { data in
                if let num: Double = Double( data.result.rate ) {
                    self.hueilv = num
                }
            })
        } catch {
            xianShilabel.text = error.localizedDescription
        }
    }

}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if hueilv != 0 {
            let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            guard let num:Double = Double(text) else {return true}
            //inputview个性化设置
            switch textField.tag {
            case 1:
                xianShilabel.text = "\(Int(num/hueilv))"
            case 2:
                xianShilabel.text = "\(Int(num*hueilv))"
            default:break
            }
        }
        return true
    }
}
