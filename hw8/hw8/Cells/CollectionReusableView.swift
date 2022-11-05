import UIKit

class CollectionReusableView: UICollectionReusableView {
    private let headerLabel: UILabel = {
            let label = UILabel()
             label.text = "header"
             label.textAlignment = .left
             label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
             label.textColor = .black
             label.translatesAutoresizingMaskIntoConstraints = false
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
             backgroundColor = .white
             addSubview(headerLabel)
         }

         func configureCell(headerName: String){
             headerLabel.text = headerName
         }

         func setConstraint(){
             NSLayoutConstraint.activate([
                 headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
                 headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
             ])
         }
}
