//  Created by Panasuk AD on 28.09.2024.
//
//с почты должны приходить цифры и их сюда надо ввеси
//не успела поэтому можно любые цифры

import SwiftUI

struct OTPView: View {
    @State var var1: String = ""
    @State var var2: String = ""
    @State var var3: String = ""
    @State var var4: String = ""
    @State var var5: String = ""
    @State var var6: String = ""
    @StateObject var userViewModel = UserViewModel()
    @State private var isShowingDetailView = false
    @State var isShowAlert = false
    
    @State var allFieldChec: Bool = false
    func checkAllFie() {      //функция которая отвечает за покраску кнопки если введены все значения
        if !var1.isEmpty && !var2.isEmpty && !var3.isEmpty && !var4.isEmpty && !var5.isEmpty && !var6.isEmpty {
            self.allFieldChec = true
        }
        else {
            self.allFieldChec = false
        }
    }
    
    var body: some View {
  
        VStack(alignment: .leading){
            
            NavigationLink(destination: HomeView(),
                           isActive: $userViewModel.isNavigate)
            { EmptyView() }
            
            Text("OTP Verification")
                .font(.custom("Roboto-Bold", size: 30))
            
            Text("Enter the 6 numbers sent to your email")
                .font(.custom("Roboto-Light", size: 15))
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .padding(.top, 5)
                .alert(isPresented: $isShowAlert) {
                    Alert(title: Text("Введите 6 цифр (но можно любые)"),
                          dismissButton: .default(Text("OK"))) }
            
            HStack{
                CustomTextField( placeholder: "", text: $var1)
                    .frame(width: 40, height: 32, alignment: .center)
                    .padding(.leading,6)
                    .padding(.trailing,6)
                CustomTextField( placeholder: "", text: $var2)
                    .frame(width: 40, height: 32, alignment: .center)
                    .padding(.leading,6)
                    .padding(.trailing,6)
                CustomTextField( placeholder: "", text: $var3)
                    .frame(width: 40, height: 32, alignment: .center)
                    .padding(.leading,6)
                    .padding(.trailing,6)
                CustomTextField( placeholder: "", text: $var4)
                    .frame(width: 40, height: 32, alignment: .center)
                    .padding(.leading,6)
                    .padding(.trailing,6)
                CustomTextField( placeholder: "", text: $var5)
                    .frame(width: 40, height: 32, alignment: .center)
                    .padding(.leading,6)
                    .padding(.trailing,6)
                CustomTextField( placeholder: "", text: $var6)
                    .frame(width: 40, height: 32, alignment: .center)
                    .padding(.leading,6)
                    .padding(.trailing,6)
            }
            .padding(.top, 50)
            
            HStack{
                Text("If your didnt receive code")
                    .font(.system(size: 15))
                    .padding(.leading,50)
                    .foregroundColor(.gray)
                NavigationLink("resend", destination: ForgotView())
                
            } .padding(.top, 40)
            
            
            VStack {
                NavigationLink(destination: NewPassView(),
                               isActive: $isShowingDetailView)           { EmptyView() }
                 
                Button("Send OTP", action: {
                    
                    if !var1.isEmpty && !var2.isEmpty && !var3.isEmpty && !var4.isEmpty && !var5.isEmpty && !var6.isEmpty  { checkAllFie()
                        isShowingDetailView = true
                        }
                    
                    else {
                        isShowAlert.toggle()
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
        }
        .navigationBarHidden(true)
        .padding()
    }
}

#Preview {
    OTPView()
}
