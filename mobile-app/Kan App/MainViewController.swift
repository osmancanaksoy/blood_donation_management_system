//
//  MainViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var yasIconIV: UIImageView!
    @IBOutlet weak var boyIconIv: UIImageView!
    @IBOutlet weak var kiloIconIV: UIImageView!
    @IBOutlet weak var kanIconIV: UIImageView!
    @IBOutlet weak var menuIconIV: UIImageView!
    
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var ayarlarButton: UIButton!
    @IBOutlet weak var cikisButton: UIButton!
    
    @IBOutlet weak var kisiLabel: UILabel!
    
    @IBOutlet weak var yasLabel: UILabel!
    
    @IBOutlet weak var boyLabel: UILabel!
    
    @IBOutlet weak var kiloLabel: UILabel!
    
    @IBOutlet weak var kanLabel: UILabel!
    
    var fabDurum:Bool = false
    
    var hesapSahibiMailMainVC:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.navigationItem.hidesBackButton = true
        
        yasIconIV.layer.cornerRadius = yasIconIV.frame.height/5
        boyIconIv.layer.cornerRadius = boyIconIv.frame.height/5
        kiloIconIV.layer.cornerRadius = kiloIconIV.frame.height/5
        kanIconIV.layer.cornerRadius = kanIconIV.frame.height/5
        
        ayarlarButton.layer.cornerRadius = ayarlarButton.frame.height/5
        cikisButton.layer.cornerRadius = cikisButton.frame.height/5
        
        ayarlarButton.alpha = 0
        cikisButton.alpha = 0
        
        self.ayarlarButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.ayarlarButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        
        if let  mail = hesapSahibiMailMainVC {
            
            let gelendg = kullanicilarDAO().MobilKullaniciGetir(k_mail: mail).getK_dogumgunu()
            
            let sonhal  = 2022 - Int(gelendg[6...])!
            
            yasLabel.text = "\(sonhal)"
            
            kisiLabel.text = "\(kullanicilarDAO().MobilKullaniciGetir(k_mail: mail).getK_Ad()) \(kullanicilarDAO().MobilKullaniciGetir(k_mail: mail).getK_Soyad())"
           
            kanLabel.text = "\(kullanicilarDAO().MobilKullaniciGetir(k_mail: mail).getK_Kangrup())"
            kiloLabel.text = "\(kullanicilarDAO().MobilKullaniciGetir(k_mail: mail).getK_Kilo()) kg"
            boyLabel.text = "\(kullanicilarDAO().MobilKullaniciGetir(k_mail: mail).getK_Boy()) cm"
            
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == K.mToAyar{
            
            if let mail = sender as? String{
                
                print("mainVC :\(mail)")
                let ayarVC = segue.destination as! AyarlarViewController
                
                ayarVC.hesapSahibiMailAyarVC = mail
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.ayarlarButton.alpha = 0
        self.cikisButton.alpha = 0
        
        self.menuIconIV.transform = CGAffineTransform(rotationAngle: 0 * .pi/180)//menu'yü eski haline getir
        
        //butonları küçült
        self.ayarlarButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.cikisButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        self.fabDurum = false
        
    }
    override func viewWillDisappear(_ animated: Bool) {
       
        self.ayarlarButton.alpha = 0
        self.cikisButton.alpha = 0
        
        self.menuIconIV.transform = CGAffineTransform(rotationAngle: 0 * .pi/180)//menu'yü eski haline getir
        
        //butonları küçült
        self.ayarlarButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.cikisButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        self.fabDurum = false
    }
    @IBAction func menuButtonPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            if self.fabDurum{ // ayarlar ve cıkıs görünüyorsa
            
                self.ayarlarButton.alpha = 0
                self.cikisButton.alpha = 0
                
                self.menuIconIV.transform = CGAffineTransform(rotationAngle: 0 * .pi/180)//menu'yü eski haline getir
                
                //butonları küçült
                self.ayarlarButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.cikisButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                
                self.fabDurum = false
                
            }else{
                
                self.ayarlarButton.alpha = 1
                self.cikisButton.alpha = 1
                
                
                self.menuIconIV.transform = CGAffineTransform(rotationAngle: 90 * .pi/180)
                
                
                self.ayarlarButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.cikisButton.transform = CGAffineTransform(scaleX: 1, y: 1)

                
                self.fabDurum = true
            }
            
            
        },completion: nil)
    
    }
    
    @IBAction func ayarlarButtonPressed(_ sender: Any) {
        
        print("ayarlar basıldı")
        
        self.performSegue(withIdentifier:K.mToAyar, sender: hesapSahibiMailMainVC)
    }
    
    @IBAction func cikisButtonPressed(_ sender: Any) { //kullanıcı dışaır dokununca da çıkış yapıyor
        print("cikis basıldı")
        
        UserDefaults.standard.set(false, forKey: "IsUserLoggedIn")
        
        let alertController = UIAlertController(title: "Çıkış Yap ", message: "Çıkış yapmak istediğinizden emin misiniz?", preferredStyle: .actionSheet)
        
        let evetButton = UIAlertAction(title: "Evet", style: .cancel){
            
            action in
            
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        let hayırButton = UIAlertAction(title: "Hayır", style: .destructive){
            
            action in
            
            self.view.endEditing(true)
        }
        
        
        alertController.addAction(evetButton)
        alertController.addAction(hayırButton)
        
        self.present(alertController, animated: true)
        
    }
    

}
