//
//  ComicTableViewController.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/20/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import UIKit

class ComicTableViewController: UITableViewController {
    
    var objects = [Comic]()
    var dataFetcher: DataIterator<Comic>?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataFetcher = DataContainerStack().getComicData(["offset":"0"])
        self.dataFetcher!.nextPage() { (pageOfData) -> Void in
            if let pageOfData = pageOfData {
                self.objects += pageOfData
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let object = objects[indexPath.row]
        cell.textLabel!.text = object.title
        
        if let imageURL = object.thumbnail?.fullPath(ImageSizeEnum.Medium) {
            cell.imageView?.load(imageURL, placeholder: UIImage(named: "standard_medium"))
        }
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row + 1 == self.objects.count && self.objects.count >= 20  {
            self.dataFetcher!.nextPage() { (pageOfData) -> Void in
                if let pageOfData = pageOfData {
                    self.objects += pageOfData
                    self.tableView.reloadData()
                }
            }
        }
    }

}
