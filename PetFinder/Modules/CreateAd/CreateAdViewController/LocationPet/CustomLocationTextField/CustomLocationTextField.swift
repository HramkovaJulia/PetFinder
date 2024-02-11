//
//  CustomLocationTextField.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 13.01.24.
//

import UIKit

import UIKit

class DropdownTextField: UITextField {
    
    var tableView: UITableView?
    var itemList: [String] = []
    var isOpen: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.placeholder = "Адрес местонахождения или пропажи"
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: frame.size.height))
        self.leftViewMode = .always
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: frame.size.height))
        self.rightViewMode = .always
        self.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
    }
    
    @objc private func textFieldDidBeginEditing(_ textField: UITextField) {
        isOpen = true
        showDropdown()
    }
    
    func showDropdown() {
        guard tableView == nil else { return }
        
        let dropdownHeight: CGFloat = 200
        let dropdownFrame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.size.height + 5, width: frame.size.width, height: dropdownHeight)
        tableView = UITableView(frame: dropdownFrame)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.layer.cornerRadius = 12
        tableView?.separatorStyle = .none
        
        if let superview = superview {
            superview.addSubview(tableView!)
            tableView?.center.x = superview.bounds.midX
        }
    }
    
    func hideDropdown() {
        tableView?.removeFromSuperview()
        tableView = nil
    }
}

extension DropdownTextField: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = itemList[indexPath.row]
        cell.backgroundColor = UIColor(hex: 0xfcfcfc)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = itemList[indexPath.row]
        text = selectedItem
        hideDropdown()
    }
}

