import Foundation

struct Transaction: Encodable {
    let id: String
    let userId: String
    let startDate: Date
    let endDate: Date
}

func uploadLatestsTransaction() {
    // get the latest transaction
    let transaction = Transaction(id: "123", userId: "456", startDate: Date(), endDate: Date())

    let jsonEncoder = JSONEncoder()
    // >>> This line tells the encoder to convert between the two styles <<<
    jsonEncoder.keyEncodingStrategy = .convertToSnakeCase

    guard let jsonData = try? jsonEncoder.encode(transaction) else { return }
    print(String(decoding: jsonData, as: UTF8.self))
    /* e.g.,
     {
        "id":"123",
        "end_date":704374697.15610504,
        "user_id":"456",
        "start_date":704374697.15610504
     }
     */

    // upload `jsonData`
}
