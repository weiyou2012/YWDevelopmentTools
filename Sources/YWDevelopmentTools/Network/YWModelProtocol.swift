import Foundation

public protocol YWModelProtocol: Codable {}

public extension YWModelProtocol {
    /// data conversion model, compatible with codingkey named snake
    static func transitionToModel(withData data: Data) -> Self? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let model = try decoder.decode(Self.self, from: data)
            return model
        } catch {
            print("SnakeCase modle *\(String(describing: self))* decode fail：\(error)")
            do {
                decoder.keyDecodingStrategy = .useDefaultKeys
                let model = try decoder.decode(Self.self, from: data)
                return model
            } catch {
                print("Default modle *\(String(describing: self))* decode fail：\(error)")
                return nil
            }
        }
    }
    
    func transitionToData() -> Data? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        do {
            let data = try encoder.encode(self)
            return data
        } catch {
            do {
                encoder.keyEncodingStrategy = .useDefaultKeys
                return try encoder.encode(self)
            } catch {
                return nil
            }
        }
    }
}
