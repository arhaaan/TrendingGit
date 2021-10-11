//
//  ViewController.swift
//  Trending Git
//
//  Created by Karim Arhan on 21/09/21.
//  Copyright © 2021 Karim Arhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let parser = Parser()
    
    var items: [Item] = []
    
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        
        
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
        return CGSize(width: (UIScreen.main.bounds.width/2)-10, height: (UIScreen.main.bounds.width/2)-10)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         page += 1
               let offsetY = scrollView.contentOffset.y + 5
               let contentHeight = scrollView.contentSize.height
               //load more data
               if offsetY >= contentHeight - scrollView.frame.height{
                parser.getRepo(search: searchBar.text ?? "", page: page) { (data) in
                    self.items.append(contentsOf: data?.items ?? [])
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
               }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemSelected = items[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        vc.item = itemSelected
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UISearchBarDelegate{
    // search repos
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.items.removeAll()
        self.page = 1
        parser.getRepo(search: searchBar.text ?? "", page: page) { data in
            
        self.items.append(contentsOf: data?.items ?? [])
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        

    }

}
