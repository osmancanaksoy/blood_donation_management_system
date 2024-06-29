//
//  AyarlarViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 16.12.2022.
//

import UIKit

class AyarlarViewController: UIViewController {

    @IBOutlet weak var ayarlarTableView: UITableView!
    
    let ayarlarList:[String] = ["Arkadaşlarını Davet Et","Bildirimler","Gizlilik","Şifre Yenile","Yardım"]
    
    var hesapSahibiMailAyarVC:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        ayarlarTableView.delegate = self
        ayarlarTableView.dataSource = self
        ayarlarTableView.backgroundColor = UIColor(rgb: 0xFFE1E1)
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == K.aToSifYen{
            
            if let mail = hesapSahibiMailAyarVC{
                
                print("ayarlarVC: \(mail)")
                let sifreYenVC = segue.destination as! SifreYenileViewController
                
                sifreYenVC.hesapSahibiMailSifreYenVC = mail
                
            }
        }
    }
    


}


extension AyarlarViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ayarlarList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ayarlarCell",for: indexPath) as! TableViewCellAyarlar
        
        cell.ayarlarLabel.text = ayarlarList[indexPath.row]
        cell.backgroundColor = UIColor(rgb: 0xFFE1E1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       
        if Int(indexPath.row) == 3{
         
            print("geçilecek to \(ayarlarList[indexPath.row])")
            performSegue(withIdentifier: K.aToSifYen, sender: hesapSahibiMailAyarVC)
            
        }
        
        print("tıklanan index no \(indexPath.row)")
        
        
    }
}
