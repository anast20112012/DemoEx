//  Created by Panasuk AD on 28.09.2024.
//
//новый пароль тоже не сохраняется
//если введете одинаковые значения то перейдет на окно авторизации

import SwiftUI

struct NewPassView: View {
    @State var isShowAlert = false
    @State var isShowAlert2 = false
    @State var isShowAlert3 = false
    @State private var checkBox: Bool = false
    @State private var isShowingDetailView = false
    @StateObject var userViewModel = UserViewModel()
    
    @State var allFieldChec: Bool = false
    func checkAllFie() {
        if !userViewModel.email.isEmpty && !newpass.isEmpty {
            self.allFieldChec = true
        }
        else {
            self.allFieldChec = false
        }
    }
    @State var newpass: String = ""
    
    
    var body: some View{
        
        VStack(alignment: .leading){
        
            
            
            Text("New Password")
                .font(.custom("Roboto-Black", size: 30))
            
            Text("Enter new password")
                .font(.custom("Roboto-Light", size: 15))
                .foregroundColor(.gray)
                .padding(.top, 5)
                .fontWeight(.bold)
            
            Text("Password")
                .font(.custom("Roboto-Light", size: 15))
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .padding(.top,50)
            
            CustomSecureField(placeholder: "*********", text: $userViewModel.password)
                .alert(isPresented: $isShowAlert) {
                    Alert(title: Text("Не заполнили password"),
                          dismissButton: .default(Text("OK")))
                } .font(.system(size: 15))
            
            Text("Confirum password")
                .font(.custom("Roboto-Light", size: 15))
                .foregroundColor(.gray)
                .fontWeight(.bold)
            
            CustomSecureField(placeholder: "*********", text: $newpass)
                .alert(isPresented: $isShowAlert2) {
                    Alert(title: Text("Не заполнили povtor"),
                          dismissButton: .default(Text("OK")))
                }
                .alert(isPresented: $isShowAlert3) {
                    Alert(title: Text("Ne sovpal parol"),
                          dismissButton: .default(Text("OK")))
                } .font(.system(size: 15))
            
            VStack {
                NavigationLink(destination: SecondView(),
                               isActive: $isShowingDetailView)           { EmptyView() }
                
                Button("Log in", action: {
                    userViewModel.logIn()
                    checkAllFie()
                    if userViewModel.password == newpass {isShowingDetailView = true
                    }
                    else {isShowAlert3.toggle()
                        isShowingDetailView = false
                    }
                    //  isShowingDetailView = false
                    //isShowAlert.toggle()
                    userViewModel.signUp()
                })
                .frame(maxWidth: .infinity)
                .padding()
                .background(allFieldChec ? Color.blue : Color.gray)
                .cornerRadius(5)
                .padding(1)
                .background(Color.white)
                .cornerRadius(5)
                .foregroundColor(.white)
                .padding(.top, 100)
                
                
            }
            
            
        }.navigationBarHidden(true)
            .padding()
    }
    
}


#Preview {
    NewPassView()
}
