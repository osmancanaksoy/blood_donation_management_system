//
//  ViewControllerTest.swift
//  Kan App
//
//  Created by Hüdahan Altun on 20.12.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseCore
class ViewControllerTest: UIViewController {

    
    
    let firestoreDB = Firestore.firestore()
    @IBOutlet weak var hastaneAdTF: UITextField!
    
    
    @IBOutlet weak var latitudeTF: UITextField!
    
    
    @IBOutlet weak var longitudeTF: UITextField!
    
    
    @IBOutlet weak var kanGrupTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //40.9916093,39.7663337

    @IBAction func acilEkle(_ sender: Any) {
        
        if let hAd = hastaneAdTF.text, let lati = latitudeTF.text , let longi = longitudeTF.text , let kan = kanGrupTF.text{
            
            
            firestoreDB.collection("Acil").addDocument(data: ["Hastane_ad":hAd,"latitude":lati,"longitude":longi,"kan":kan]){
                
                error in
                
                if let e = error{
                    
                    print("acil kan kaydi başaısız .hata kodu :\(e)")
                }else{
                    
                    print("acil kan kaydı başarılı")
                }
            }
        }
    }
    

}
