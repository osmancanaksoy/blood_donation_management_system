//
//  HaritaAcilViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 5.12.2022.
//

import UIKit
import MapKit
import FirebaseCore
import FirebaseFirestore

class HaritaAcilViewController: UIViewController {

    
    var bildirimIzinKontrol:Bool = false
    let firestoreDB = Firestore.firestore()
    
    
    @IBOutlet weak var acilKanTableView: UITableView!
    
    var acilKanListesi:[AcilKan] = [AcilKan] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options : [.alert,.sound,.badge]) {
            (granted, error) in
            
            
            self.bildirimIzinKontrol = granted
            
            if granted{
                print("bildirim izni verildi")
            }else{
                
                print("bildirim izni verilmedi")
            }
            
        }
        
        UNUserNotificationCenter.current().delegate = self
        
      
        
        acilKanTableView.delegate = self
        acilKanTableView.dataSource = self
     
        acilKanTableView.backgroundColor = UIColor(rgb: 0xFFE1E1)
         
//         acilKanRealtime()
    }
    
    

    override func viewWillAppear(_ animated: Bool) {

//        acilKanYukle()
        acilKanRealtime()

        print("------------------")
//        acilKanListesiYazdir()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.ha1Toha2{
            
            if let acilNokta = sender as? AcilKan{
                
             
                let gidilecekVC = segue.destination as! HaritaAcil2ViewController
                gidilecekVC.gelenAcilNokta = acilNokta
                
            }
        }
       
    }
  
    
    func acilKanListesiYazdir(){
        
        for i in acilKanListesi{
            
            print(i.getHastaneAd()!)
            print(i.getHastaneLati()!)
            print(i.getHastaneLongi()!)
            print(i.getKanGrup()!)
        }
    }
    
    func acilBildirimOlustur(hastaneAd:String,kanGrup:String){
        
        if bildirimIzinKontrol{
            
            let bildirimIcerik = UNMutableNotificationContent()
            
            bildirimIcerik.title = "Acil Kan ihtiyacı mevcut"
//            bildirimIcerik.subtitle = "alt baslik"
            bildirimIcerik.body = "\(hastaneAd)'nde  acil \(kanGrup) ihtiyacı vardır"
            bildirimIcerik.badge = 1
            bildirimIcerik.sound = .default
            
            let kabul = UNNotificationAction(identifier: "kabul", title: "Kabul Et",options:.foreground)
            let red = UNNotificationAction(identifier: "Reddet", title: "Reddet",options:.destructive)
            
            let kategori = UNNotificationCategory(identifier: "kategori", actions: [kabul,red], intentIdentifiers: [],options:[])
            
            UNUserNotificationCenter.current().setNotificationCategories([kategori])
            bildirimIcerik.categoryIdentifier = "kategori"
            
            let bildirimTetikle = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let bildirimIste =  UNNotificationRequest(identifier: "acil istek", content: bildirimIcerik, trigger: bildirimTetikle)
            
            UNUserNotificationCenter.current().add(bildirimIste)
            
        }
        
    }
    func acilKanRealtime(){//realtime olarak db her değişince bu fonk çalışır.

        print("acil realtime calısıyor")
        firestoreDB.collection("Acil").order(by: "timestamp").addSnapshotListener() {

            (QuerySnapshot,error) in
            
            self.acilKanListesi.removeAll()
            if let e = error{

                print("acil kan verisi getirme başarısız!.hata kodu :\(e)")
            }else{

                print("veri getirme başarılı")

                if let snapShotDoc = QuerySnapshot?.documents{

                    for doc in snapShotDoc{

                        let data = doc.data()
                        //firestoreDB.collection("Acil").addDocument(data: ["Hastane_ad":hAd,"latitude":lati,"longitude":longi,"kan":kan])
                        if let hastaneAd = data["Hastane_ad"] as? String, let hastaneLati = data["latitude"] as? String, let hastaneLongi = data["longitude"] as? String,let kanGrup = data["kan"] as? String{

                            let acilKan = AcilKan(hastaneAd: hastaneAd, hastaneLati: Double(hastaneLati)!, hastaneLongi: Double(hastaneLongi)!, kanGruo: kanGrup)

                            self.acilKanListesi.append(acilKan)

                            DispatchQueue.main.async {
                                
                                self.acilKanTableView.reloadData()
                                self.acilBildirimOlustur(hastaneAd: acilKan.getHastaneAd()!, kanGrup: acilKan.getKanGrup()!)
                            }
                            
                        }else{

                            print("nesne eşleştirme başarısız")
                        }
                    }
                    
                    
                }else{
                    print("doc getirme başarısız")
                }

            }
        }
        self.acilKanListesiYazdir()

    }

