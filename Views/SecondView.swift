//  Created by Panasuk AD on 28.09.2024.
//

import SwiftUI

struct SecondView: View {
    @State var email: String = ""
    @State var pass: String = ""
    @State private var checkBox: Bool = false
    @State private var isShowingDetailView = false
    @State var isShowAlert = false
    @State var isShowAlert2 = false
    @StateObject var userViewModel = UserViewModel()
    
    @State var allFieldChec: Bool = false
    func checkAllFie() {
        if !userViewModel.email.isEmpty && !userViewModel.password.isEmpty {
            self.allFieldChec = true
        }
        else {
            self.allFieldChec = false
        }
    }
    
    
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            NavigationLink(destination: HomeView(),
                           isActive: $userViewModel.isNavigate)
            { EmptyView() }
            
            
            Text("Welcome back")
                .font(.custom("Roboto-Bold", size: 30))
            
            Text("Fill in your email and password to continue")
                .font(.custom("Roboto-Bold", size: 15))
                .foregroundColor(.gray)
                .padding(.top, 5)
            
            
            Text("Email")
                .font(.system(size: 15))
                .padding(.top)
                .foregroundColor(.gray)
            CustomTextField(placeholder: "******@mail.com", text: $userViewModel.email)
                .alert(isPresented: $isShowAlert) {
                    Alert(title: Text("Не заполнили логин"),
                          dismissButton: .default(Text("OK"))) }
            
            
            Text("Password")
                .font(.system(size: 15))
                .foregroundColor(.gray)
            
            CustomSecureField (placeholder:"*********", text: $userViewModel.password)
                .alert(isPresented: $isShowAlert2) {
                    Alert(title: Text("Не заполнили parol"),
                          dismissButton: .default(Text("OK"))) }
            
            HStack{
                CheckBox(value: $checkBox)
                Text("remamber password")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                NavigationLink("forgot password?", destination: ForgotView())
                
            }
            .padding(.top)
            
         
            Text("Я не успела сделать окно с выводом ошибки, если пользователя нет (т.е он просто ничего не сделает), поэтому попробуйте, пожалуйста, оба варианта")
                .font(.custom("Roboto-Bold", size: 15))
                .foregroundColor(.gray)
                .padding(.top, 90)
            
                Button("log in", action: {
                    userViewModel.logIn()
                    checkAllFie()
                    if userViewModel.email != "" {isShowingDetailView = true}
                    else {isShowAlert.toggle()}
                    
                    if userViewModel.password != "" {isShowingDetailView = true}
                    else {isShowAlert2.toggle()
                        isShowingDetailView = false}
                })
                .frame(maxWidth: .infinity)
                .padding()
                .background(allFieldChec ? Color.blue : Color.gray)
                .cornerRadius(10)
                .padding(1)
                .background(Color.white)
                .cornerRadius(10)
                .foregroundColor(.white)
            
            
            HStack{
                Text("alredy have an account?")
                    .font(.system(size: 15))
                    .padding(.leading,70)
                    .foregroundColor(.gray)
                NavigationLink("sign up", destination: ContentView())
                
            }
            .padding(.top,20)
            
            Text("or sign in using")
                .font(.system(size: 15))
                .padding(.leading,130)
                .padding(.top,5)
                .foregroundColor(.gray)
            
            Image("1")
                .resizable()
                .padding(1)
                .frame(width: 20, height:20 )
            
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            
        }.navigationBarHidden(true)
            .padding()
    }
    
}


#Preview {
    SecondView()
}
