import Foundation

public enum HttpMethod: String {
    case put
    case post
    case get
    case patch
    case delete
}

public protocol Endpoint {
    var uri: String { get }
}

@available(iOS 15.0, *)
public protocol NetworkService {
    associatedtype Endpoints: Endpoint

    var baseUrl: String { get }

    func url(for endpoint: Endpoints) -> URL?
    func request(
        _ method: HttpMethod,
        endpoint: Endpoints,
        httpBody: Data?,
        headers: [String: String]?
    ) async throws -> Data?
}

@available(iOS 15.0, *)
public extension NetworkService {
    func url(for endpoint: Endpoints) -> URL? {
        return URL(string: "\(baseUrl)\(endpoint.uri)")
    }

    func request(
        _ method: HttpMethod,
        endpoint: Endpoints,
        httpBody: Data? = nil,
        headers: [String: String]? = nil
    ) async throws -> Data? {
        guard let url = url(for: endpoint)
        else { return nil }
        var request = URLRequest(url: url)
        request.httpBody = httpBody
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
