//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
import ComponentKit

class SignInView: UIView {
    lazy var emailTextField: CKTextField = {
        let view = CKTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholderText = "Email"

        return view
    }()

    lazy var passwordTextField: CKTextField = {
        let view = CKTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholderText = "Password"

        return view
    }()

    lazy var forgotButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Forgot Password", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 13.0)
        view.setTitleColor(Colors.basePurple.colors, for: .normal)

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
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(forgotButton)

        emailTextField.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(32.0)
            make.height.equalToSuperview().multipliedBy(0.22)
            make.top.equalToSuperview()
        }

        passwordTextField.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(32.0)
            make.height.equalToSuperview().multipliedBy(0.22)
            make.top.equalTo(emailTextField.snp_bottomMargin).inset(-20.0)
        }

        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).inset(-16.0)
            make.right.equalToSuperview().inset(35.0)
            make.height.equalTo(16.0)
        }
    }
}

extension UIView {
    func roundCornerView(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: .init(width: radius, height: radius)
        )

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