//    func acilKanYukle(){//birkez
//
//        print("acil kan yukle calısıyor")
//        firestoreDB.collection("Acil").getDocuments() {
//
//            (QuerySnapshot,error) in
//
//            self.acilKanListesi.removeAll()
//            if let e = error{
//
//                print("acil kan verisi getirme başarısız!.hata kodu :\(e)")
//            }else{
//
//                print("veri getirme başarılı")
//
//                if let snapShotDoc = QuerySnapshot?.documents{
//
//                    for doc in snapShotDoc{
//
//                        let data = doc.data()
//                        //firestoreDB.collection("Acil").addDocument(data: ["Hastane_ad":hAd,"latitude":lati,"longitude":longi,"kan":kan])
//                        if let hastaneAd = data["Hastane_ad"] as? String, let hastaneLati = data["latitude"] as? String, let hastaneLongi = data["longitude"] as? String,let kanGrup = data["kan"] as? String{
//
//                            let acilKan = AcilKan(hastaneAd: hastaneAd, hastaneLati: Double(hastaneLati)!, hastaneLongi: Double(hastaneLongi)!, kanGruo: kanGrup)
//
//
//                            self.acilKanListesi.append(acilKan)
//
//                            DispatchQueue.main.async {
//
//                                self.acilKanTableView.reloadData()
//                                self.acilKanListesiYazdir()
//                            }
//                        }else{
//
//                            print("nesne eşleştirme başarısız")
//                        }
//                    }
//                }else{
//                    print("doc getirme başarısız")
//                }
//
//            }
//        }
//
//    }

    
   
}


extension HaritaAcilViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return acilKanListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "acilCell",for:indexPath) as! TableViewCellAcil
        
        cell.acilLabel.text = "\(indexPath.row + 1)- \(String(describing: acilKanListesi[indexPath.row].getHastaneAd()!)): \(String(describing: acilKanListesi[indexPath.row].getKanGrup()!))"
        
        cell.backgroundColor = UIColor(rgb: 0xFFE1E1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(acilKanListesi[indexPath.row].getHastaneAd()) secildi")
        
        performSegue(withIdentifier: K.ha1Toha2, sender: acilKanListesi[indexPath.row])
    }
    
}


extension HaritaAcilViewController:UNUserNotificationCenterDelegate{
    
    //arkaplanda bildiirm çalışması
    func  userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.banner,.sound,.badge])
    }
    
    // butonlara tıklanınca ne olacak metodu
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        
        if response.actionIdentifier == "kabul"{
            
            let alertController = UIAlertController(title: "UYARI", message: "Acil Kan İhtiyacı için bağış yapma seçeneğine tıkladınız.Kan bağışı, kana ihtiyaç duyan hasta açısından can güvenliği arz etmektedir.Bağış Yap butonuna tıklarsanız ilgili hastaneye gitmeniz önemle rica olunur.", preferredStyle: .alert)
            
            let yönlendir = UIAlertAction(title: "Yönlendir", style: .cancel){
                action in
            }
            
            let iptalEt = UIAlertAction(title: "İptal Et", style: .destructive){
                
                action in
                
                self.view.endEditing(true)
            }
            
            alertController.addAction(yönlendir)
            alertController.addAction(iptalEt)
            
            self.present(alertController, animated: true)
        }
        
        if response.actionIdentifier == "red"{
            
            print("hayır tıklanıd")
            
            view.endEditing(true)
        }
        
        completionHandler()
            
    }
}
