import Foundation

public enum Endpoint {
    case subreddit(name: String, sort: String?)
    case subredditAbout(name: String)
    case searchSubreddit
    case comments(name: String, id: String)
    case accessToken
    case me, mineSubscriptions
    case vote, visits, save, unsave
    case userSaved(username: String)
    
    func path() -> String {
        switch self {
        case let .subreddit(name, sort):
            if name == "top" || name == "best" || name == "new" || name == "rising" || name == "hot" {
                return name
            } else if let sort = sort {
                return "r/\(name)/\(sort)"
            } else {
                return "r/\(name)"
            }
        case .searchSubreddit:
            return "api/search_subreddits"
        case let .comments(name, id):
            return "r/\(name)/comments/\(id)"
        case .accessToken:
            return "api/v1/access_token"
        case .me:
            return "api/v1/me"
        case .mineSubscriptions:
            return "subreddits/mine/subscriber"
        case let .subredditAbout(name):
            return "r/\(name)/about"
        case .vote:
            return "api/vote"
        case .visits:
            return "api/store_visits"
        case .save:
            return "api/save"
        case .unsave:
            return "api/unsave"
        case let .userSaved(username):
            return "user/\(username)/saved"
        }
    }
}
