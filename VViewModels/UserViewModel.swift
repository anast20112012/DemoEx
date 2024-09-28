//  Created by Panasuk AD on 28.09.2024.
//

import Foundation

class UserViewModel: ObservableObject{
    
    @Published var user = UserModel(id: UUID(), name: "", phone: "", created_at: .now)
    @Published  var email: String = ""
        @Published  var password: String = ""
        @Published  var confirmPassword: String = ""
        
        @Published  var isProgress: Bool = false
        @Published var isNavigate: Bool = false
        @Published  var error: Bool = false
        
    //функция регистрации, имя телефон почта и пароль
        func signUp() {
                        Task {
                            do {
                                await MainActor.run {
                                    self.isProgress = true
                                }
                                try await Repositories.instance.signUp(name: user.name, phone: user.phone, email: email, password: password)
                                await MainActor.run {
                                    self.isNavigate = true
                                   self.isProgress = false
                                }
                            } catch {
                                print("ERROR: " + error.localizedDescription)
                                await MainActor.run {
                                    self.error = true
                                    self.isProgress = false
                                }
                            }
                        }
                    }
    
    //функция авторизации, по почте и паролю
    func logIn() {
                    Task {
                        do {
                            await MainActor.run {
                                self.isProgress = true
                            }
                            try await Repositories.instance.signIn(email: email, password: password)
                            await MainActor.run {
                                self.isNavigate = true
                               self.isProgress = false
                            }
                        } catch {
                            print("ERROR: " + error.localizedDescription)
                            await MainActor.run {
                                self.error = true
                                self.isProgress = false
                            }
                        }
                    }
                }
    
    

}

