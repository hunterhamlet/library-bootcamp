//
// Created by Hamon on 02/02/22.
//

import UIKit

class RegisterViewController: BaseUIViewController {

    private lazy var cardContainer: UIView = UIView()
    private lazy var btRegister: UIButton = UIButton()
    private lazy var tlUserName: CustomTextField = CustomTextField(placeHolder: "Nombre", backgroundColorField: .white)
    private lazy var tlUserEmail: CustomTextField = CustomTextField(placeHolder: "Email", backgroundColorField: .white)
    private lazy var tlUserPass: CustomTextField = CustomTextField(placeHolder: "Password", isPassField: true, backgroundColorField: .white)
    private lazy var tlUserConfirmPass: CustomTextField = CustomTextField(placeHolder: "Repetir password", isPassField: true, addErrorFunction: true, backgroundColorField: .white)


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        addContainer()
        addButtonRegister()
        addFieldsRegister()
    }

    private func addContainer() {
        view.addSubview(cardContainer)
        cardContainer.backgroundColor = .white
        cardContainer.layer.cornerRadius = 5
        cardContainer.addAnchorsAndSize(width: nil, height: grid * 9, left: margin, top: grid * 3, right: margin, bottom: nil)
    }

    private func addFieldsRegister() {
        cardContainer.addSubview(tlUserName)
        tlUserName.addAnchorsAndSize(width: nil, height: 60, left: margin / 2, top: margin, right: margin / 2, bottom: nil)

        cardContainer.addSubview(tlUserEmail)
        tlUserEmail.addAnchorsAndSize(width: nil, height: 60, left: margin / 2, top: margin, right: margin / 2, bottom: nil, withAnchor: .top, relativeToView: tlUserName)

        cardContainer.addSubview(tlUserPass)
        tlUserPass.addAnchorsAndSize(width: nil, height: 60, left: margin / 2, top: margin, right: margin / 2, bottom: nil, withAnchor: .top, relativeToView: tlUserEmail)

        cardContainer.addSubview(tlUserConfirmPass)
        tlUserConfirmPass.addAnchorsAndSize(width: nil, height: 60, left: margin / 2, top: margin, right: margin / 2, bottom: nil, withAnchor: .top, relativeToView: tlUserPass)
    }

    private func addButtonRegister() {
        view.addSubview(btRegister)
        btRegister.applyStyle()
        btRegister.setTitle("Registrar", for: .normal)
        btRegister.addTarget(self, action: #selector(moveToBookList), for: .touchUpInside)
        btRegister.addAnchorsAndSize(width: nil, height: 50, left: margin, top: margin, right: margin, bottom: nil, withAnchor: .top, relativeToView: cardContainer)
    }

    @objc private func moveToBookList() {
        moveTo(screen: BookListViewController(), showStyle: .fullScreen)
    }

}
