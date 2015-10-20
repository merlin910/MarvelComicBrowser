//
//  MasterViewController.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/28/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import UIKit
import ImageLoader

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Character]()
    var dataFetcher: DataIterator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        
        self.dataFetcher = DataContainerStack().getCharacterData(["offset":"0"])
        self.dataFetcher!.nextPage(Character.self) { (pageOfData) -> Void in
            if let pageOfData = pageOfData {
                self.objects += pageOfData
                self.tableView.reloadData()
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object.name
        
        if let imageURL = object.thumbnail?.fullPath(ImageSizeEnum.Medium) {
            cell.imageView?.load(imageURL, placeholder: UIImage(named: "standard_medium"))
        }
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row + 1 == self.objects.count && self.objects.count >= 20  {
            self.dataFetcher!.nextPage(Character.self) { (pageOfData) -> Void in
                if let pageOfData = pageOfData {
                    self.objects += pageOfData
                    self.tableView.reloadData()
                }
            }
        }
    }
}


