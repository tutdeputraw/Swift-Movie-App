//
//  TrendingMovieDetailViewController.swift
//  MovieApp
//
//  Created by tutdeputraw on 12/11/23.
//

import UIKit
import SDWebImage

class TrendingMovieDetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var posterImageVIew: UIImageView!
    @IBOutlet weak var contentLayout: UIView!
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var categoriesTableView: UITableView!
    @IBOutlet weak var tvOverview: UILabel!
    
    var dataSource: Movie
    
    init(_ dataSource: Movie) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDataBinding()
//        scrollView.isScrollEnabled = true
    }
    
    func setupView() {
        //        title = dataSource.title
        let items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: #selector(bookmark))]
        self.toolbarItems = items
        
        self.toolbarItems = []
        self.tabBarController?.tabBar.isHidden = true
        contentLayout.backgroundColor = .systemBackground
        contentLayout.layer.cornerRadius = 10.0
        contentLayout.clipsToBounds = true
        contentLayout.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func setupDataBinding() {
        tvTitle.text = dataSource.title
        posterImageVIew.sd_setImage(with: URL(string: "\(Constant.IMAGE_NETWORK)\(dataSource.backdropPath ?? "")"))
        tvOverview.text = "\(dataSource.overview!)#1#\(dataSource.overview!)#2#\(dataSource.overview!)#3#\(dataSource.overview!)#4#\(dataSource.overview!)#5#\(dataSource.overview!)#6#\(dataSource.overview!)#7#\(dataSource.overview!)#8#\(dataSource.overview!)#9#\(dataSource.overview!)#10#\(dataSource.overview!)-END"
        
    }
    
    @IBAction func bookmarkOnClicked(_ sender: Any) {
        
    }
    
    @objc private func bookmark() {
        
    }
}
