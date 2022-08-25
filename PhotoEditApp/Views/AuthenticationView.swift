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
}

class AuthenticationView: UIView {
    let enterInfoResult = EnterInfoResult.signUp

    lazy var enterInfoView: UIView = {
        let view: UIView?
        switch enterInfoResult {
        case .signIn:
            view = SignUpView()
        case .signUp:
            view = SignUpView()
        }
        return view ?? UIView()
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

    lazy var topView: CKPageController = {
        let view = CKPageController()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titles = ["Sign In", "Sign Up", "As a Host"]

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
        addSubview(topView)
//        addSubview(enterInfoView)
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

        topView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(32.0)
            make.top.equalTo(registrView).inset(40.0)
            make.right.equalToSuperview().inset(32)
        }
        
//        enterInfoView.snp.makeConstraints { make in
//            
//        }

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
}
