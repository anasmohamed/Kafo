//
//  LocationViewController.swift
//  kafo
//
//  Created by no one on 10/07/2021.
//

import UIKit
import SwiftyMenu
import SnapKit
class LocationViewController: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate{
   
    

    @IBAction func chooseCityBtnDidTapped(_ sender: Any) {
        
        let vc = UIViewController()
                vc.preferredContentSize = CGSize(width: 250,height: 300)
                let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
                pickerView.delegate = self
                pickerView.dataSource = self
                vc.view.addSubview(pickerView)
                let editRadiusAlert = UIAlertController(title: "Choose distance", message: "", preferredStyle: UIAlertController.Style.alert)
                editRadiusAlert.setValue(vc, forKey: "contentViewController")
                editRadiusAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
                editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(editRadiusAlert, animated: true)
    }
    @IBAction func chooseCountyBtnDidTapped(_ sender: Any) {
    }
    //    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var nearbyLocationBtn: UIButton!
//    @IBOutlet weak var cityTextField: UITextField!
//    @IBOutlet weak var cityDropDownMenu: SwiftyMenu!
    
//    @IBOutlet weak var countryDropDownMenu: SwiftyMenu!
    var choosenCity = "الرياض"
    var choosenDistrict = "الضفة"
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    private let dropDownOptionsDataSource = ["الرياض"]
    @objc func myTargetFunction(textField: UITextField) {
        print("myTargetFunction")
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 1
        vc.view.addSubview(pickerView)
        let editRadiusAlert = UIAlertController(title: "اختر المدينة", message: "", preferredStyle: UIAlertController.Style.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "تم", style: .default){_ in
            textField.text = self.choosenCity
        })
        editRadiusAlert.addAction(UIAlertAction(title: "إغلاق", style: .cancel, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
    @objc func myCityTargetFunction(textField: UITextField) {
        print("myTargetFunction")
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 2
        vc.view.addSubview(pickerView)
        let editRadiusAlert = UIAlertController(title: "اختر الحى ", message: "", preferredStyle: UIAlertController.Style.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "تم", style: .default){_ in
            textField.text = self.choosenDistrict
        })
        editRadiusAlert.addAction(UIAlertAction(title: "إغلاق", style: .cancel, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
    private let countryDropDownOptionsDataSource = ["الضفة","الاندلس","الامل","الخزامى","النخيل","القيروان","الفلاح","الروضة","النسيم","النظيم","السلي","القدس","الحمراء","غرناطة","النهضة","الخليج","الجزيرة","الرواد","الربوة","إشبيليا","اليرموك","قرطبة","الريان","أشبيلية","الشهداء","الدرعية","البديعة","ظهرة البديعة","عرقة","حي لبن","السويدي","شبرا","جامعة الملك سعود","الملقا","الملقا","الياسمين","النفل","الازدهار","حي المغرزات","الواحة","المرسلات","الورود","المروج","الغدير","الربيع","الرائد","العقيق","النخيل الغربي","النخيل الشرقي","الشفاء","بدر","المروة","الفواز","الحزم","العزيزية","الدار البيضاء","المنصورية","نمار","الدريهمية","شبرا","اليمامة","المصانع","بن تركي","السويدي","الشميسي","الحاير","الشعلان","المربع","المرقب","البطحاء","الديرة","الصالحية","الملز","الفاخرية","النرجس","العقيق"]
    
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTextField.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
        cityTextField.addTarget(self, action: #selector(myCityTargetFunction), for: .touchDown)

//        cityDropDownMenu.items = dropDownOptionsDataSource
//        cityDropDownMenu.delegate = self
//        countryDropDownMenu.items = countryDropDownOptionsDataSource
//        countØryDropDownMenu.delegate = self
//            countryTextField.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor
//            countryTextField.layer.borderWidth = 1
//            countryTextField.layer.cornerRadius = 8
//        cityTextField.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor
//        cityTextField.layer.borderWidth = 1
//        cityTextField.layer.cornerRadius = 8
        nearbyLocationBtn.layer.borderWidth = 2
        nearbyLocationBtn.layer.cornerRadius = 15

        

        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return dropDownOptionsDataSource[row]
        case 2:
           return countryDropDownOptionsDataSource[row]
        default:
         return   countryDropDownOptionsDataSource[row]

        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return dropDownOptionsDataSource.count
        case 2:
            return countryDropDownOptionsDataSource.count
        default:
            return countryDropDownOptionsDataSource.count

        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            choosenCity = dropDownOptionsDataSource[row]
        case 2:
            choosenDistrict = countryDropDownOptionsDataSource[row]

        default:
            choosenCity = countryDropDownOptionsDataSource[row]

        }
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setGradientBackground()
    }
    @IBAction func nearbyLocationBtnDidTapped(_ sender: Any) {
        let locationViewStoryboard = UIStoryboard(name: "ListOfBodyGuards", bundle: nil)
        let locationViewController = locationViewStoryboard.instantiateViewController(identifier: "ListOfBodyGuardsViewController") as! ListOfBodyGuardsViewController
        locationViewController.user = user
        self.navigationController?.pushViewController(locationViewController, animated: true)
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 55.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 140.0/255.0, blue:255.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension String: SwiftyMenuDisplayable {
    public var retrievableValue: Any {
    return self
    }
    
    public var displayableValue: String {
        return self
    }
    
    public var retrivableValue: Any {
        return self
    }
}
extension LocationViewController: SwiftyMenuDelegate {
    // Get selected option from SwiftyMenu
    func swiftyMenu(_ swiftyMenu: SwiftyMenu, didSelectItem item: SwiftyMenuDisplayable, atIndex index: Int) {
        print("Selected item: \(item), at index: \(index)")
    }
    
    // SwiftyMenu drop down menu will expand
    func swiftyMenu(willExpand swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu willExpand.")
    }

    // SwiftyMenu drop down menu did expand
    func swiftyMenu(didExpand swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu didExpand.")
    }

    // SwiftyMenu drop down menu will collapse
    func swiftyMenu(willCollapse swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu willCollapse.")
    }

    // SwiftyMenu drop down menu did collapse
    func swiftyMenu(didCollapse swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu didCollapse.")
    }
}
