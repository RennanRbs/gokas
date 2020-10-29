//
//  ViewController.swift
//  gokas
//
//  Created by Rennan Rebouças on 28/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    

    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FirstCollectionTableViewCell.nib(), forCellReuseIdentifier: FirstCollectionTableViewCell.identifier)
        tableView.register(SecondViewTableViewCell.nib(), forCellReuseIdentifier: SecondViewTableViewCell.identifier)
        tableView.register(ThirdTableViewCell.nib(), forCellReuseIdentifier: ThirdTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FirstCollectionTableViewCell.identifier, for: indexPath) as! FirstCollectionTableViewCell
            
            return cell
        }
        
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SecondViewTableViewCell.identifier, for: indexPath) as! SecondViewTableViewCell
            cell.imageView?.backgroundColor = .black
            return cell
        }
        
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ThirdTableViewCell.identifier, for: indexPath) as! ThirdTableViewCell
            return cell
        }
            
        else{
                let cell = UITableViewCell()
                cell.textLabel?.text = "texto"
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 1 || indexPath.row == 3) {return 50}
        if (indexPath.row == 4) {return 100}
        else {return 200}
    }
  
}




