//
//  TrendingMovieDetailViewController.swift
//  MovieApp
//
//  Created by tutdeputraw on 12/11/23.
//

import UIKit
import SDWebImage

class TrendingMovieDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
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

        // Do any additional setup after loading the view.
        title = dataSource.title
        imageView.sd_setImage(with: URL(string: "\(Constant.IMAGE_NETWORK)\(dataSource.posterPath ?? "")"))
    }
}
