//
//  SifreYenileViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 16.12.2022.
//

import UIKit

class SifreYenileViewController: UIViewController {

    @IBOutlet weak var eskiSifreTextField: UITextField!
    
    @IBOutlet weak var yeniSifreTextField: UITextField!
    
    @IBOutlet weak var sifreTekTextField: UITextField!
    
    @IBOutlet weak var sifreGosterButton: UIButton!
    
    @IBOutlet weak var onaylaButton: UIButton!
    
    @IBOutlet weak var sifreGImageView: UIImageView!
    
    var eskiSifreKayitCheck:Bool?
    var yeniSifreKayitCheck:Bool?
    var sifreTekKayitCheck:Bool?
    
    var hesapSahibiMailSifreYenVC:String?
    
    var sifreGorunuyorMu:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onaylaButton.layer.cornerRadius = onaylaButton.frame.height/2.5
        print(hesapSahibiMailSifreYenVC!)
        sifreGorunuyorMu = false
        
        eskiSifreTextField.delegate = self
        yeniSifreTextField.delegate = self
        sifreTekTextField.delegate = self
        
        eskiSifreTextField.isSecureTextEntry = true
        yeniSifreTextField.isSecureTextEntry = true
        sifreTekTextField.isSecureTextEntry = true
        
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        sifreGorunuyorMu = false
    }
    
    
    @IBAction func questionMarkButtonPressed(_ sender: Any) {
        
        bilgilendirme()
        
    }
    @IBAction func sifreGosterPressed(_ sender: Any) {
        
        if sifreGorunuyorMu!{ //şifre açık
            
            eskiSifreTextField.isSecureTextEntry = true
            yeniSifreTextField.isSecureTextEntry = true
            sifreTekTextField.isSecureTextEntry = true
            sifreGImageView.image = UIImage(systemName: "eye.slash")
            
            sifreGorunuyorMu = false
            
        }else{
            
            eskiSifreTextField.isSecureTextEntry = false
            yeniSifreTextField.isSecureTextEntry = false
            sifreTekTextField.isSecureTextEntry = false
            sifreGImageView.image = UIImage(systemName: "eye")
            
            sifreGorunuyorMu = true
        }
        
    }
    
    @IBAction func DegisiklikOnaylaPressed(_ sender: Any) {
    
        
        if let eSifre = eskiSifreTextField.text, let ysifre = yeniSifreTextField.text, let sifreTkr = sifreTekTextField.text, let mail = hesapSahibiMailSifreYenVC{

            print("bilgiler alındı")
            
            if eskiSifreKayitCheck == true && yeniSifreKayitCheck == true && sifreTekKayitCheck == true{
                
                print("1.aşama güvenlik sifre yenileme tamam")
                
                
                if eSifre == kullanicilarDAO().MobilKullaniciGetir(k_mail:mail).getK_Sifre(){
                    
                    if alınanSifreGuv(sifre: ysifre) == true{
                        
                        if ysifre == sifreTkr{
                            
                            let tempdegis = kullanicilarDAO().MobilKullanıcıSifreGunc(yeni_sifre: ysifre, k_mail: mail)
                            
                            if tempdegis == true{
                                
                                SifreDegBasarili()
                                
                                
                                eskiSifreTextField.text = ""
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
                    
                    MevcutSifreYanlıs()
                    
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


//MARK: -  alert fonksiyonları
extension SifreYenileViewController{
    
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
        
        let alertController = UIAlertController(title: "Şifre Yenileme", message: K.sifreGuv, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
}

extension SifreYenileViewController:UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == eskiSifreTextField{
            
            textField.placeholder = "Eski Sifre"
        }
        else if textField == yeniSifreTextField{
            
            textField.placeholder = " Yeni Sifre"
        }
        else if textField == sifreTekTextField{
            
            textField.placeholder = "Sifreyi Tekrarla"
        }
        
        return true
    }//TFShouldBeginEditing sonu
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField == eskiSifreTextField{
            
            if textField.text == ""{
                
                eskiSifreTextField.placeholder = "Eski Sifre"
            }

        }
        else if textField == yeniSifreTextField{
            
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
        
        
        if textField == eskiSifreTextField{
            
            if let mailSayi = textField.text?.count{
                
                if mailSayi > 0 && mailSayi < 15{
                    eskiSifreKayitCheck = true
                    print("Eski Sifre.asama :\(String(describing: eskiSifreKayitCheck))")
                    print("Sifre 0 haneden büyük 15 den küçük istenen aralıkta")
                    
                }
                else if mailSayi == 0{
                    eskiSifreKayitCheck = false
                    print("Eski Sifre 1.asama :\(String(describing: eskiSifreKayitCheck))")
                    eskiSifreTextField.text = ""
                    eskiSifreTextField.placeholder = "Eski Sifre"
                    
                    print("Eski Sifre boş bırakıldı")
                }
                else{
                    eskiSifreKayitCheck = false
                    print("Eski Sifre 1.asama :\(String(describing: eskiSifreKayitCheck))")
                    eskiSifreTextField.text = ""
                    eskiSifreTextField.placeholder = "Eski Sifre"
                    
                    print("eski sifre istenen aralıkta değil")
                }
                
            }
        }//EskiSifreTF check sonu
        else if textField == yeniSifreTextField{
            
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
