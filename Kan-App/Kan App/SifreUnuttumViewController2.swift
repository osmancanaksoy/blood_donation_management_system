//
//  SifreUnuttumViewController2.swift
//  Kan App
//
//  Created by Hüdahan Altun on 19.12.2022.
//

import UIKit

class SifreUnuttumViewController2: UIViewController {

    
    @IBOutlet weak var yeniSifreTextField: UITextField!
    
    
    @IBOutlet weak var sifreTekTextField: UITextField!
    
    
    @IBOutlet weak var sifreGButton: UIButton!
    
    
    @IBOutlet weak var sifreGImageView: UIImageView!
    
    @IBOutlet weak var onaylaButton: UIButton!
    
    @IBOutlet weak var questionMarkButton: UIBarButtonItem!
    var gelenMail:String?
    var yeniSifreKayitCheck:Bool?
    var sifreTekKayitCheck:Bool?
    
    var sifreGorunuyorMu:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        onaylaButton.layer.cornerRadius = onaylaButton.frame.height/2.5
        sifreGImageView.image = UIImage(systemName: "eye.slash")
        print(gelenMail!)
        sifreGorunuyorMu = false
        
        
        yeniSifreTextField.delegate = self
        sifreTekTextField.delegate = self
        
        yeniSifreTextField.isSecureTextEntry = true
        sifreTekTextField.isSecureTextEntry = true
        
        yeniSifreTextField.autocorrectionType = .no
        yeniSifreTextField.autocapitalizationType = .none
        yeniSifreTextField.keyboardType = .default
        sifreTekTextField.autocorrectionType = .no
        sifreTekTextField.autocapitalizationType = .none
        sifreTekTextField.keyboardType = .default
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        sifreGorunuyorMu = false
    }

    
    @IBAction func questionMarkButtonPressed(_ sender: Any) {
        
        bilgilendirme()
    }
    
    @IBAction func sifreGButtonPressed(_ sender: Any) {
        
        if sifreGorunuyorMu!{ //şifre açık
            
            
            yeniSifreTextField.isSecureTextEntry = true
            sifreTekTextField.isSecureTextEntry = true
            sifreGImageView.image = UIImage(systemName: "eye.slash")
            
            sifreGorunuyorMu = false
            
        }else{
            
            
            yeniSifreTextField.isSecureTextEntry = false
            sifreTekTextField.isSecureTextEntry = false
            sifreGImageView.image = UIImage(systemName: "eye")
            
            sifreGorunuyorMu = true
        }

    }
    
    
   
    @IBAction func onaylaButtonPressed(_ sender: Any) {
        
        if let ysifre = yeniSifreTextField.text, let sifreTkr = sifreTekTextField.text, let mail = gelenMail{

            print("bilgiler alındı")
            
            if yeniSifreKayitCheck == true && sifreTekKayitCheck == true{
                
                print("1.aşama güvenlik sifre yenileme tamam")
                
                
                if mail == kullanicilarDAO().MobilKullaniciGetir(k_mail:mail).getK_Mail(){
                    
                    if alınanSifreGuv(sifre: ysifre) == true{
                        
                        if ysifre == sifreTkr{
                            
                            let tempdegis = kullanicilarDAO().MobilKullanıcıSifreGunc(yeni_sifre: ysifre, k_mail: mail)
                            
                            if tempdegis == true{
                                
                                SifreDegBasarili()
                                
                                
                                
                                yeniSifreTextField.text = ""
                                sifreTekTextField.text = ""
                            }
                        }
                        else{
                            
                            SifreEslesmiyor()
                        }
                    }else{
                        
                        sifreGuvensiz()
                        
                    }
                }else{
                    
                   //
                    
                }
            }else{
                
                bosAlanHatası()
                
            }
        }else{
            
            bosAlanHatası()
//
            
        }
    }
    
  
}

//MARK: - alert ve hesap güvenliği fonksiyonları
extension SifreUnuttumViewController2{
    
    func alınanSifreGuv(sifre:String)->Bool{
        
        //regular expression temelli sifre kontrolü( özel karakter,8 karakter,bir büyük harf ve bir sayı)
        let password = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[.,$@$#!%*?&])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        
        return password.evaluate(with: sifre)
        
    }
    
    func bosAlanHatası(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.bosAlanHata, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    func MevcutSifreYanlıs(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.mevcutSifreYanlis, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    func SifreEslesmiyor(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.sifreEslesmiyor, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    func sifreGuvensiz(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.sifreGuv, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    func SifreDegBasarili(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.sifreDeBasarili, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    func bilgilendirme(){
        
        let alertController = UIAlertController(title: "Sifre Unuttum", message: K.bilgilendirme2, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
        
    }
}

//MARK: - textfield protocol fonksiyonları
extension SifreUnuttumViewController2:UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == yeniSifreTextField{
            
            textField.placeholder = " Yeni Sifre"
        }
        else if textField == sifreTekTextField{
            
            textField.placeholder = "Sifreyi Tekrarla"
        }
        
        return true
    }//TFShouldBeginEditing sonu
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
       if textField == yeniSifreTextField{
            
            if textField.text == ""{
                
                yeniSifreTextField.placeholder = "Yeni Sifre"
            }
        }
        else if textField == sifreTekTextField{
            
            if textField.text == ""{
                
                sifreTekTextField.placeholder = "Sifreyi Tekrarla"
            }
        }
        
        return true
        
    }//TFShouldEndEditing sonu
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == yeniSifreTextField{
            
            if let sifreSayi = textField.text?.count{
                
                if sifreSayi > 0 && sifreSayi < 15{
                    
                    yeniSifreKayitCheck = true
                    print("yeni sifre1.asama :\(String(describing: yeniSifreKayitCheck))")
                    print("yeni sifre 0-15 aralıgında")
                }
                else if sifreSayi == 0{
                    yeniSifreKayitCheck = false
                    print("yeni sifre1.asama :\(String(describing: yeniSifreKayitCheck))")
                    yeniSifreTextField.text = ""
                    yeniSifreTextField.placeholder = "Yeni Sifre"
                    print("yeni sifre bos")
                }
                else{
                    
                    yeniSifreKayitCheck = false
                    print("sifre1.asama :\(String(describing: yeniSifreKayitCheck))")
                    yeniSifreTextField.text = ""
                    yeniSifreTextField.placeholder = "Yeni Sifre"
                    print("yeni sifre istenen aralıkta değil")
                }
            }
            
        }//sifreTF check sonu
        else if textField == sifreTekTextField{
            
            if let sifreTekSayi = textField.text?.count{
                
                if sifreTekSayi > 0 && sifreTekSayi < 15{
                    
                    sifreTekKayitCheck = true
                    print("sifretek1.asama :\(String(describing: sifreTekKayitCheck))")
                    print("sifre  tekrar 0-15 aralıgında")
                }
                else if sifreTekSayi == 0{
                    sifreTekKayitCheck = false
                    print("sifretek1.asama :\(String(describing: sifreTekKayitCheck))")
                    sifreTekTextField.text = ""
                    sifreTekTextField.placeholder = "Sifre"
                    print("sifre terar bos")
                }
                else{
                    
                    sifreTekKayitCheck = false
                    print("sifretek1.asama :\(String(describing: sifreTekKayitCheck))")
                    sifreTekTextField.text = ""
                    sifreTekTextField.placeholder = "Sifre"
                    print("sifre tekrar istenen aralıkta değil")
                }
                
            }
        }//sifreTF checksonu
        
        
        
        
    }//TFDidEndEditing sonu
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
    }//TFShouldReturn Sonu
    
}
