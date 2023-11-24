//
//  ViewController.swift
//  231124P
//
//  Created by A on 2023/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: Any) {
        print("방가방가")
        view.backgroundColor = .yellow
        helloLabel.text = "헬로우"
    }
    
}

