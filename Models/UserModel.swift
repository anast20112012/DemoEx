//  Created by Panasuk AD on 28.09.2024.
//
//модель для БД


import Foundation

struct UserModel: Codable {
    var id: UUID
    var name: String
    var phone: String
    var created_at: Date
}

