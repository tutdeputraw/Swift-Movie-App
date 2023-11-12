//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {

    static var identifier = "MovieTableViewCell"
    static func register() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindData(_ movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.releaseDate
        ratingLabel.text = "\(movie.voteAverage ?? 0)/10"
        posterImageView.sd_setImage(with: URL(string: "\(Constant.IMAGE_NETWORK)\(movie.posterPath ?? "")"))
    }
    
}
