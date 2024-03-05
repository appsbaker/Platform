import UIKit

@available(iOS 15, *)
public extension UIImageView {
    func loadImage(from url: URL) async throws {
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        self.image = .init(data: data)
    }

    func loadImage(from urlString: String) async throws {
        guard let url = URL(string: urlString)
        else { throw URLError(.badURL) }
        try await loadImage(from: url)
    }
}
