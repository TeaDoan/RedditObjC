//
//  PostListTableViewController.swift
//  2ndRedditSearch
//
//  Created by Thao Doan on 6/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {

    var post : [KPDPost] = []

    @IBOutlet weak var searchBarView: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

       searchBarView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PostTableViewCell  else {return UITableViewCell()}

        let postResult = post[indexPath.row]
        cell.post = postResult

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension PostListTableViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBarView.text, !searchTerm.isEmpty else {
            return
        }
        searchBar.resignFirstResponder()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        KPDPostModelController.fetchPost(withSearchTerm: searchTerm) { (post) in
            if let posts = post {
                DispatchQueue.main.async {
                    self.post = posts
                    self.tableView.reloadData()
                    self.title = searchTerm
                }
               
            }
        }
    }
}
