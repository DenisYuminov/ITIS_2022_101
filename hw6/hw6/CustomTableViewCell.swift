import UIKit

class CustomTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private let nameLabel: UILabel = .init()
    private let countryLabel: UILabel = .init()
    private let packageWeight: UILabel = .init()
    private let fortressLabel: UILabel = .init()
    private let limbsNumberImageView: UIImageView = .init()

    func set(tea: BlackTea) {
        nameLabel.text = tea.name
        countryLabel.text = "Country: \(tea.country)"
        packageWeight.text = "Package weight: \(tea.packageWeight)"
        fortressLabel.text = "Fortress: \(tea.fortress)"
    }

    private func setup() {
        nameLabel.font = .boldSystemFont(ofSize: 20)
        countryLabel.font = .monospacedDigitSystemFont(ofSize: 17, weight: .regular)
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel, countryLabel, packageWeight, fortressLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        limbsNumberImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            limbsNumberImageView.widthAnchor.constraint(equalToConstant: 30),
            limbsNumberImageView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    func didTapSelect(tea: BlackTea, at indexPath: IndexPath) {
         print(
            "Name: \(tea.name),\nCountry: \(tea.country),\nWeight: \(tea.packageWeight),\nFortress: \(tea.fortress)\n"
         )
     }
     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)
     }
}
