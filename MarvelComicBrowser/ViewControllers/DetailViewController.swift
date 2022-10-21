//
//  DetailViewController.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/28/15.
//  Copyright © 2015 SingletonConsulting. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImageView: UIImageView!

    var comics = [Comic]()

    var detailItem: Character? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
//        if let detail = self.detailItem {
//            if let label = self.detailItem?.name {
//                self.title = label
//            }
//            if let imageURL = self.detailItem?.thumbnail?.fullPath(size: ImageSizeEnum.fantastic) {
////                self.backgroundImageView.load(imageURL, placeholder: UIImage(named: "standard_medium"))
////                self.backgroundImageView?.load(imageURL)
//            }
//            if let request = detailItem?.comics?.collectionURI {
////                ComicCollectionNetworkService().getComics(request, completionHandler: { (comics) -> Void in
////                    if let comics = comics {
////                        self.comics = comics
////                        self.collectionView.reloadData()
////                    }
////                })
//            }
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Collection View

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if let comicCount = detailItem?.comics.items.count {
//            return comicCount
//        } else {
            return 0
//        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "ComicCollectionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath as IndexPath) as! ComicCollectionViewCell

//        if let comicName = self.detailItem?.comics.items[indexPath.row].name {
//            cell.title.text = comicName
//        } else {
            cell.title.text = "Unknown Title"
//        }
//
//        if let imageURL = self.comics[indexPath.row].thumbnail?.fullPath(size: ImageSizeEnum.medium) {
////            cell.imageView?.load(imageURL, placeholder: UIImage(named: "standard_medium"))
//        }

        return cell
    }
}
