import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    
    @Published var testUserAccountEmail: String = "artlume.io@example.com"
    @Published var testUserAccountPassword: String = "P455Word12"
    @AppStorage("loggedIn") var loggedIn: Bool = false

    func loginWithEmailAndPassword(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        guard !email.isEmpty, !password.isEmpty else {
            completion(false, "Email and password cannot be empty")
            return
        }

        // Basic email format validation
        guard isValidEmail(email) else {
            completion(false, "Invalid email format")
            return
        }

        if email == testUserAccountEmail {
            if password == testUserAccountPassword {
                withAnimation {
                    self.loggedIn = true
                }
                completion(true, "Login successful")
            } else {
                completion(false, "Incorrect password")
            }
        } else {
            completion(false, "User not found")
        }
    }

    func logout() {
        self.loggedIn = false
    }

    private func isValidEmail(_ email: String) -> Bool {
        // You can implement a more sophisticated email validation if needed
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailPredicate.evaluate(with: email)
    }
}
