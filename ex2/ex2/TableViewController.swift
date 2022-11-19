import UIKit

class TableViewCell: UITableViewCell {
    private let username: UILabel = .init()
    private let userImage: UIImageView = .init()
    
    var loadingTask: Task<Void, Never>?
    
    func set(text: String) {
        username.text = text
    }

    private func loadImage(url: URL) async {
        userImage.image = nil
        let urlRequest = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData
        )
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            guard !Task.isCancelled else { return }
            userImage.image = UIImage(data: data)
        } catch {
            print("could not load image")
        }
    }
}
struct Response: Codable {
    let accounts: [Account]
}

struct Account: Codable {
    let user: User
    let discovers: [Discover]
}

struct Discover: Codable {
    let followingFriends: [String]
    let kind: Kind
    let name: String
    let avatar: URL
}

enum Kind: String, Codable {
    case followedByFriends = "followedByFriends"
    case followsYou = "followsYou"
    case popular = "popular"
}

struct User: Codable {
    let status: String
    let posts, followers: Int
    let name: String
    let following: Int
    let avatar: URL
}
class TableViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profiles.count
    }
    
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    private struct Profile {
        let title: String
        let url: URL
    }

    private var profiles: [Profile] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        Task {
            await loadUsers()
        }
    }

    private func loadUsers() async {
        guard let url = URL(string: "https://raw.githubusercontent.com/AZigangaraev/images/main/instagram.json") else { return }

        let urlRequest = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try decoder.decode(Response.self, from: data)
            profiles = response.accounts.map { account in
                Profile(title: "\(account.user.name)", url: account.user.avatar)
            }
            print(profiles)
            tableView.reloadData()
        } catch {
            print("Got error loading users: \(error)")
        }
    }


    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let cell = tableView
                .dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                as? TableViewCell
        else {
            fatalError("Could not deque cell")
        }

        let profile = profiles[indexPath.row]
        cell.set(text: profile.title)
        return cell
    }
}
