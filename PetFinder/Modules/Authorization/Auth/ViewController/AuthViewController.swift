//import UIKit
//
//class AuthViewController: UIViewController {
//
//    private var isPasswordHidden = false
//
//    private lazy var mainLabel: UILabel = {
//        let mainLabel = UILabel()
//        mainLabel.text = "Добро пожаловать"
//        mainLabel.font = PFFontFamily.SFProText.semibold.font(size: 24)
//        mainLabel.textColor = .black
//        return mainLabel
//    }()
//
//    private lazy var leftButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "backspaceButton"), for: .normal)
//        button.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
//        return button
//    }()
//
//    @objc func closeViewController() {
//        navigationController?.popViewController(animated: true)
//    }
//
//    private var stackViewLogin: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.spacing = 10
//        return stack
//    }()
//
//    private var stackViewPassword: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.spacing = 10
//        return stack
//    }()
//
//    private lazy var nameLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Телефон и почта*"
//        label.font = PFFontFamily.SFProText.medium.font(size: 16)
//        return label
//    }()
//
//    private lazy var passwordLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Пароль*"
//        label.font = PFFontFamily.SFProText.medium.font(size: 16)
//        return label
//    }()
//
//    private lazy var textFieldLogin: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Ivanov@example.com"
//        textField.leftViewMode = .always
//        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
//        textField.layer.cornerRadius = 25
//        textField.layer.shadowColor = PFAssets.lightGray.color.cgColor
//        textField.layer.shadowRadius = 8
//        textField.layer.shadowOpacity = 0.06
//        textField.layer.shadowOffset = CGSize(width: 0, height: 4)
//        textField.layer.borderWidth = 1
//        textField.layer.borderColor = PFAssets.lightGray.color.cgColor
//
//        textField.backgroundColor = .white
//        let placeholderAttributes: [NSAttributedString.Key: Any] = [
//            .font: PFFontFamily.SFProText.light.font(size: 14),
//            .foregroundColor: UIColor.gray
//        ]
//        textField.attributedPlaceholder = NSAttributedString(string: "Ivanov@example.com", attributes: placeholderAttributes)
//
//        return textField
//    }()
//
//    private lazy var textFieldPassword: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = ""
//        textField.leftViewMode = .always
//        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
//        textField.backgroundColor = .white
//        textField.layer.cornerRadius = 25
//        textField.layer.borderColor = PFAssets.lightGray.color.cgColor
//        textField.layer.borderWidth = 1
//        textField.layer.shadowOffset = CGSize(width: 0, height: 4)
//        textField.rightViewMode = .always
//
//        let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 49, height: 22 + 2 * 5))
//        rightViewContainer.addSubview(hideButton)
//        textField.rightView = rightViewContainer
//
//        return textField
//    }()
//
//    private lazy var hideButton: UIButton = {
//        let button = UIButton()
//        let imageName = PFAssets.hide.name
//        button.setImage(UIImage(named: imageName), for: .normal)
//        button.frame = CGRect(x: 5, y: 5, width: 24, height: 22)
//        button.contentMode = .scaleAspectFit
//        button.addTarget(self, action: #selector(hideButtonTapped), for: .touchUpInside)
//
//        return button
//    }()
//
//    @objc private func hideButtonTapped() {
//        isPasswordHidden.toggle()
//        togglePasswordVisibility()
//    }
//
//    private func togglePasswordVisibility() {
//        textFieldPassword.isSecureTextEntry = isPasswordHidden
//        let imageName = isPasswordHidden ? PFAssets.show.name : PFAssets.hide.name
//        hideButton.setImage(UIImage(named: imageName), for: .normal)
//    }
//
//    private lazy var forgotPasswordButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Забыли пароль?", for: .normal)
//        button.titleLabel?.font = PFFontFamily.SFProText.regular.font(size: 14)
//        button.setTitleColor(PFAssets.deepBlue.color, for: .normal)
//        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
//        return button
//    }()
//
//    private lazy var orLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Или"
//        label.font = PFFontFamily.SFProText.regular.font(size: 12)
//        label.textColor = PFAssets.darkGray.color
//        label.textAlignment = .center
//        return label
//    }()
//
//    private lazy var googleButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Google", for: .normal)
//        button.titleLabel?.font = PFFontFamily.SFProText.medium.font(size: 16)
//        button.setTitleColor(UIColor.black, for: .normal)
//        button.backgroundColor = UIColor.white
//        button.layer.cornerRadius = 25
//        button.layer.borderColor = UIColor.white.cgColor
//        button.layer.borderWidth = 1
//
//        let iconImage = UIImage(named: PFAssets.google.name)
//           button.setImage(iconImage, for: .normal)
//           button.imageView?.contentMode = .scaleAspectFit
//
//           let spacing: CGFloat = 8
//           button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
////           button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
//           return button
//    }()
//
//    private lazy var appleButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Apple ID", for: .normal)
//        button.titleLabel?.font = PFFontFamily.SFProText.medium.font(size: 16)
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.backgroundColor = UIColor.black
//        button.layer.cornerRadius = 25
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.borderWidth = 1
//
//        let iconImage = UIImage(named: PFAssets.apple.name)
//           button.setImage(iconImage, for: .normal)
//           button.imageView?.contentMode = .scaleAspectFit
//
//           let spacing: CGFloat = 8
//           button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
////           button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
//           return button
//    }()
//
//    private lazy var comeInButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Войти", for: .normal)
//        button.titleLabel?.font = PFFontFamily.SFProText.semibold.font(size: 18)
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.backgroundColor = PFAssets.ginger.color
//        button.layer.cornerRadius = 25
//        button.layer.borderColor = UIColor.white.cgColor
//        button.layer.borderWidth = 1
//
////           button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
//           return button
//    }()
//
//    private lazy var registerButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Зарегистрироваться", for: .normal)
//        button.titleLabel?.font = PFFontFamily.SFProText.regular.font(size: 18)
//        button.setTitleColor(PFAssets.ginger.color, for: .normal)
//        button.backgroundColor = .clear
//        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
//        return button
//    }()
//
//    @objc private func registerTapped() {
////        let vc = RegisterViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
//    private var stackViewSocial: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.spacing = 24
//        return stack
//    }()
//
//    private var bottomButtonsStack: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.distribution = .fillEqually
//        stack.spacing = 0
//        return stack
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//    }
//
//    func setup() {
//        setupUI()
//        makeConstraints()
//    }
//
//    private func setupUI() {
//        self.view.backgroundColor = PFAssets.background.color
//        view.addSubview(leftButton)
//        view.addSubview(mainLabel)
//        view.addSubview(stackViewLogin)
//        stackViewLogin.addArrangedSubview(nameLabel)
//        stackViewLogin.addArrangedSubview(textFieldLogin)
//        view.addSubview(stackViewPassword)
//        stackViewPassword.addArrangedSubview(passwordLabel)
//        stackViewPassword.addArrangedSubview(textFieldPassword)
//        view.addSubview(forgotPasswordButton)
//        view.addSubview(orLabel)
//        view.addSubview(stackViewSocial)
//        stackViewSocial.addArrangedSubview(googleButton)
//        stackViewSocial.addArrangedSubview(appleButton)
//        view.addSubview(bottomButtonsStack)
//        bottomButtonsStack.addArrangedSubview(comeInButton)
//        bottomButtonsStack.addArrangedSubview(registerButton)
//
//    }
//
//    private func  makeConstraints() {
//
//        leftButton.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(63)
//            make.leading.equalToSuperview().offset(16)
//            make.height.width.equalTo(32)
//        }
//
//        mainLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(63)
//            make.leading.equalTo(leftButton.snp.trailing).offset(14)
//        }
//
//        textFieldLogin.snp.makeConstraints { make in
//            make.height.equalTo(53)
//        }
//
//        stackViewLogin.snp.makeConstraints { make in
//            make.top.equalTo(mainLabel.snp.bottom).offset(24)
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(82)
//        }
//
//        textFieldPassword.snp.makeConstraints { make in
//            make.height.equalTo(53)
//        }
//
//        stackViewPassword.snp.makeConstraints { make in
//            make.top.equalTo(stackViewLogin.snp.bottom).offset(18)
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(82)
//        }
//
//        forgotPasswordButton.snp.makeConstraints { make in
//            make.top.equalTo(stackViewPassword.snp.bottom).offset(10)
//            make.leading.equalToSuperview().inset(16)
//            make.height.equalTo(17)
//        }
//
//        orLabel.snp.makeConstraints { make in
//            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(32)
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(14)
//        }
//
//        stackViewSocial.snp.makeConstraints { make in
//            make.top.equalTo(orLabel.snp.bottom).offset(32)
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(136)
//        }
//
//        bottomButtonsStack.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().inset(34)
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(124)
//        }
//
//    }
//
//    @objc func forgotPasswordButtonTapped() {
//        let vc = ForgotPasswordViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//
//    }
//}
//
//extension AuthViewController: UITextFieldDelegate {
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        textField.layer.borderColor = textField.text?.isEmpty == true ? PFAssets.lightGray.color.cgColor : PFAssets.darkBlue.color.cgColor
//    }
//}
