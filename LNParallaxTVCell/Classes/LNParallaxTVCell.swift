//
//  LNParallaxTVCell.swift
//  LNParallaxTVCell
//
//  Copyright © 2019 Lanars. All rights reserved.
//  https://lanars.com/
//

import UIKit

private let kMinParallaxRatio: CGFloat = 0.0
private let kMaxParallaxRatio: CGFloat = 1.0
private let kDefaultParallaxRatio: CGFloat = 0.5
private let kContentOffsetKey = "contentOffset"

@IBDesignable
open class LNParallaxTVCell: UITableViewCell {
    
    open var parallaxImage = UIImageView()
    
    @IBInspectable
    open var parallaxRatio: CGFloat = kDefaultParallaxRatio {
        didSet {
            parallaxRatio = min(parallaxRatio, kMaxParallaxRatio)
            parallaxRatio = max(parallaxRatio, kMinParallaxRatio)
            
            var rect = bounds
            rect.size.height = rect.size.height * (parallaxRatio + 1.0)
            parallaxImage.frame = rect
            
            updateParallaxOffset()
        }
    }
    
    @IBInspectable
    open var parallaxImageBackgroundColor: UIColor = .white {
        didSet {
            parallaxImage.backgroundColor = parallaxImageBackgroundColor
        }
    }
    
    private var tableView: UITableView?
    
    // MARK: - Lifecycle
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    deinit {
        removeObservers()
    }
    
    // MARK: - Setup
    
    private func setup() {
        clipsToBounds = true
        
        contentView.backgroundColor = .white
        contentView.addSubview(parallaxImage)
        contentView.sendSubviewToBack(parallaxImage)
        
        parallaxImage.backgroundColor = parallaxImageBackgroundColor
        parallaxImage.contentMode = .scaleAspectFill
        
        parallaxRatio = kDefaultParallaxRatio
    }
    
    // MARK: - UIViewHierarchy
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        tableView = newSuperview as? UITableView
        
        addObservers()
    }
    
    override open func removeFromSuperview() {
        super.removeFromSuperview()
        
        removeObservers()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        let tempParallaxRatio = parallaxRatio
        parallaxRatio = tempParallaxRatio
    }
    
    // MARK: - Parallax
    
    private func updateParallaxOffset() {
        guard
            let contentOffset = tableView?.contentOffset.y,
            let tableViewHeight = tableView?.frame.size.height
        else { return }
        
        let cellHeight = frame.size.height
        let cellOffset = frame.origin.y - contentOffset
        let percent = (cellOffset + cellHeight) / (tableViewHeight + cellHeight)
        let extraHeight = cellHeight * parallaxRatio
        
        var rect = parallaxImage.frame
        rect.origin.y = -extraHeight * percent
        parallaxImage.frame = rect
    }
    
    // MARK: - KVO
    
    private func addObservers() {
        tableView?.addObserver(self, forKeyPath: kContentOffsetKey, options: [.new, .old], context: nil)
    }
    
    private func removeObservers() {
        tableView?.removeObserver(self, forKeyPath: kContentOffsetKey)
        tableView = nil
    }
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard
            keyPath == kContentOffsetKey,
            tableView?.visibleCells.contains(self) == true,
            parallaxRatio != kMinParallaxRatio
        else { return }
        
        self.updateParallaxOffset()
    }
    
}
