import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
 
    private var dataTask: URLSessionDataTask?

    private let popularImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let NameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    private let AuthorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
        setConstraint()
    }

    func setupView(){
        backgroundColor = .none
        addSubview(popularImageView)
        addSubview(NameLabel)
        addSubview(AuthorLabel)
    }

    func configureCell(title: String, imageName: String){
        loadImage(url: URL(string: imageName)!)
        NameLabel.text = title
    }

    private func loadImage(url: URL) {
        dataTask?.cancel()
        let urlRequest = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData
        )
        dataTask = URLSession.shared
            .dataTask(with: urlRequest) { [popularImageView] data, _, _ in
                guard let data else {
                    return
                }

                let image = UIImage(data: data)
                DispatchQueue.main.async { [popularImageView] in
                    guard let image else { return }

                    popularImageView.image = image
                }
            }
        dataTask?.resume()
    }

    func setConstraint(){
        NSLayoutConstraint.activate([
            NameLabel.bottomAnchor.constraint(equalTo: popularImageView.bottomAnchor, constant: -90),
            NameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            popularImageView.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            popularImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -21),
            popularImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            popularImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200),
        ])
    }
}
