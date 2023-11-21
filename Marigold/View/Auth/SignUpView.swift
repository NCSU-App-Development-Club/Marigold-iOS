//
//  SignUpView.swift
//  Marigold
//
//  Created by Kevin Barnes on 8/4/23.
//

import RealmSwift
import SwiftUI

struct ToggleableTextField: View {
    @State private var isSecureField: Bool = true
    var placeholder:String
    @Binding var text:String

    var body: some View{
        HStack{
            if isSecureField{
                SecureField(placeholder,text:$text)
            }else{
                TextField(text,text:$text)
            }
        }.overlay(alignment: .trailing){
            Image(systemName: isSecureField ? "eye.slash":"eye").onTapGesture {
                isSecureField.toggle()
            }
        }
    }
}

struct SignUpView: View {
    
    @EnvironmentObject private var app: RealmSwift.App
    
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState var passwordFocus: Bool
    @State private var confirmPassword: String = ""
    @FocusState var confirmFocus: Bool
    
    @State private var creatingAccount: Bool = false
    @State private var failedToCreateAccount: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                
                VStack(alignment: .leading) {
                    ToggleableTextField(placeholder:"Password",text:$password)
                        .textContentType(nil)
                        .focused($passwordFocus)
                    if passwordFocus {
                        HStack{
                            Text("Your password must contain at least:")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                                .padding(.leading, 5)
                        }
                        Group {
                            Text("• 8 characters")
                                .foregroundColor(self.passwordRequirements[0] ? .green : .red)
                            Text("• 1 number")
                                .foregroundColor(self.passwordRequirements[1] ? .green : .red)
                            Text("• 1 capital letter")
                                .foregroundColor(self.passwordRequirements[2] ? .green : .red)
                        }
                        .padding(.leading, 8)
                        .font(.system(size: 12))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    ToggleableTextField(placeholder:"Confirm Password", text: $confirmPassword)
                        .textContentType(nil)
                        .focused($confirmFocus)
                    if confirmFocus {
                        HStack{
                            Text("Passwords must match")
                                .foregroundColor(confirmPassword == password ? .green : .red)
                                .font(.system(size: 14))
                                .padding(.leading, 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(
                    action: {
                        createAccount()
                    },
                    label: {
                        Group {
                            if creatingAccount {
                                ProgressView()
                            } else {
                                Text("Create Account")
                                    .fontWeight(.bold)
                            }
                        }
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                    }
                )
                .disabled(email.isEmpty || password.isEmpty || password != confirmPassword || !isPasswordValid())
                .buttonStyle(.borderedProminent)
                .alert("Failed to create account. Please try again.", isPresented: $failedToCreateAccount, actions: {})
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
        .navigationTitle(Text("Sign Up", comment: "Title at the top of the sign up view."))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func createAccount() {
        if creatingAccount {
            return
        }
        
        creatingAccount = true
        
        Task {
            do {
                try await app.emailPasswordAuth.registerUser(email: email, password: password)
                creatingAccount = false
            } catch {
                creatingAccount = false
                failedToCreateAccount = true
            }
        }
    }
    
    private var passwordRequirements: [Bool] {
        let minimumLength = 8
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let numberRegEx = ".*[0-9]+.*"

        let isCapitalLetter = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        let isNumber = NSPredicate(format: "SELF MATCHES %@", numberRegEx)

        return [
            password.count >= minimumLength,
            isNumber.evaluate(with: password),
            isCapitalLetter.evaluate(with: password)
        ]
    }
    
    func isPasswordValid() -> Bool {
        for condition in passwordRequirements {
            if !condition {
                return false
            }
        }
        return true
    }
    
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
