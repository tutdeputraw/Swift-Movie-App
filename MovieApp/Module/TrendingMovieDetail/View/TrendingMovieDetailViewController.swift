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
    
    var viewModel = TrendingMovieDetailViewModel()
    
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
        self.tabBarController?.tabBar.isHidden = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(bookmark(_:)))
        
        contentLayout.layer.cornerRadius = 10.0
        contentLayout.clipsToBounds = true
        contentLayout.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func setupDataBinding() {
        tvTitle.text = dataSource.title
        posterImageVIew.sd_setImage(with: URL(string: "\(Constant.API.IMAGE_NETWORK)\(dataSource.backdropPath ?? "")"))
        tvOverview.text = "\(dataSource.overview!)"
        
    }
    
    @objc private func bookmark(_ sender: Any) {
//        viewModel.
    }
}
