//
//  ViewController.swift
//  MVCDemo
//
//  Created by Yuvraj  Kale on 2/08/20.
//  Copyright © 2020 Yuvraj  Kale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoTablview: UITableView!
    var todos : [Todomodel1]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
        // Do any additional setup after loading the view.
    }
    
    
    
    fileprivate func fetchData() {
        Service.shared.fetchCourses {[weak self] (todolist, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            self?.todos = todolist
            if let _ = self?.todos{
                self?.todoTablview.reloadData()
            }
        }
    }

    
    
    
    


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "democell", for: indexPath) as! DemoTableViewCell
        let currentTodo = self.todos?[indexPath.row]
        cell.showData(todo:currentTodo!)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if(!pagingOver){
//            if(indexPath.row == articles.count-1 ){
//                var paging : Int
//                paging = articles.count/10
//                paging = paging + 1
//                print("pagin = \(paging) and count = \(articles.count)")
//                getArticle(withIndex: paging)
//            }
//        }
        
//    }
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
    }
}
