//  Created by Panasuk AD on 28.09.2024.
//

import SwiftUI

struct CheckBox: View {
    @Binding var value: Bool
    var body: some View {
        Group {
            if value {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                    .overlay {
                        if value {
                            Image(systemName: "checkmark")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.accentColor, lineWidth: 2)
                    .frame(width: 14, height: 14)
            }
        }
        .onTapGesture {
            self.value.toggle()
        }
    }
}

