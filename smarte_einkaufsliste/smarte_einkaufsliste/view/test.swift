//
//  testView.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 23.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import Foundation
import SwiftUI
import Combine



 // MARK: testView:
 // my testView for testing things, ignore it it is just testing swiftUI

struct testView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var terms: Bool = false
//    @ObservedObject var passwordChecker = PasswordChecker()

    var body: some View {
        Form {
            Section(header: Text("Your Info")) {
                TextField("Name", text: self.$name)
                TextField("eamil", text: self.$email)
            }
//            Section(header: Text("Password")) {
//                SecureField("password", text: self.$password, onCommit: { })
//                if self.passwordChecker.password.isEmpty == false {
//                    SecureLevelView(level: self.passwordChecker.level)
//                }
//            }
//            Section {
//                if self.passwordChecker.level.rawValue >= 2 {
//                    Toggle(isOn: $terms) {
//                        Text("Accept the terms and conditions")
//                    }
//                    if self.terms {
//                        Button(action: {
//                            print("register account")
//                        }) {
//                            Text("OK")
//                        }
//                    }
//                }
//            }
        }
        .navigationBarTitle(Text("Registration Form"))
    }
}

enum PasswordLevel: Int {
    case none   = 0
    case weak   = 1
    case ok     = 2
    case strong = 3
}

struct SecureLevelView : View {
    var level: PasswordLevel
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[0]).frame(height: 10)
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[1]).frame(height: 10)
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[2]).frame(height: 10)
        }
    }
    
    func getColors() -> [Color] {
        switch self.level {
        case .none:
            return [.clear, .clear, .clear]
        case .weak:
            return [.red, .clear, .clear]
        case .ok:
            return [.red, .orange, .clear]
        case .strong:
            return [.red, .orange, .green]
        }
    }
}

class PasswordChecker: ObservableObject {
    public let didChange = PassthroughSubject<PasswordChecker, Never>()
    var password: String = "" {
        didSet {
            self.checkForPassword(password: self.password)
        }
    }
    
    var level: PasswordLevel = .none {
        didSet {
            self.didChange.send(self)
        }
    }
    
    public func checkForPassword(password: String) {
        if password.count == 0 {
            self.level = .none
        } else if password.count < 2 {
            self.level = .weak
        } else if password.count < 6 {
            self.level = .ok
        } else {
            self.level = .strong
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
