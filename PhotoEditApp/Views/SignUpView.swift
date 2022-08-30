//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
import ComponentKit

class SignUpView: UIView {
    lazy var nameTextField: CKTextField = {
        var view = CKTextField()
        view.placeholderText = "Name"
        return view
    }()

    lazy var emailTextField: CKTextField = {
        var view = CKTextField()
        view.placeholderText = "Email"
        return view
    }()

    lazy var passwordTextField: CKTextField = {
        var view = CKTextField()
        view.placeholderText = "password"
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubViews() {
        addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.22)
            make.top.equalToSuperview()
        }

        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.22)
            make.top.equalTo(nameTextField.snp_bottomMargin).inset(-20.0)
        }

        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.22)
            make.top.equalTo(emailTextField.snp_bottomMargin).inset(-20.0)
        }
    }
}
