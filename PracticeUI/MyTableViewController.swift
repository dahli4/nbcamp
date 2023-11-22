//
//  MyTableViewController.swift
//  PracticeUI
//
//  Created by A on 2023/11/17.
//

import UIKit

class MyTableViewController: UIViewController {
    @IBOutlet weak var MyTableView: UITableView!

    let friendName: [String]=["Henry", "Kim", "Lee", "Key"]

    override func viewDidLoad() {
        super.viewDidLoad()
        MyTableView.backgroundColor = .blue
        MyTableView.delegate = self
        MyTableView.dataSource = self
    }

}
extension MyTableViewController: UITableViewDelegate,UITableViewDataSource{
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyTableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
        cell.textLabel?.text = friendName[indexPath.row]
        return cell
    }
}
