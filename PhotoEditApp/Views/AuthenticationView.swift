//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
import ComponentKit

enum EnterInfoResult {
    case signIn
    case signUp

    var result: UIView {
        switch self {
        case .signIn: return SignInView()
        case .signUp: return SignUpView()
        }
    }
}

class AuthenticationView: UIView {
    struct Events {
        var onChangeTo: ((EnterInfoResult) -> Void)?
    }

    var events: Events = .init()
    var resultView = EnterInfoResult.signIn.result

    lazy var enterInfoView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var signInBackgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.RegistrationPageImage.images

        return view
    }()

    lazy var registrView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.baseBackgroundDark.colors
        view.clipsToBounds = true

        return view
    }()

//    lazy var topView: CKPageController = {
//        let view = CKPageController()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.titles = ["Sign In", "Sign Up", "As a Host"]
//
//        return view
//    }()

    lazy var signUp: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("sign up", for: .normal)
        view.addTarget(self, action: #selector(signUpTapped(on:)), for: .touchUpInside)

        return view
    }()

    lazy var signIn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("sign in", for: .normal)
        view.addTarget(self, action: #selector(signInTapped(on:)), for: .touchUpInside)
        return view
    }()

    lazy var registerTypeStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [signIn, signUp])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.spacing = 10

        return view
    }()

    lazy var appleIcon: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.ic_apple.images, for: .normal)

        return view
    }()

    lazy var googleIcon: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.ic_google.images, for: .normal)

        return view
    }()

    lazy var nextButton: CKContentActionButton = {
        let view = CKContentActionButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(with: CKContentActionButtonViewModel(
            text: "Next",
            image: UIImage(systemName: "chevron.right"),
            backgroundColor: Colors.basePurple.colors
        ))
        view.layer.cornerRadius = 24.0
        view.clipsToBounds = true

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
        addSubview(signInBackgroundImage)
        addSubview(registrView)
        addSubview(registerTypeStackView)
        addSubview(enterInfoView)
        addSubview(appleIcon)
        addSubview(googleIcon)
        addSubview(nextButton)

        signInBackgroundImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.65)
        }

        registrView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.57)
        }

        registerTypeStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(32.0)
            make.top.equalTo(registrView).inset(40.0)
            make.right.equalToSuperview().inset(32)
        }

        enterInfoView.snp.makeConstraints { make in
            make.top.equalTo(registerTypeStackView).inset(60)
            make.left.right.equalToSuperview().inset(32)
            make.height.equalToSuperview().multipliedBy(0.28)
        }

        appleIcon.snp.makeConstraints { make in
            make.bottom.equalTo(-32.0)
            make.left.equalTo(32.0)
            make.width.height.equalTo(50.0)
        }

        googleIcon.snp.makeConstraints { make in
            make.bottom.equalTo(-32.0)
            make.left.equalTo(appleIcon.snp_rightMargin).inset(-20.0)
            make.width.height.equalTo(50.0)
        }

        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(-32.0)
            make.right.equalTo(-32.0)
            make.left.equalTo(googleIcon.snp_rightMargin).inset(-83.0)
            make.height.equalTo(50.0)
        }
    }

    @objc func signInTapped(on: UIButton) {
        events.onChangeTo?(.signIn)
    }

    @objc func signUpTapped(on: UIButton) {
        events.onChangeTo?(.signUp)
    }

    public func addContentAuthView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        enterInfoView.subviews.forEach { $0.removeFromSuperview() }
        enterInfoView.addSubview(view)
        view.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(enterInfoView)
        }
    }
}
