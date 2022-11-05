import UIKit

class NewMusicCollectionViewCell: UICollectionViewCell {
    private var dataTask: URLSessionDataTask?

    private let newMusicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    

    func configureCell(imageName: String){
        loadImage(url: URL(string: imageName)!)
        newMusicImageView.contentMode = .scaleAspectFit
    }

    private func loadImage(url: URL) {
        newMusicImageView.image = nil
        dataTask?.cancel()
        let urlRequest = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData
        )
        dataTask = URLSession.shared
            .dataTask(with: urlRequest) { [newMusicImageView] data, _, _ in
                guard let data else {
                    return
                }
                
                let image = UIImage(data: data)
                DispatchQueue.main.async { [newMusicImageView] in
                    guard let image else { return }
                    newMusicImageView.image = image
                }
            }
        dataTask?.resume()
    }

    func setup(){
        backgroundColor = .none
        addSubview(newMusicImageView)
        
        NSLayoutConstraint.activate([
            newMusicImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            newMusicImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            newMusicImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            newMusicImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        ])
    }
}
