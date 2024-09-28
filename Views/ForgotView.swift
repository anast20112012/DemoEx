//  Created by Panasuk AD on 28.09.2024.
//
//страница на которую вводят почту для отправки цифр

//проверку почты не успела сделать можно вводить любую информацию

import SwiftUI

struct ForgotView: View {
    @State var email: String = ""
    @State var pass: String = ""
    @State private var checkBox: Bool = false
    @State private var isShowingDetailView = false
    @State var isShowAlert = false
    //@State var isShowAlert2 = false
    @StateObject var userViewModel = UserViewModel()
    
    @State var allFieldChec: Bool = false
    func checkAllFie() {
        if !userViewModel.email.isEmpty {
            self.allFieldChec = true
        }
        else {
            self.allFieldChec = false
        }
    }
    
    var body: some View{
        
        VStack(alignment: .leading){
           
            Text("Forgot Password")
                .font(.custom("Roboto-Bold", size: 30))
            
            Text("Enter your email adress")
                .font(.custom("Roboto-Light", size: 15))
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .padding(.top, 5)
            
            Text("Email Address")
                .font(.system(size: 15))
                .padding(.top,50)
                .foregroundColor(.gray)
                .fontWeight(.bold)
//                .alert(isPresented: $isShowAlert2) {
//                    Alert(title: Text("Pismo otpravleno na email"),
//                          dismissButton: .default(Text("OK"))) }
            
            CustomTextField(placeholder: "******@mail.com", text: $userViewModel.email)
                .alert(isPresented: $isShowAlert) {
                    Alert(title: Text("Не заполнили email"),
                          dismissButton: .default(Text("OK"))) }
               
            VStack {
                
                NavigationLink(destination: OTPView(),
                               isActive: $isShowingDetailView)           { EmptyView() }
                 
                Button("Send OTP", action: {checkAllFie()
                    
                    //проверка на пустое значение в поле
                    
                    if userViewModel.email != "" {isShowingDetailView = true
                        }
                    
                    else { isShowAlert.toggle()
                        isShowingDetailView = false}
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
            
            HStack{
                Text("Remember password? Back to")
                    .font(.system(size: 15))
                    .padding(.leading,50)
                    .foregroundColor(.gray)
                NavigationLink("Sign up", destination: SecondView())
                
            }
            
            
            
            
        }.navigationBarHidden(true)
            .padding()
    }
    
}


#Preview {
    ForgotView()
}
