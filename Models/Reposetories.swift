//  Created by Panasuk AD on 28.09.2024.
//

import Foundation

import Supabase

class Repositories {
              // паттерн instance
    static let instance = Repositories()

    // подключение supabase
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://pcorbbsetxnyphziimih.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBjb3JiYnNldHhueXBoemlpbWloIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjcyMzk0NzEsImV4cCI6MjA0MjgxNTQ3MX0.Z9mr8iBem03FOa93C5aRvsX_qBUV8Z7oY4fJBzrykUc",
        options: .init())
    
    
    // регистрация в supabase
        func signUp(name: String, phone: String, email: String, password: String) async throws {
            try await supabase.auth.signUp(email: email, password: password)
            
            let user = try await supabase.auth.session.user
            
            let newUser = UserModel(id: user.id, name: name, phone: phone, created_at: .now)
            
            try await supabase.from("users")
                .insert(newUser)
                .execute()
            
            try await supabase.auth.signOut()
        }
    
    
    func signIn(email: String, password: String) async throws {
            try await supabase.auth.signIn(email: email, password: password)
        }

    }
    
    

