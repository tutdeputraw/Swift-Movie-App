//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by tutdeputraw on 17/11/23.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {
    static var identifier = "MovieCell"
    
    private let posterImage: UIImageView = {
        let posterImage = UIImageView()
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.contentMode = .scaleAspectFill
        posterImage.clipsToBounds = true
        posterImage.tintColor = .label
        posterImage.image = UIImage(systemName: "questionmark")
        return posterImage
    }()
    private let titleText: UILabel = {
        let titleText = UILabel()
        titleText.textColor = .black
        titleText.backgroundColor = .yellow
        titleText.translatesAutoresizingMaskIntoConstraints = false
        return titleText
    }()
    private let airedDateText: UILabel = {
        let airedDateText = UILabel()
        airedDateText.translatesAutoresizingMaskIntoConstraints = false
        return airedDateText
    }()
    private let rateText: UILabel = {
        let rateText = UILabel()
        rateText.translatesAutoresizingMaskIntoConstraints = false
        return rateText
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindData(_ movie: Movie) {
        titleText.text = movie.title
        airedDateText.text = movie.releaseDate
        rateText.text = "\(movie.voteAverage ?? 0)/10"
//        posterImage.sd_setImage(with: URL(string: "\(Constant.API.IMAGE_NETWORK)\(movie.posterPath ?? "")"))
        posterImage.sd_setImage(with: URL(string: "\(Constant.API.IMAGE_NETWORK)\(movie.posterPath ?? "")"))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupView() {
        self.addSubview(posterImage)
        self.addSubview(titleText)
        self.addSubview(airedDateText)
        self.addSubview(rateText)
    }

    private func setupViewConstraint() {
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            posterImage.trailingAnchor.constraint(equalTo: titleText.leadingAnchor),
            posterImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            posterImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            
            posterImage.heightAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.heightAnchor),
            posterImage.widthAnchor.constraint(equalToConstant: 140)
        ])
        NSLayoutConstraint.activate([
            titleText.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            titleText.bottomAnchor.constraint(equalTo: airedDateText.layoutMarginsGuide.topAnchor),
            titleText.leadingAnchor.constraint(equalTo: posterImage.layoutMarginsGuide.trailingAnchor),
            titleText.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor,constant: 0),
        ])
        NSLayoutConstraint.activate([
            airedDateText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 0),
            airedDateText.trailingAnchor.constraint(equalTo: titleText.trailingAnchor),
//            airedDateText.bottomAnchor.constraint(equalTo: rateText.topAnchor),
            airedDateText.leadingAnchor.constraint(equalTo: titleText.leadingAnchor),
        ])
        NSLayoutConstraint.activate([
            rateText.topAnchor.constraint(equalTo: airedDateText.bottomAnchor),
            rateText.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            rateText.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            rateText.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor),
        ])
//        NSLayoutConstraint.activate([
//            posterImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            posterImage.trailingAnchor.constraint(equalTo: titleText.leadingAnchor),
//            posterImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            posterImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//
//            posterImage.heightAnchor.constraint(equalToConstant: 200),
//            posterImage.widthAnchor.constraint(equalToConstant: 140),
//
//            posterImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
//        ])
//        NSLayoutConstraint.activate([
//            titleText.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor),
//            titleText.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            titleText.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            titleText.bottomAnchor.constraint(equalTo: airedDateText.topAnchor),
//        ])
//        NSLayoutConstraint.activate([
//            airedDateText.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor),
//            airedDateText.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            airedDateText.topAnchor.constraint(equalTo: self.contentView.topAnchor),
////            airedDateText.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>)
//        ])
    }
}
