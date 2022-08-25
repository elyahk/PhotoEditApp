//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit

class AuthenticationViewController: UIViewController {
    lazy var signInView: AuthenticationView = {
        let view = AuthenticationView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    private func setupSubViews() {
        view.addSubview(signInView)
        signInView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
