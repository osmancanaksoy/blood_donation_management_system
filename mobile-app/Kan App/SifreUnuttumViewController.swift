//
//  SifreUnuttumViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 16.12.2022.
//

import UIKit

class SifreUnuttumViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var tcTextField: UITextField!
    

    @IBOutlet weak var ileriButton: UIButton!
    
    @IBOutlet weak var questionMarkButton: UIBarButtonItem!
    
    var emailKayitCheck:Bool?
    var tcKayitCheck:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ileriButton.layer.cornerRadius = ileriButton.frame.height/2.5
        emailTextField.delegate = self
        tcTextField.delegate = self
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .default
        tcTextField.autocorrectionType = .no
        tcTextField.autocapitalizationType = .none
        tcTextField.keyboardType = .numberPad
        
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == K.sifreUnuttum1To2{
            
            if let mail = sender as? String{
                
                let gidilecekVC = segue.destination as? SifreUnuttumViewController2
                gidilecekVC?.gelenMail = mail
            }
        }
    }
    
    
    @IBAction func questionmarkButtonPressed(_ sender: Any) {
        
        bilgilendirme()
    }
    
    @IBAction func ileriButtonPressed(_ sender: Any) {
        
        
        if let mail = emailTextField.text, let tc = tcTextField.text{
            
            print("bilgiler alındı")
            
            if emailKayitCheck == true && tcKayitCheck == true{
                
                if let gMail = kullanicilarDAO().MobilKullaniciGetir(k_mail: mail).getK_Mail(){
                    
                    if mail == gMail{
                        
                        let gelenTC = kullanicilarDAO().MobilKullaniciGetir(k_mail: gMail).getK_TC()
                        
                        if tc == gelenTC{
                            
                            
                            self.performSegue(withIdentifier: K.sifreUnuttum1To2, sender: mail)
                            
                            emailTextField.text = ""
                            tcTextField.text = ""
                        }else{
                            
                            TCEslesmiyor()
                        }
                        
                    }
                }else{
                    
                    mailYanlis()
                }
            }else{
                 
                bosAlanHatası()
                
            }
        }else{
            
            bosAlanHatası()
        }
                
               
        
        
    }
    
    
}

//MARK: - alert fonksiyonları
extension SifreUnuttumViewController{
    
    
    func bosAlanHatası(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.bosAlanHata, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    
    func mailYanlis(){
        
        let alertController = UIAlertController(title: "Sifre Unuttum", message: K.mailYanlis, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    func TCEslesmiyor(){
        
        let alertController = UIAlertController(title: "Sifre Unuttum", message: K.tcEslesmiyor, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    func bilgilendirme(){
        
        let alertController = UIAlertController(title: "Sifre Unuttum", message: K.bilgilendirme1, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
        
    }
    
}

//MARK: - textfield protocol fonksiyonları

extension SifreUnuttumViewController:UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField{
            
            textField.placeholder = "Email"
        }
        else if textField == tcTextField{
            
            textField.placeholder = " TC no"
        }
     
        return true
    }//TFShouldBeginEditing sonu
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField{
            
            if textField.text == ""{
                
                emailTextField.placeholder = "Email"
            }

        }
        else if textField == tcTextField{
            
            if textField.text == ""{
                
                tcTextField.placeholder = "11 haneli TC kimlik numarası"
            }
        }
        
        
        return true
        
    }//TFShouldEndEditing sonu
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == emailTextField{
            
            if let mailSayi = textField.text?.count{
                
                if mailSayi > 0 && mailSayi < 30{
                    emailKayitCheck = true
                    print("Mail 1.asama :\(String(describing: emailKayitCheck))")
                    print("mail 0 haneden büyük 15 den küçük istenen aralıkta")
                    
                }
                else if mailSayi == 0{
                    emailKayitCheck = false
                    print("mail 1.asama :\(String(describing: emailKayitCheck))")
                    emailTextField.text = ""
                    emailTextField.placeholder = "Email"
                    
                    print("Eski Sifre boş bırakıldı")
                }
                else{
                    emailKayitCheck = false
                    print("Mail 1.asama :\(String(describing: emailKayitCheck))")
                    emailTextField.text = ""
                    emailTextField.placeholder = "Email"
                    
                    print("mail istenen aralıkta değil")
                }
                
            }
        }//EskiSifreTF check sonu
        else if textField == tcTextField{
            
            if let tcSayi = textField.text?.count{
                
                if tcSayi > 0 && tcSayi < 12{
                    
                    tcKayitCheck = true
                    print("TC 1.asama :\(String(describing: tcKayitCheck))")
                    print("TC 0-12 aralıgında")
                }
                else if tcSayi == 0{
                    tcKayitCheck = false
                    print("TC 1.asama :\(String(describing: tcTextField))")
                    tcTextField.text = ""
                    tcTextField.placeholder = "TC no"
                    print("TC bos")
                }
                else{
                    
                    tcKayitCheck = false
                    print("sifre1.asama :\(String(describing: tcKayitCheck))")
                    tcTextField.text = ""
                    tcTextField.placeholder = "TC no"
                    print("TC istenen aralıkta değil")
                }
            }
            
        }//sifreTF check sonu
  
        
        
        
        
    }//TFDidEndEditing sonu
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
    }//TFShouldReturn Sonu
    
}

