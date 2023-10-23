//
//  SignUpView.swift
//  Marigold
//
//  Created by Kevin Barnes on 8/4/23.
//

import RealmSwift
import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject private var app: RealmSwift.App
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var creatingAccount: Bool = false
    @State private var failedToCreateAccount: Bool = false
    @State private var showPasswordAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $password)
                    .textContentType(nil)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textContentType(nil)
                
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
                .disabled(email.isEmpty || password.isEmpty || password != confirmPassword)
                .buttonStyle(.borderedProminent)
                .alert("Failed to create account. Please try again.", isPresented: $failedToCreateAccount, actions: {})
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
        .navigationTitle(Text("Sign Up", comment: "Title at the top of the sign up view."))
        .navigationBarTitleDisplayMode(.inline)
        .alert("Password must be at least 8 characters, include a capital letter, and a number.", isPresented: $showPasswordAlert) {
            Button("OK", role: .cancel) { }
        }

    }
    
    func isPasswordValid(_ password: String) -> Bool {
        let minimumLength = 8
        
        guard password.count >= minimumLength else {
            showPasswordAlert = true
            return false
        }
        
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let isCapitalLetter = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        guard isCapitalLetter.evaluate(with: password) else {
            showPasswordAlert = true
            return false
        }
        
        let numberRegEx  = ".*[0-9]+.*"
        let isNumber = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        guard isNumber.evaluate(with: password) else {
            showPasswordAlert = true
            return false
        }
        
        return true
    }

    func createAccount() {
        if creatingAccount {
            return
        }
        
        guard isPasswordValid(password) else {
                // Alert will show because showPasswordAlert is set to true in isPasswordValid function
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
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
