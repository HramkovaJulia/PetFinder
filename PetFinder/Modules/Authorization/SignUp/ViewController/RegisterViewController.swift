//
//import UIKit
//import SnapKit
//
//final class RegisterViewController: UIViewController {
//
//    //MARK: - UI Components
//
//    private lazy var topView: UIView = {
//        let topView = UIView()
//        return topView
//    }()
//    
//    private lazy var mainLabel: UILabel = {
//        let mainLabel = UILabel()
//        mainLabel.text = "Регистрация"
//        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
//        mainLabel.textColor = .black
//        return mainLabel
//    }()
//    
//    private lazy var leftButton: UIButton = {
//        let leftButton = UIButton()
//        leftButton.setImage(UIImage(named: "backspaceButton"), for: .normal)
//        leftButton.tintColor = UIColor(hex: 0xFCFCFC, alpha: 1)
//        leftButton.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
//        return leftButton
//    }()
//
//    @objc func closeViewController() {
//        navigationController?.popViewController(animated: true)
//    }
//    
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .plain)
//        tableView.backgroundColor = PFAssets.background.color
//        tableView.separatorStyle = .none
//        tableView.register(RegisterTableViewCell.self, forCellReuseIdentifier: RegisterTableViewCell.identifier)
//        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.identifier)
//        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: ButtonTableViewCell.identifier)
//        tableView.register(DoublePasswordTableViewCell.self, forCellReuseIdentifier: DoublePasswordTableViewCell.identifier)
//
//        return tableView
//    }()
//    
//    //MARK: - Lifecycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        setup()
//    }
//    
//    //MARK: - Setup UI
//    private func setup() {
//        setupUI()
//        makeConstarints()
//    }
//    
//    private func setupUI() {
//        view.backgroundColor = PFAssets.background.color
//        self.view.addSubview(topView)
//        topView.addSubview(mainLabel)
//        topView.addSubview(leftButton)
//        view.addSubview(tableView)
//    }
//    
//    private func makeConstarints() {
//        topView.snp.makeConstraints { maker in
//            maker.top.left.right.equalToSuperview()
//        }
//        
//        leftButton.snp.makeConstraints { maker in
//            maker.top.equalToSuperview().inset(61)
//            maker.left.equalToSuperview().inset(16)
//            maker.bottom.equalToSuperview().inset(20)
//        }
//        
//        mainLabel.snp.makeConstraints { maker in
//            maker.top.equalToSuperview().inset(63)
//            maker.left.equalTo(leftButton.snp.right).inset(-14)
//            maker.bottom.equalToSuperview().inset(22)
//        }
//        
//        tableView.snp.makeConstraints { make in
//            make.top.equalTo(topView.snp.bottom)
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.bottom.equalToSuperview()
//        }
//    }
//    
//    
//    //MARK: - Selectors
//    @objc private func didTapSignin() {
//        print("DEBUG :", "didTapSignin")
//        let vc = OnboardingViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//        navigationController?.navigationBar.topItem?.backButtonTitle = ""
//    }
//}
//
//extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        5
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        switch indexPath.section {
//        case 0:
//            let cell: RegisterTableViewCell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.identifier) as! RegisterTableViewCell
//            cell.config(label: "Имя пользователя*", placeholder: "Иван Иванов")
//            cell.textField.delegate = self
//            return cell
//        case 1:
//            let cell: RegisterTableViewCell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.identifier) as! RegisterTableViewCell
//            cell.config(label: "Почта", placeholder: "example@example.com")
//            cell.textField.delegate = self
//            return cell
//        case 2:
//            let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.identifier) as! CountryTableViewCell
//            cell.didSelectCountry = { [unowned self] in
//                cell.countryCellButtonTapped()
//            }
//            return cell
//        case 3:
//            let cell: DoublePasswordTableViewCell = tableView.dequeueReusableCell(withIdentifier: DoublePasswordTableViewCell.identifier) as! DoublePasswordTableViewCell
//            cell.config(label1: "Придумайте пароль", label2: "Повторите пароль", placeholder1: "", placeholder2: "")
//            cell.passwordDidChangeHandler = { [weak self] password1, password2 in
//                cell.updateTextFieldBorders(password1: password1, password2: password2)
//            }
//            cell.textField1.delegate = self
//            cell.textField2.delegate = self
//            return cell
//        case 4:
//            let cell: ButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier) as! ButtonTableViewCell
//                cell.didTap = { [weak self] in
//                    let vc = CustomTabBarControllerViewController()
//                    self?.navigationController?.pushViewController(vc, animated: true)
//                }
//            return cell
//        default:
//            return UITableViewCell()
//        }
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.section {
//        case 3:
//            return 172
//        default:
//            return 86
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 18
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        nil
//        
//    }
//}
//
//extension RegisterViewController: UITextFieldDelegate {
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        textField.layer.borderColor = textField.text?.isEmpty == true ? PFAssets.lightGray.color.cgColor : PFAssets.darkBlue.color.cgColor
//    }
//}
