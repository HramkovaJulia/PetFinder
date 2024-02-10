//
//  ServicesTableView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 7.11.23.
//

import UIKit


class ServicesTableView: UITableView {
    
    private let massiveLabel = ["Приюты для животных", "Ветклиники", "Магазины"]


    init() {
        super.init(frame: .zero, style: .plain)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setup()
        self.register(ServicesTableViewCell.self, forCellReuseIdentifier: "ServicesTableViewCell")
    }
    
    func setup() {
        self.dataSource = self
        self.delegate = self
        self.separatorStyle = .none
        self.backgroundColor = .clear
    }
}

extension ServicesTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ServicesTableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableViewCell") as? ServicesTableViewCell {
                 cell = reuseCell
             } else {
                 cell = ServicesTableViewCell()
             }
        return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: ServicesTableViewCell, for indexPath: IndexPath) -> UITableViewCell {
        cell.setupData(nameLabel: massiveLabel[indexPath.row])
        return cell
    }
}

extension ServicesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ldfjof")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 227
    }
}
