//
//  ViewController.swift
//  Trending Git
//
//  Created by Karim Arhan on 21/09/21.
//  Copyright © 2021 Karim Arhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let parser = Parser()
    
    var items = [Item]()
    
    var names = ["Dudu", "Dada"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        parser.getRepo { data in
            
            self.items = data?.items ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RepoCollectionViewCell
        cell.repoNameLbl.text = items[indexPath.row].name
        cell.repoImg.load(url: items[indexPath.row].owner!.avatar_url)
        cell.forkLbl.text = "\(items[indexPath.row].forks)"
        cell.starLbl.text = "\(items[indexPath.row].stargazers_count)"
        cell.FSView.layer.borderWidth = 0.5
        cell.FSView.layer.borderColor = UIColor.black.cgColor
        cell.FSView.layer.cornerRadius = 6
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
}

