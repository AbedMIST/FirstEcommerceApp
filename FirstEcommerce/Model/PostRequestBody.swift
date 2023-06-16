
import Foundation

// MARK: - PostRequestBody
struct PostRequestBody: Codable {
    let formValues: [FormValue]

    enum CodingKeys: String, CodingKey {
        case formValues = "FormValues"
    }
}

// MARK: - FormValue
struct FormValue: Codable {
    let key, value: String

    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case value = "Value"
    }
}
