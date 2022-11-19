//import Foundation
//
//struct Response: Codable {
//    let accounts: [Account]
//}
//
//struct Account: Codable {
//    let user: User
//    let discovers: [Discover]
//}
//
//struct Discover: Codable {
//    let followingFriends: [String]
//    let kind: Kind
//    let name: String
//    let avatar: URL
//}
//
//enum Kind: String, Codable {
//    case followedByFriends = "followedByFriends"
//    case followsYou = "followsYou"
//    case popular = "popular"
//}
//
//struct User: Codable {
//    let status: String
//    let posts, followers: Int
//    let name: String
//    let following: Int
//    let avatar: URL
//}
//
