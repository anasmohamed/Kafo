//
//  ListOfBodyGuardsViewController.swift
//  kafo
//
//  Created by no one on 12/07/2021.
//

import UIKit

class ListOfBodyGuardsViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var user : User?
    var listOfBodyGuardsViewModel = ListOfBodyGuardsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        listOfBodyGuardsViewModel.getListOfBodyGuards()
        bindData()
        // Do any additional setup after loading the view.
    }
    func bindData() {
        listOfBodyGuardsViewModel.getUsersSuccess.bind{
            users in
            self.tableView.reloadData()
        }
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(listOfBodyGuardsViewModel.numberOfItems)
        return listOfBodyGuardsViewModel.numberOfItems
    }
    func setupTableView() {
        tableView.register(UINib(nibName: "ListOfGuardsTableViewCell", bundle: nil), forCellReuseIdentifier:"ListOfGuardsTableViewCell" )
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfGuardsTableViewCell", for: indexPath) as! ListOfGuardsTableViewCell
        cell.item = listOfBodyGuardsViewModel.getData(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let bodyGuardProfileViewStoryboard = UIStoryboard(name: "ListOfBodyGuards", bundle: nil)
            let bodyGuardProfileViewControll = bodyGuardProfileViewStoryboard.instantiateViewController(identifier: "BodyGuardProfileControll") as! BodyGuardProfileControll
        bodyGuardProfileViewControll.email = listOfBodyGuardsViewModel.getData(index: indexPath.row).email
        bodyGuardProfileViewControll.mobile = listOfBodyGuardsViewModel.getData(index: indexPath.row).mobileNumber
        bodyGuardProfileViewControll.location = listOfBodyGuardsViewModel.getData(index: indexPath.row).city + " " + listOfBodyGuardsViewModel.getData(index: indexPath.row).country
        bodyGuardProfileViewControll.bodyGuardName = listOfBodyGuardsViewModel.getData(index: indexPath.row).firstName + " " + listOfBodyGuardsViewModel.getData(index: indexPath.row).lastName
        bodyGuardProfileViewControll.bodyguardId = listOfBodyGuardsViewModel.getData(index: indexPath.row).token
        bodyGuardProfileViewControll.user = user
            self.navigationController?.pushViewController(bodyGuardProfileViewControll, animated: true)
        }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
