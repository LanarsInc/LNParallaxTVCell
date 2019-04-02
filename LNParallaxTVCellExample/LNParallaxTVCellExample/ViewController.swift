//
//  ViewController.swift
//  LNParallaxTVCellExample
//
//  Copyright © 2019 Lanars. All rights reserved.
//  https://lanars.com/
//

import UIKit
import LNParallaxTVCell

private let kCellIdentifier = "cellIdentifier"
private let kImagesCount = 10

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kImagesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier) as? LNParallaxTVCell else {
            return UITableViewCell()
        }
        
        cell.parallaxImage.image = UIImage(named: "image\(indexPath.row)")
        cell.parallaxRatio = 1.0
        
        return cell
    }
    
}
