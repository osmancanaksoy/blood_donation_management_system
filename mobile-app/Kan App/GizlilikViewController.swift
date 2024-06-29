//
//  GizlilikViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 1.12.2022.
//

import UIKit

class GizlilikViewController: UIViewController {

    @IBOutlet weak var gizlilikLabel: UILabel!
    
    @IBOutlet weak var gizlilikTextView: UITextView!
    
    @IBOutlet weak var gizlilikButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gizlilikButton.layer.cornerRadius = gizlilikButton.frame.height/2.6
        // Do any additional setup after loading the view.
        
        gizlilikTextView.text = " \n\n\n   Bu Aydınlatma Metni, 6698 sayılı Kişisel Verilerin Korunması Kanunu’nun (“KVK Kanunu”) “Veri Sorumlusunun Aydınlatma Yükümlülüğü” kenar başlıklı 10 uncu maddesi uyarınca ve KVK Kanunu kapsamında veri sorumlusu olan BİL3007 Proje Ekibi tarafından, Acil Kan Yönetim Sistemi kullanıcılarına, kullanıcılara ait kişisel veriler hususunda bilgilendirme yapmak amacıyla hazırlanmıştır. KVK Kanunu uyarınca veri sorumlusu sıfatını geliştiricinin KTU yerleşkesidir.Veri Sorumlusunun Kimliği uygulamada işlenen kişisel verileriniz bakımından veri sorumlusu BİL3007 proje ekibidir.Uygulama Kullanıcıları hesap oluşturuken  girmiş olduğu kişisel bilgiler ve hesaplarına giriş yaparken kullanacağı email ve sifreleri BİL3007 Proje geliştirici ekibi tarafından itinayla güvenli şekilde korunacağını sayın kullanıcılarına bildirir.\n\n   Konum bilgileriniz ve Kişisel verileriniz,uzaktaki sunucularımızda günümüzün gerektirdiği en yeni güvenlik protokolleri ile korunacağı Bil3007 Proje ekibi tarafından taahhüt edilir.Bu verilerin 3.kişi ve kurumlarca paylaşımı yapılmayacak olup sadece Acil Kan Yönetim Sistemi paydaşları tarafından işlenecektir.  "
    }
    @IBAction func gizlilikButtonPressed(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
}
