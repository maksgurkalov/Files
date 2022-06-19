//
//  FoderVC.swift
//  Files
//
//  Created by maks on 16.06.2022.
//

import UIKit

class FolderVC: UIViewController {
    
    let itemData: DataResponse!
    
//    init(_ itemData: DataResponse) {
//        super.init(nibName: nil, bundle: nil)
//        self.itemData = itemData
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .yellow
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
