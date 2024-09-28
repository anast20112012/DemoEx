//  Created by Panasuk AD on 28.09.2024.
//

import SwiftUI

struct CustomSecureField: View{
    let placeholder: String
    @Binding var text: String
    @State var Pas = false
    @State var img = "glaz"
    
    var body: some View{
        ZStack(alignment:.trailing){
            if !Pas {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(1)
                    .background(Color.gray)
                    .cornerRadius(5)
                .foregroundColor(.gray)}
            else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(1)
                    .background(Color.gray)
                    .cornerRadius(5)
                .foregroundColor(.gray)}
            
            Button(action: {Pas.toggle()}){
                    HStack{
                        Image(systemName: "eye.slash")
                            .padding(.trailing,30)
                            .scaleEffect(x:-1, y:1)
                            
                    } }.accentColor(.black)
            
//            Button(action: {
//                Pas.toggle()
//            }, label: {(Image("eye.slash")
//                .padding(.trailing,10))
//           .scaleEffect(x:-1, y:1)
//            })
            
        }
    }
}
