//
//  KullanimKosViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 1.12.2022.
//

import UIKit

class KullanimKosViewController: UIViewController {

    @IBOutlet weak var kullanimKosLabel: UILabel!
    
    @IBOutlet weak var kullanimKosTextview: UITextView!
    
    @IBOutlet weak var KKButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        KKButton.layer.cornerRadius = KKButton.frame.height/2.6
        
        
        kullanimKosTextview.text = "   Kullanıcı uygulamayı indiridikten sonra uygulamaya kayıt olmak için Bil3007 Proje ekibi tarafından sağlanan Kullanım Koşulları hakkında bilgilendirilme yükümlüğü vardır.\n\n   Kullanıcı hesap oluşturmak ve uygulamaya giriş yapabilmek  için Kullanım koşullarını kabul etmekle yükümlüdür.Uygulamanın kullanımı için gereken kullanıcı izinleri aşağıdaki gibidir.\n\nAcil Kan İhtiyacı Durumunda Kullanıcı Yükümlüğü\n\n   Acil Kan Yönetim Siteminin web tarafı yazılımı kullanan kuruluşlar tarfından oluşturulan acil kan ihtiyacı mobil uygulama kullanıcıların önüne gerçek zamanlı bildirim olarak düşer.Kullanıcı gelen bu bildirime yanıt vermek veya vermemek kendi şahsi yükümlüğündedir.Kullanıcı bildirime yanıt verip kan bağışında bulunmak isterse ilgili kuruma en hızlı şekilde navisgayon hizmetleri kullanılarak yönlendirilecektir.Kullanıcın ilgili bağışı yapmayı tercih ederse, ilgili kanı mümkün olduğunca bağışlaması gerekmektedir.Bu bağış yükümlülüğü acil kana ihtiyaç duyan hastanın can güvenliği açısından önem taşımakta olup tamamen kullanıcın vicdani sorumluluğudur.\n\nKullanıcının Konumunun Uygulama Tarafından Takibi\n\n   Acil Kan Yönetim Sistemi bir yazılım sisteminin genel adı olup web-mobil uygulama paylaşımlı bir sistemdir.Acil kan ihtiyacı durumunda hastaneler tarafından oluşturulan acil bildirim mobil uygulama kullanıcılarının telefonlarına gerçek zamanlı olarak bildirim şeklinde düşer.Bu hizmetin sağlanması için aktif konum bilgileri gerekmektedir.Ayrıca genel olarak bağışta bulunabilmek için navigasyon hizmeti almak içinde konum bilgileri gerekmektedir.\n\nBildirim İzinleri\n\n   Mobil Uygulama kullanıcısına gerçek zamanlı acil kan ihtiyacı bildirimlerinin gözükmesi veya uygulama içi genel bildirimlerin gözükmesi için kullanıcı bildirim iznini kabul etmelidir."
    }
    @IBAction func KKButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true,completion: nil)
    }
    
}
