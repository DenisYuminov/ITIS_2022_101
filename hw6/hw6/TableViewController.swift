import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)

    enum CellIdentifier: String {
        case greenTea
        case blackTea
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        tableView.backgroundColor = .clear

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        tableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: CellIdentifier.greenTea.rawValue
        )
        tableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: CellIdentifier.blackTea.rawValue
        )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
            2
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if section == 0 {
            return 7
        } else {
            return 10
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell(
            style: .value1, reuseIdentifier: "text"
            )
        if indexPath.section == 0 {
            var configuration = UIListContentConfiguration.valueCell()
            let tea = getGreenTea()
            configuration.image = UIImage(
                systemName: "cup.and.saucer"
            )
            configuration.imageProperties.maximumSize = CGSize(width: 70, height: 70)
            configuration.text = "\(tea.name)"
            configuration.textProperties.color = .systemGreen
            if tea.description.count > 0 {
                configuration.secondaryText = "\(tea.description)"
                configuration.secondaryTextProperties.color = .black
            }
            cell.contentConfiguration = configuration
            cell.selectionStyle = .none
            return cell
        } else {
            cell.selectionStyle = .default
            guard
                let cell = tableView
                    .dequeueReusableCell(
                        withIdentifier: CellIdentifier.blackTea.rawValue, for: indexPath
                    )
                    as? CustomTableViewCell
            else {
                fatalError("Could not deque cell of type \(CustomTableViewCell.self)")
            }
            let tea = blackTeaList[indexPath.row]
            cell.set(tea: tea)
            return cell
        }
    }

    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let stackView = UIStackView()
        let label = UILabel()
        if section == 0 {
            label.text = "Green tea"
            label.textColor = .systemGreen
        } else {
            label.text = "Black tea"
            label.textColor = .black
        }
        label.font = .monospacedSystemFont(ofSize: 30, weight: .bold)
        stackView.addArrangedSubview(label)
        return stackView
    }
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             tableView.deselectRow(at: indexPath, animated: true)
             if let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell {
                 cell.didTapSelect(tea: blackTeaList[indexPath.row], at: indexPath)
             }
         }
}

