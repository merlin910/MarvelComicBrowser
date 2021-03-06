//
//  DetailViewController.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/28/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import UIKit
import ImageLoader

class DetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var comics = [Comic]?()

    var detailItem: Character? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailItem?.name {
                self.title = label
            }
            if let imageURL = self.detailItem?.thumbnail?.fullPath(ImageSizeEnum.Fantastic) {
//                self.backgroundImageView.load(imageURL, placeholder: UIImage(named: "standard_medium"))
                self.backgroundImageView?.load(imageURL)
            }
            if let request = detailItem?.comics?.collectionURI {
                ComicCollectionStack().getComics(request, completionHandler: { (comics) -> Void in
                    if let comics = comics {
                        self.comics = comics
                        self.collectionView.reloadData()
                    }
                })
            }
        }
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
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let comicCount = detailItem?.comics?.items?.count {
            return comicCount
        }
        else {
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellIdentifier = "ComicCollectionCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! ComicCollectionViewCell
        
        
        if let comicName = self.detailItem?.comics?.items?[indexPath.row].name {
            cell.title.text = comicName
        }
        else {
            cell.title.text = "Unknown Title"
        }
        
        if let imageURL = self.comics?[indexPath.row].thumbnail?.fullPath(ImageSizeEnum.Medium) {
            cell.imageView?.load(imageURL, placeholder: UIImage(named: "standard_medium"))
        }
        
        return cell
    }
    
        
}

