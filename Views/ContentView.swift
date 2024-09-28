//  Created by Panasuk AD on 28.09.2024.
//
//начальная страница
//
//
//
// https://github.com/anast20112012/DemoEx.git
//
//

import SwiftUI

struct ContentView: View {
    @State var newpass: String = ""
    @State private var checkBox: Bool = false
    @State private var isShowingDetailView = false
    @State var isShowAlert = false
    @State var isShowAlert2 = false
    @State var isShowAlert3 = false
    @State var isShowAlert4 = false
    @State var isShowAlert5 = false
    @State var isShowAlert6 = false
    @State var isShowAlert7 = false
    @State var isShowAlert8 = false
    @StateObject var userViewModel = UserViewModel()
    
    @State var allFieldChec: Bool = false
    func checkAllFie() {      //функция которая отвечает за покраску кнопки если введены все значения
        if !userViewModel.user.name.isEmpty && !userViewModel.user.phone.isEmpty && !userViewModel.email.isEmpty && !userViewModel.password.isEmpty && !newpass.isEmpty && checkBox {
            self.allFieldChec = true
        }
        else {
            self.allFieldChec = false
        }
    }
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading)
            {
                NavigationLink(destination: HomeView(),
                               isActive: $isShowingDetailView)
                { EmptyView() }
                Text("Create an account")
                    .font(.custom("Roboto-Bold", size: 30))
                    .padding(.top, 40)
                   
                Text("Complete the sign up process to go started")
                    .font(.custom("Roboto-Light", size: 15))
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                
                Text("Full name")
                    .font(.system(size: 15))
                    .padding(.top)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                
                //кастомный текстбокс чтоб красиво выглядел. находиться кастом в отдельном файле
                CustomTextField(placeholder: "Иванов Иван", text: $userViewModel.user.name)
                    .alert(isPresented: $isShowAlert) {
                        Alert(title: Text("Не заполнили name"),
                              dismissButton: .default(Text("OK")))}
                    .font(.system(size: 15))
                
                Text("Phone Number")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                
                CustomTextField(placeholder: "+7(999)999-99-99", text: $userViewModel.user.phone)
                    .alert(isPresented: $isShowAlert2) {
                        Alert(title: Text("Не заполнили numer"),
                              dismissButton: .default(Text("OK")))}
                    .font(.system(size: 15))
                
                Text("Email Address")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                
                CustomTextField(placeholder: "******@mail.com", text: $userViewModel.email)
                    .alert(isPresented: $isShowAlert3) {
                        Alert(title: Text("Не заполнили email"),
                              dismissButton: .default(Text("OK")))
                    } .font(.system(size: 15))
                
                Text("Password")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                
                CustomSecureField(placeholder: "*********", text: $userViewModel.password)
                    .alert(isPresented: $isShowAlert4) {
                        Alert(title: Text("Не заполнили password"),
                              dismissButton: .default(Text("OK")))
                    } .font(.system(size: 15))
                
                Text("Confirum password")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .alert(isPresented: $isShowAlert8) {
                        Alert(title: Text("Вы не согласились с условиями и политикой безопасности. Нажмите на флажок"),
                              dismissButton: .default(Text("OK")))}
                
                CustomSecureField(placeholder: "*********", text: $newpass)
                    .alert(isPresented: $isShowAlert5) {
                        Alert(title: Text("Не заполнили Confirum"),
                              dismissButton: .default(Text("OK")))
                    }
                    .alert(isPresented: $isShowAlert6) {
                        Alert(title: Text("Пароли не совпадают"),
                              dismissButton: .default(Text("OK")))
                    } .font(.system(size: 15))
                
                HStack //включает в себя чекбокс и два текста
                {
                    CheckBox(value: $checkBox)
                        .alert(isPresented: $isShowAlert7) {
                            Alert(title: Text("Вы успешно зарегистрировались! Нажмите внизу Sign Up"),
                                  dismissButton: .default(Text("OK")))
                        }
                    
                        Text("By ticking this box you to our \(Text("Terms and conditions and private polisy") .foregroundColor(.orange) .font(.system(size: 12)) )")
                            .font(.system(size: 12))
                        .foregroundColor(.gray)
                } .frame(width: 350, height: 50)
                .padding(.top,10)
   
                VStack 
                {
                    Button("Sign Up", action: {
                        checkAllFie()
                        
                        if userViewModel.user.name != "" {isShowingDetailView = true}
                        else {isShowAlert.toggle()}
                        
                        if userViewModel.user.phone != "" {isShowingDetailView = true}
                        else {isShowAlert2.toggle()}
                        
                        if userViewModel.email != "" {isShowingDetailView = true}
                        else {isShowAlert3.toggle()}
                        
                        if userViewModel.password != "" {isShowingDetailView = true}
                        else {isShowAlert4.toggle()}
                        
                        if newpass != "" {isShowingDetailView = true}
                        else {isShowAlert5.toggle()}
                        
                        if userViewModel.password == newpass {isShowingDetailView = true
                        }
                        else {isShowAlert6.toggle()
                           // isShowingDetailView = false
                        }
                        if checkBox  {isShowingDetailView = true
                            isShowAlert7.toggle()}
                        else {isShowAlert8.toggle()}
                        
                       
                        isShowingDetailView = false
                        
                        userViewModel.signUp()
                        
                    }
                    )
                    
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(allFieldChec ? Color.blue : Color.gray)
                    .cornerRadius(5)
                    .padding(1)
                    .background(Color.white)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                }
                HStack{
                    Text("Alredy have an account?")
                        .font(.custom("Roboto-Light", size: 15))
                        .padding(.leading,70)
                        .foregroundColor(.gray)
                    NavigationLink("Sign in", destination: SecondView())
                    
                }
                
                Text("or sign in using")
                    .font(.custom("Roboto-Light", size: 15))
                    .padding(.leading,130)
                    .padding(.top,5)
                    .foregroundColor(.gray)
                
                Image("1")
                    .resizable()
                    .padding(1)
                    .frame(width: 20, height:20 )
                
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .padding()
        }
        .navigationBarHidden(true)
        
    }
}


#Preview {
    ContentView()
}
