//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit

class AuthenticationViewController: UIViewController {
    lazy var signInView: SignInView = {
        let view = SignInView()

        return view
    }()

    lazy var signUpView: SignUpView = SignUpView()

    lazy var authenticationView: AuthenticationView = {
        let view = AuthenticationView()

        view.events.onChangeTo = { type in
            switch type {
            case .signIn:
                view.addContentAuthView(self.signInView)
            case .signUp:
                view.addContentAuthView(self.signUpView)
            }
        }

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    private func setupSubViews() {
        view.addSubview(authenticationView)
        authenticationView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
