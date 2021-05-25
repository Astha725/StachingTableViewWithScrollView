//
//  ListViewController.swift
//  TableViewTest
//
//  Created by Komal Gupta on 20/05/21.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var arrList = [listData]()
    var titleName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = Shared.shared.navTitle
        tblview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tblview.delegate = self
        tblview.dataSource = self
        
        callApi()
        
        // Do any additional setup after loading the view.
    }
    
    func callApi() {
        
        let param : [ String : String ] = [:]
        var request = URLRequest(url: URL(string: "http://dlivrr.intellisensetechnologies.com/user/demo1")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            let response = String(decoding: data!, as: UTF8.self)
            print(response)
            
                do {
                    let jsondecoder = JSONDecoder()
                    let obj = try jsondecoder.decode(list.self, from: data!)
                    if obj.message == "success" {
                        self.arrList = obj.result
                    }
                    DispatchQueue.main.async {
                        self.tblview.reloadData()
                    }
                } catch {
                    print("error")
                }

        })
        task.resume()
    }

}

// MARK:- UITableViewDelegate, UITableViewDataSourc
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.lblTitle.text = arrList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}


