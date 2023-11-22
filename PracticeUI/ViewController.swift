//
//  ViewController.swift
//  PracticeUI
//
//  Created by A on 2023/11/15.
//

import UIKit
struct family{
    let myName: String
    let bestFriend: String
    let nextFriend: String
    let myBrother: String
}
class ViewController: UIViewController {

    let friendName: [String]=["Henry", "KIm", "Lee", "Key"]
    var koreanName: [String: String]=["Henry" : "김", "KIm": "동영", "Lee": "영"]
    var count = 0
    let friend = family(myName: "Henry2",
                        bestFriend: "Kim2",
                        nextFriend: "Lee2",
                        myBrother: "Key2"
    )
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var bestFriend: UILabel!
    @IBOutlet weak var nextFriend: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
        
    }

    @IBAction func didTapButton(_ sender: Any) {
        NameLabel.text = friend.myName
        bestFriend.text = friend.bestFriend
        nextFriend.text = friend.nextFriend
        
    }
    
}

