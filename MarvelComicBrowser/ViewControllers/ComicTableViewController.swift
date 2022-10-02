//
//  ComicTableViewController.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/20/15.
//  Copyright © 2015 SingletonConsulting. All rights reserved.
//

import UIKit

class ComicTableViewController: UITableViewController {
    var objects = [Comic]()
//    var dataFetcher: DataIterator<Comic>?
    var comicService = ComicCollectionNetworkService(httpClient: HTTPClientImplementation())

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            do {
                objects = try await comicService.getComics()
            } catch {
                print("Error: -\(error)")
            }
        }
//        self.dataFetcher = DataContainerStack().getComicData(["offset": "0"])
//        self.dataFetcher!.nextPage() { (pageOfData) -> Void in
//            if let pageOfData = pageOfData {
//                self.objects += pageOfData
//                self.tableView.reloadData()
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        let object = objects[indexPath.row]
//        cell.textLabel!.text = object.title
//
//        if let imageURL = object.thumbnail?.fullPath(size: ImageSizeEnum.medium) {
////            cell.imageView?.load(imageURL, placeholder: UIImage(named: "standard_medium"))
//        }
//        return cell
//    }

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
