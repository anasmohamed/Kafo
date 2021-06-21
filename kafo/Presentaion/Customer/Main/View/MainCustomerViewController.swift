//
//  MainCustomerViewController.swift
//  kafo
//
//  Created by no one on 21/06/2021.
//

import UIKit

class MainCustomerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"MainViewTableViewCell" , for:indexPath)
        return cell
    }
    

    @IBOutlet weak var mainCustomerServiceTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red:68.0/255.0 , green: 68.0/255.0, blue:68.0/255.0 , alpha: 1.0)
        setupTableView()
        mainCustomerServiceTableView.delegate = self
        mainCustomerServiceTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        mainCustomerServiceTableView.register(UINib(nibName: "MainViewTableViewCell", bundle: nil), forCellReuseIdentifier: "MainViewTableViewCell")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
