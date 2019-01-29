//
//  VCData.swift
//  MayteDominguez
//
//  Created by Mayte Dominguez on 10/18/18.
//  Copyright © 2018 Mayte Dominguez. All rights reserved.
//

import UIKit

class VCData: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtApellidoPaterno: UITextField!
    @IBOutlet weak var txtApellidoMaterno: UITextField!
    @IBOutlet weak var txtFechadeNacimiento: UITextField!
    @IBOutlet weak var txtNiveldEstudio: UITextField!
    @IBOutlet weak var txtNdeCel: UITextField!
    @IBOutlet weak var txtEdoCivil: UITextField!
    @IBOutlet weak var SwtchTerminosYCond: UISwitch!
    @IBOutlet weak var lblTerYCond: UILabel!
    
    
    @IBOutlet weak var MarginY: NSLayoutConstraint!
    @IBOutlet weak var MarginY2: NSLayoutConstraint!
    
    var swichIsOn : Bool = false
    
    let datePicker = UIDatePicker()
    let pickerNivelEstudios = UIPickerView ()
    let pickerEdoCivil = UIPickerView ()
    
    
    var NivelEstud = ["Secundaria","Preparatoria", "Licenciatura", "Maestría"]
    var EdoCivil = ["Soltero","Casado", "Divorciado"]
    var textoTyC = "EmpresaB S.A de C.V no realizará la difusion de datos personales a sus empresas adyacentes ni a ninguna otra empresa externa sin el concentimiento del cliente. La empresa B se hace responsable del respaldo de informacion de todos sus clientes."
    
    var infor = Datos ()
    var delegate : EnvioDeDatosDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Vista Llenar Datos"
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
    self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        pickerNivelEstudios.delegate = self
        pickerNivelEstudios.dataSource = self
        pickerEdoCivil.delegate = self
        pickerEdoCivil.dataSource = self
        txtEdoCivil.delegate = self
        
        txtNiveldEstudio.inputView = pickerNivelEstudios
        txtEdoCivil.inputView = pickerEdoCivil
        
        showDatePicker()
        
        SwtchTerminosYCond.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
    }


    //Configuración switch
@objc func switchValueDidChange(_ sender : UISwitch!){
        
        if sender.isOn {
            swichIsOn =  true
            lblTerYCond.text = textoTyC
            
        } else {
            swichIsOn =  false
            lblTerYCond.text = ""
        }
        
    }
    
//Configuración DatePicker
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Aceptar", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txtFechadeNacimiento.inputAccessoryView = toolbar
        txtFechadeNacimiento.inputView = datePicker
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtFechadeNacimiento.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }


//Picker Nivel de Estudios
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == pickerNivelEstudios){
            return NivelEstud.count }
        else {
            return EdoCivil.count
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == pickerNivelEstudios){
            return NivelEstud[row]}
        else {
            return EdoCivil[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == pickerNivelEstudios){
         txtNiveldEstudio.text = NivelEstud[row]
            self.view.endEditing(true)
        }
        else {
        txtEdoCivil.text = EdoCivil[row]
            self.view.endEditing(true)
            
        }
        
    }
    
// Boton Guardar
    
    @IBAction func btnGuardar(_ sender: Any) {
        llenardatos()
        SaveUsserDefault()
        delegate?.datos(informacion: infor)
        self.navigationController?.popViewController(animated: true)
    }
    
    func llenardatos () {
        infor.Name = txtName.text!
        infor.ApellidoPaterno = txtApellidoPaterno.text!
        infor.ApellidoPaterno = txtApellidoMaterno.text!
        infor.FechaNacimiento = txtFechadeNacimiento.text!
        infor.NivelEstud = txtNiveldEstudio.text!
        infor.NumeroDeCel = txtNdeCel.text!
        infor.EdoCivil = txtEdoCivil.text!
        infor.AceptaTyC = swichIsOn
        
        if txtName.text == "" || txtApellidoPaterno.text == "" || txtApellidoMaterno.text == "" || txtFechadeNacimiento.text == "" || txtNiveldEstudio.text == "" || txtNdeCel.text == "" || txtEdoCivil.text == "" {
            let alert = UIAlertController(title: "Campos vacíos", message: "Todos los campos son obligatorios", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //Configuracion UsserDefault
    func SaveUsserDefault (){
        UserDefaults.standard.set(txtName.text, forKey: "Nombre")
        UserDefaults.standard.set(txtApellidoPaterno.text, forKey: "Paterno")
        UserDefaults.standard.set(txtApellidoMaterno.text, forKey: "Materno")
        UserDefaults.standard.set(txtFechadeNacimiento.text, forKey: "Fecha")
        UserDefaults.standard.set(txtNiveldEstudio.text, forKey: "Estudio")
        UserDefaults.standard.set(txtNdeCel.text, forKey: "Cel")
        UserDefaults.standard.set(txtEdoCivil.text, forKey: "Civil")
        UserDefaults.standard.set(SwtchTerminosYCond.isOn, forKey: "Si")
    }
    
    // Configuracion Scroll, TxtEdoCivil
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        MarginY.constant = 5
        MarginY2.constant = 5
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        MarginY.constant = 30
        MarginY2.constant = 25
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        MarginY.constant = 30
        MarginY2.constant = 25
        textField.resignFirstResponder()
        
        return true
    }
}
