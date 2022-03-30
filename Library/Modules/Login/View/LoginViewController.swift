//
//  ViewController.swift
//  Library
//
//  Created by Hamon on 31/01/22.
//

import UIKit
import Alamofire

class LoginViewController: BaseUIViewController {

    private let ivLibrary : UIImageView = UIImageView()
    private let tlWelcome : UILabel = UILabel()
    private let tlRegister : UIButton = UIButton()
    private let ilEmail : CustomTextField = CustomTextField(placeHolder: "Email",addErrorFunction: true)
    private let ilPass : CustomTextField = CustomTextField(placeHolder: "Password", isPassField: true, addErrorFunction: true)
    private let bLogin: UIButton = UIButton()
    private let bLoginWithApple: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    private func initUI() {

        view.addSubview(ivLibrary)
        ivLibrary.image = UIImage(named: "ic_books")
        ivLibrary.addAnchorsAndCenter(centerX: true, centerY: false, width: grid * 6, height: grid * 6, left: nil, top: grid * 4.5, right: nil, bottom: nil)

        view.addSubview(tlWelcome)
        tlWelcome.applyCustomFont(fontSize: 30)
        tlWelcome.text = "Bienvenidos"
        tlWelcome.textAlignment = .center
        tlWelcome.addAnchorsAndSize(width: nil, height: 60, left: margin, top: 60, right: margin, bottom: nil, withAnchor: .top, relativeToView: ivLibrary)

        view.addSubview(ilEmail)
        ilEmail.addAnchorsAndSize(width: nil, height: 60, left: margin, top: grid, right: margin, bottom: nil, withAnchor: .top, relativeToView: tlWelcome)

        view.addSubview(ilPass)
        ilPass.addAnchorsAndSize(width: nil, height: 60, left: margin, top: grid * 0.8, right: margin, bottom: nil, withAnchor: .top, relativeToView: ilEmail)

        view.addSubview(bLogin)
        bLogin.applyStyle()
        bLogin.setTitle("Ingresar", for: .normal)
        bLogin.addAnchorsAndSize(width: nil, height: 50, left: margin, top: grid * 0.8, right: margin, bottom: nil, withAnchor: .top, relativeToView: ilPass)
        bLogin.addTarget(self, action: #selector(checkEmailAndPassEmpty), for: .touchUpInside)

        view.addSubview(bLoginWithApple)
        bLoginWithApple.applyStyle(color: .black)
        bLoginWithApple.setTitle("Sign in with Apple", for: .normal)
        bLoginWithApple.addAnchorsAndSize(width: nil, height: 50, left: margin, top: grid / 2, right: margin, bottom: nil, withAnchor: .top, relativeToView: bLogin)

        view.addSubview(tlRegister)
        tlRegister.setTitle("No tienes cuenta? Registrate.", for: .normal)
        tlRegister.titleLabel?.font = view.getCustomFont()
        tlRegister.setTitleColor(.blue, for: .normal)
        tlRegister.addTarget(self, action: #selector(moveToRegister), for: .touchUpInside)
        tlRegister.addAnchorsAndSize(width: nil, height: grid, left: margin, top: grid * 0.5, right: margin, bottom: nil, withAnchor: .top, relativeToView: bLoginWithApple)
    }

    @objc private func checkEmailAndPassEmpty() {
        if (checkEmail() && checkPass()) {
            moveTo(screen: BookListViewController(), showStyle: .fullScreen)
        }
    }

    private func checkEmail() -> Bool{
        if (ilEmail.getText() == "") {
            ilEmail.showErrorMessage(errorMessage:  "El email no puede estar vacio")
            return false
        } else {
            return true
        }
    }

    private func checkPass() -> Bool{
        if (ilPass.getText() == "") {
            ilPass.showErrorMessage(errorMessage:  "El password no puede estar vacio")
            return false
        } else if (ilPass.getText().count < 8) {
            ilPass.showErrorMessage(errorMessage:  "El password debe de tener al menos 8 caracteres")
            return  false
        } else if (ilPass.getText().count > 8) {
            return true
        } else {
            return false
        }
    }

    @objc private func moveToRegister() {
        moveTo(screen: RegisterViewController(), showStyle: .fullScreen)
    }

}

