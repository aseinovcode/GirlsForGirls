//
//  ChooseCountry.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 20.02.2023.
//

import Foundation
import UIKit

class ChooseCityViewController: BaseViewController {
    
    lazy var viewModel = {
        ChooseCityViewModel()
    }()
    
    let phone = UserDefaults.standard.string(forKey: "phoneNumber")
    
    var cityArray: [String] = ["Бишкек"]
    
    private lazy var cityTitle: UILabel = {
        let view = UILabel()
        view.text = "Выберите свой \nгород"
        view.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var cityField: PasswordTextField = {
        let view = PasswordTextField()
        view.setup(text: "Город")
        view.setLeftPaddingPoints(10)
        view.delegate = self
        view.isRightViewModeEnabled(isRightEnabled: true, rightImage: "dropdown")
        view.isSecureTextEntry = false
        return view
    }()
    
    private lazy var cityPickerView: UIPickerView = {
        let view = UIPickerView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var cityRegisterButton: Button = {
        let view = Button()
        view.setup(text: "Зарегистрироваться")
        view.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return view
    }()
    
    override func setupViews() {
        enableBackButton(enable: true)
        view.addSubview(cityField)
        view.addSubview(cityTitle)
        view.addSubview(cityRegisterButton)
    }
    
    override func constraints() {
        cityField.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width - 32)
        }
        
        cityTitle.snp.makeConstraints { make in
            make.bottom.equalTo(cityField.snp.top).offset(-32)
            make.leading.equalToSuperview().offset(16)
        }
        cityRegisterButton.snp.makeConstraints { make in
            make.top.equalTo(cityField.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width - 32)
        }
    }
    
    @objc func registerButtonTapped() {
        print("choose button tapped")
        print(phone)
        let vc = VerificationViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
}

extension ChooseCityViewController: UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputView = cityPickerView
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityArray[row]
    }

//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let label = UILabel()
//        label.text = cityArray[row]
//        label.textAlignment = .center
//        return label
//    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityField.text = cityArray[row]
        cityField.resignFirstResponder()
    }
}
