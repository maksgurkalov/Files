//
//  MainVC.swift
//  Files
//
//  Created by maks on 07.06.2022.
//

import UIKit
import TinyConstraints

class MainVC: UIViewController {
    
    fileprivate let gridSectionOffset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    fileprivate let cellsPerLine = 3
    fileprivate var isListView = true
    fileprivate var toggleButton: UIBarButtonItem?
    fileprivate var path: [PathData] = []
    fileprivate var source: [ValueData] = []
    
    fileprivate var collectionView: UICollectionView?
    fileprivate var dataResponse: DataResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        configureBarButtonItems()
        dataFetch(url: ApiRoute.dashboard.rawValue)
    }
    
    fileprivate func reloadTitle(title: String) {
        DispatchQueue.main.async {
            self.navigationItem.title = title
        }
    }
    
    fileprivate func reloadFolders() {
        if path.isEmpty {
            reloadTitle(title: "Main")
            source = Utils.searchDataByFolderId(id: "", from: dataResponse?.values)
        } else {
            reloadTitle(title: path.last?.title ?? "NoName")
            source = Utils.searchDataByFolderId(id: path.last?.id ?? "", from: dataResponse?.values)
        }
        reloadView()
    }
    
    fileprivate func backToPreviousFolder() {
        if path.isEmpty {
            return
        }
        path = path.dropLast()
        reloadFolders()
    }
    
    fileprivate func openFolder(by id: String, name: String) {
        guard !id.isEmpty else { return }
        path.append(PathData(id: id, title: name))
        reloadFolders()
        if source.isEmpty {
            showAlert(self, title: "Empty folder", message: "This folder has no data")
        }
    }
    
    fileprivate func dataFetch(url: String) {
        DataFetcher().fetchData(urlString: url) { [weak self] response in
            guard let weakSelf = self, let response = response else { return }
            weakSelf.dataResponse = response
            weakSelf.reloadFolders()
        }
    }
    
    fileprivate func reloadView() {
        DispatchQueue.main.async { [self] in
            collectionView?.reloadData()
            configureBarButtonItems()
        }
    }
    
    fileprivate func setupLayouts() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.identifier)
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(collectionView)
    }
    
    fileprivate func configureBarButtonItems() {
        
        navigationItem.leftBarButtonItem = path.isEmpty ? UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(profileButtonTapped)) : UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: isListView ? "list.bullet" : "square.grid.2x2"), style: .plain, target: self, action: #selector(listButtonTapped)),
            UIBarButtonItem(image: UIImage(systemName: "folder.badge.plus"), style: .plain, target: self, action: #selector(addFolderButtonTapped)),
            UIBarButtonItem(image: UIImage(systemName: "doc.badge.plus"), style: .plain, target: self, action: #selector(addDocButtonTapped))
        ]
    }
    
    @objc fileprivate func backButtonTapped() {
        backToPreviousFolder()
    }
    
    @objc fileprivate func profileButtonTapped() {
        print("profile button TPD")
    }
    
    @objc fileprivate func listButtonTapped() {
        if isListView {
            toggleButton = UIBarButtonItem(image: UIImage(systemName: "square.grid.2x2"), style: .plain, target: self, action: #selector(listButtonTapped))
            isListView = false
        } else {
            toggleButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(listButtonTapped))
            isListView = true
        }
        if let toggleButton = toggleButton {
            self.navigationItem.rightBarButtonItems?[0] = toggleButton
        }
        self.collectionView?.reloadData()
        
    }
    
    @objc fileprivate func addFolderButtonTapped() {
        print("addFileTapped button TPD")
    }
    
    @objc fileprivate func addDocButtonTapped() {
        print("addFolderTapped button TPD")
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isListView {
            return CGSize(width: view.frame.width, height: 50)
        } else {
            let width = view.frame.size.width/CGFloat(cellsPerLine) - gridSectionOffset.left - gridSectionOffset.right
            return CGSize(width: width, height: width * 1.2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if isListView {
            return UIEdgeInsets.zero
        } else {
            return gridSectionOffset
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = source[indexPath.row]
        
        if isListView {
            guard let ListCell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as? ListCell else { return  UICollectionViewCell() }
            ListCell.setup(data: data)
            
            return ListCell
        } else {
            guard let GridCell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.identifier, for: indexPath) as? GridCell else { return UICollectionViewCell() }
            GridCell.setup(data: data)
            
            return GridCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = source[indexPath.row]
        if data.isFolder {
            openFolder(by: data.parentId, name: data.name)
        }
    }
}
