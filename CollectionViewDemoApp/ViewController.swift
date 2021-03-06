//
//  ViewController.swift
//  CollectionViewDemoApp
//
//  Created by Julien on 31/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var tabledata=["Car", "Bike", "Aeroplane"]
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate=self
        myTableView.dataSource=self
        myTableView.layer.cornerRadius=20
        setNavBar()
        view.layer.backgroundColor=UIColor(patternImage: UIImage(named: "bg")!).cgColor
        myTableView.register(UINib(nibName:"MyTableViewCell", bundle: nil), forCellReuseIdentifier: tableviewcellIdentifier)
    }
    func setNavBar(){
        let backButton = UIBarButtonItem()
        backButton.title = ""
       backButton.tintColor=UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabledata.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: tableviewcellIdentifier, for: indexPath) as! MyTableViewCell
        
        cell.myTextLabel.text=tabledata[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let segueIdentifier: String
            switch indexPath.row {
            case 0: //For "one"
                 segueIdentifier = "car"
            case 1: //For "two"
                 segueIdentifier = "bike"
            default: //For "three"
                 segueIdentifier = "aeroplane"
            }
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}
