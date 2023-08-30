//
//  ViewController.swift
//  AvitoTechInternshipTask
//
//  Created by Mila B on 28.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section { case main }
    
    var ads: [Advertisement] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Advertisement>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getAds()
        configureDataSource()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    

    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AdvertisementCell.self, forCellWithReuseIdentifier: AdvertisementCell.reuseID)
    }
    
    
    func getAds() {
        showLoadingView()
        
        NetworkManager.shared.getAds() { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            
            switch result {
            case .success(let ads):
                self.ads.append(contentsOf: ads.advertisements)
                self.updateData(on: self.ads)
                
            case .failure(let error):
                self.presentAlertOnMainThread(title: Labels.errorLabel, message: error.rawValue)
            }
        }
    }
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Advertisement>(collectionView: collectionView, cellProvider: { collectionView, indexPath, ad in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementCell.reuseID, for: indexPath) as! AdvertisementCell
            cell.set(ad: ad)
            return cell
        })
    }
    
    
    func updateData(on ads: [Advertisement]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Advertisement>()
        snapshot.appendSections([.main])
        snapshot.appendItems(ads)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
}


extension ViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = ads[indexPath.item]

        let destinationVC = DetailViewController()
        destinationVC.id = detail.id
        let navController  = UINavigationController(rootViewController: destinationVC)
        present(navController, animated: true)
    }
}
