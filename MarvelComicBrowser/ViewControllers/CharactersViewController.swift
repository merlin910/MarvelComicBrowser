//
//  MasterViewController.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/28/15.
//  Copyright © 2015 SingletonConsulting. All rights reserved.
//

import UIKit

class CharactersViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects: [Character] = []
//    var dataFetcher: DataIterator<Character>?
    var characterService = CharacterService(httpClient: HTTPClientImplementation())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        Task {
            do {
                objects = try await characterService.getCharacters()
                print("Thread.isMainThread = \(Thread.isMainThread)")
                tableView.reloadData()
            } catch {
                print("Error: -\(error)")
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
//        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

        if let imageURL = object.thumbnail.fullPath(size: ImageSizeEnum.medium), let url = URL(string: imageURL) {
            cell.imageView?.loadImage(imageURL: url) // TODO: need placeholder image.
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


