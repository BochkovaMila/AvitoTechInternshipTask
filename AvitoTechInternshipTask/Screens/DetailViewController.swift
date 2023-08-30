//
//  DetailViewController.swift
//  AvitoTechInternshipTask
//
//  Created by Mila B on 30.08.2023.
//

import UIKit
    
class DetailViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var id: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureScrollView()
        getDetailInfo()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(image: Images.doneButton, style: .plain, target: self, action: #selector(dismissVC))
        doneButton.tintColor = .label
        navigationItem.leftBarButtonItem = doneButton
    }
    
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 700)
        ])
    }
    
    
    func getDetailInfo() {
        
        NetworkManager.shared.getDetail(for: id) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let detail):
                DispatchQueue.main.async {
                    self.add(childVC: DetailInfoViewController(detail: detail), to: self.contentView)
                }
                
            case .failure(let error):
                self.presentAlertOnMainThread(title: Labels.errorLabel, message: error.rawValue)
            }
        }
    }

    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}

