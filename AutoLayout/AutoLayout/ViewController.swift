//
//  ViewController.swift
//  AutoLayout
//
//  Created by A on 2023/12/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func tappedButton(_ sender: Any) {
        self.textLabel.text = "버튼을 클릭했다."
        let button = sender as? UIButton
        button?.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

