//
//  MasterViewController.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/28/15.
//  Copyright © 2015 SingletonConsulting. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Character]()
//    var dataFetcher: DataIterator<Character>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }

//        self.dataFetcher = DataContainerStack().getCharacterData(["offset": "0"])
//        self.dataFetcher!.nextPage() { (pageOfData) -> Void in
//            if let pageOfData = pageOfData {
//                self.objects += pageOfData
//                self.tableView.reloadData()
//            }
//        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object.name

        if let imageURL = object.thumbnail.fullPath(size: ImageSizeEnum.medium) {
//            cell.imageView?.load(imageURL, placeholder: UIImage(named: "standard_medium"))
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == self.objects.count && self.objects.count >= 20 {
//            self.dataFetcher!.nextPage() { (pageOfData) -> Void in
//                if let pageOfData = pageOfData {
//                    self.objects += pageOfData
//                    self.tableView.reloadData()
//                }
//            }
        }
    }
}


