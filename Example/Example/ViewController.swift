//
//  ViewController.swift
//  Example
//
//  Created by A on 2023/12/11.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let data = ["Option 1", "Option 2", "Option 3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
        ///UILabel
        //        setUILabel()
        
        ///UIImageView
        //        setUIImageView()
        
        ///UITextField
//        setUITextField()
        
        ///UIButton
//        setUIButton()
        
        ///UISwitch
//        setUISwitch()
        
        ///UISlider
//        setUISlider()
        
        ///UISegmentedControl
//        setUISegmentedControl()
        
        ///UIScrollView()
//        setUIScrollView()
        
        ///UIPickerView
//        setUIPickerView()
        
        ///UITableView
//        setUITableView()
        
        ///UICollectionView
        setUICollectionView()
    }
    
    
    //UILabel
    func setUILabel(){
        let label = UILabel()
        label.text = "Hi nice to meet you"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.blue
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        
        label.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(label)
    }
        
    
    //UIImageView
    func setUIImageView(){
        let imageview = UIImageView()
        let image = UIImage(named: "Image")
        imageview.image = image
        imageview.contentMode = .scaleAspectFit
        
        imageview.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(imageview)
    }
    
    
    //UITextField
    func setUITextField(){
        let textField = UITextField()
        textField.placeholder = "give me text"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = false
            textField.returnKeyType = .done
        
        textField.frame = CGRect(x: 50, y: 200, width: 300, height: 100)
        self.view.addSubview(textField)
    }
    
    
    //UIButton
    func setUIButton(){
        let button = UIButton(type: .system)
        button.setTitle("click", for: .normal)
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 150)
        self.view.addSubview(button)
    }
    @objc func buttonTapped() {
        print("Tap!! Tap!!")
    }
    
    
    //UISwitch
    func setUISwitch(){
        let mySwitch = UISwitch()
        mySwitch.isOn = true
        mySwitch.onTintColor = UIColor.gray
        mySwitch.thumbTintColor = UIColor.white
        mySwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        
        mySwitch.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(mySwitch)
    }
    @objc func switchValueChanged(_ sender: UISwitch){
        if sender.isOn{
            print("Switch on")
        } else {
            print("Switch off")
        }
    }
    
    
    //UISlider
    func setUISlider(){
        let slider = UISlider()
        slider.value = 50
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = UIColor.lightGray
        slider.maximumTrackTintColor = UIColor.black
        slider.thumbTintColor =  UIColor.gray
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        slider.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(slider)
    }
    @objc func sliderValueChanged(_ sender: UISlider){
        print("Slider value: \(sender.value)")
    }
    
    
    //UISegmentedControl
    func setUISegmentedControl(){
        let segmentedControl = UISegmentedControl(items: self.data)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor.blue
        segmentedControl.isMomentary = false
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
        
        segmentedControl.frame = CGRect(x: 50, y: 200, width: 300, height: 100)
        self.view.addSubview(segmentedControl)
    }
    @objc func segmentedValueChanged(_ sender: UISegmentedControl){
        print("Selected segment index: \(sender.selectedSegmentIndex)")
    }
    
    
    //UIScrollView
    func setUIScrollView(){
        let scrollview = UIScrollView(frame: view.bounds)
        scrollview.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
        scrollview.isScrollEnabled = true
        scrollview.isPagingEnabled = false
        scrollview.bounces = true
        
        let label = UILabel(frame: CGRect(x: 0, y: view.frame.height - 50, width: view.frame.width, height: 100))
        label.text = "Hello, Scroll~"
        label.textAlignment = .center
        scrollview.addSubview(label)
        
        self.view.addSubview(scrollview)
    }
    
    
    //UIPickerView
    func setUIPickerView(){     
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.center = self.view.center
        
        self.view.addSubview(pickerView)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected: \(data[row])")
    }
    
    
    //UITableView
    func setUITableView(){
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = self.view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.view.addSubview(tableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(data[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //UICollectionView
    func setUICollectionView(){
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = self.view.bounds
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        self.view.addSubview(collectionView)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected: \(data[indexPath.row])")
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
