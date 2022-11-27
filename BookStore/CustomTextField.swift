//
//  CustomTextField.swift
//  BookStore
//
//  Created by George Predan on 13.11.2022.
//

import SwiftUI

struct CustomTextField: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("", text: $text)
                .textFieldStyle(CustomTextFieldStyle(text: $text))
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    
    @FocusState private var isFocused: Bool
    @Binding var text: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(alignment: .leading) {
            
            if !text.isEmpty {
                Text("Email adress")
                    .foregroundColor(.yellow)
                    .transition(.asymmetric(insertion: .push(from: .bottom), removal: .push(from: .top)))
            }
            
            HStack {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundColor(.gray)
                
                configuration
                    .foregroundColor(.black)
                    .background(alignment: .leading) {
                        if text.isEmpty {
                            Text(verbatim: "mail@domain.com")
                                .accentColor(.gray)
                                .foregroundColor(.gray)
                        }
                    }
                    .accentColor(.black)
                    .focused($isFocused)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 6)
            .fill(isFocused ? .white : .gray.opacity(0.3)))
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                .stroke(lineWidth: 1)
                .fill(.gray)
        }
        .animation(.default, value: text.isEmpty)
    }
}


struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField()
    }
}
