//
//  SelectionTableVC.swift
//  TableViewSeletion
//
//  Created by Ramanan D2V on 12/9/19.
//  Copyright © 2019 D2V Software Solutions pvt ltd. All rights reserved.
//

import UIKit

class SelectionTableVC: UITableViewController {

    var data = [["iPhone"],["iPad"],["iMac"]]
    var selectedRow = 99999 // some over index
    var selectedSection = 99999 // some over index

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Purchase"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
  
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return data[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell

        cell.itemName.text = data[indexPath.section][indexPath.row]
        cell.itemImageView.image = UIImage(named: data[indexPath.section][indexPath.row])
        
        if selectedSection == indexPath.section && self.selectedRow == indexPath.row {
            cell.accessoryType = .checkmark
            cell.paybtnHeightConstraint.constant = 30
            cell.payBtn.tag = indexPath.section
            cell.payBtn.setTitle("Continue  " + data[indexPath.section][indexPath.row], for: .normal)
            cell.payBtn.addTarget(self, action: #selector(payAction(sender:)), for: .touchUpInside)
        }else{
            cell.paybtnHeightConstraint.constant = 0
            cell.accessoryType = .disclosureIndicator
        }
     
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedSection = indexPath.section
        selectedRow = indexPath.row
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return data[section][0]
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 10
    }

    
    @objc func payAction(sender: UIButton) {
        
        switch sender.tag {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "IPhoneVC_ID") as! IPhoneVC
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
              let vc = storyboard?.instantiateViewController(withIdentifier: "IPadVc_ID") as! IPadVc
              self.navigationController?.pushViewController(vc, animated: true)
        case 2:
              let vc = storyboard?.instantiateViewController(withIdentifier: "IMacVC_ID") as! IMacVC
              self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            print("none")
        }
        
    }

}
