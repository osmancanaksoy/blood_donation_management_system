//
//  YasalViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class YasalViewController: UIViewController {

   
    @IBOutlet weak var okudumAnladimButton: UIButton!
    
    
    @IBOutlet weak var yasalProgressView: UIProgressView!
    
    @IBOutlet weak var yasalUyarıTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        okudumAnladimButton.layer.cornerRadius = okudumAnladimButton.frame.height/2.6
       
        yasalUyarıTextView.isEditable = false // textView düzenlemesi yasaklandı.
        
        yasalProgressView.progress = 0
        
        UIView.animate(withDuration: 2, animations: {
            
            self.yasalProgressView.setProgress(0.3, animated: true)
        })
        
        
        yasalUyarıTextView.text = "YASAL UYARILAR \n\n\n   Bu Aydınlatma Metni, 6698 sayılı Kişisel Verilerin Korunması Kanunu’nun (“KVK Kanunu”) “Veri Sorumlusunun Aydınlatma Yükümlülüğü” kenar başlıklı 10 uncu maddesi uyarınca ve KVK Kanunu kapsamında veri sorumlusu olan BİL3007 Proje Ekibi tarafından, Acil Kan Yönetim Sistemi kullanıcılarına, kullanıcılara ait kişisel veriler hususunda bilgilendirme yapmak amacıyla hazırlanmıştır. KVK Kanunu uyarınca veri sorumlusu sıfatını geliştiricinin KTU yerleşkesidir.Veri Sorumlusunun Kimliği uygulamada işlenen kişisel verileriniz bakımından veri sorumlusu BİL3007 proje ekibidir. \n\nKişisel Verilerin İşlenme Amaçları\n\n   Bu uygulamada aşağıda yer alan kişisel verileriniz şu amaçlarla işlenmektedir:\n\n - Kimlik verisi: Kimlik bilgileriniz kimliğinizin doğrulanması, sağlık hizmeti süreçlerinin yürütülmesi/denetimi/analizi/izlemi amacıyla işlenmektedir.\n\n - İletişim verisi: İletişim bilgileriniz acil durum yönetimi süreçlerinin yürütülmesi, sağlık hizmetlerine yönelik iletişim faaliyetlerinin yürütülmesi, tıbbi teşhis, tedavi ve bakım hizmetlerinin yürütülmesi, sağlık hizmeti süreçlerinin yürütülmesi/denetimi/analizi/izlemi amacıyla işlenmektedir.\n\n- Ceza mahkumiyeti ve güvenlik tedbirleri verisi: Cezaevi öyküsü bilginiz var ise bu bilgiler tıbbi teşhis, tedavi ve bakım hizmetlerinin yürütülmesi, sağlık hizmetlerinin planlanması/yönetilmesi, sağlık hizmeti süreçlerinin yürütülmesi/denetimi/analizi/raporlanması/izlemi amacıyla işlenmektedir.\n\n- İşlem güvenliği verisi: İşlem güvenliği bilgileriniz bilgi güvenliği süreçlerinin yürütülmesi, erişim yetkilerinin yürütülmesi amacıyla işlenmektedir.\n\n- Özlük verisi: Özlük bilgileriniz acil durum yönetimi süreçlerinin yürütülmesi, tıbbi teşhis, tedavi ve bakım hizmetlerinin yürütülmesi, sağlık hizmeti süreçlerinin yürütülmesi/denetimi/analizi/raporlanması/izlemi amacıyla işlenmektedir.\n\n- Finans verisi: Finans bilgileriniz faaliyetlerin mevzuata uygun yürütülmesi, kamu finansman verimliliğinin artırılması, iş faaliyetlerinin yürütülmesi/denetimi, sağlık hizmeti süreçlerinin yürütülmesi, finans ve muhasebe işlerinin yürütülmesi amacıyla işlenmektedir.\n\n- Lokasyon verisi: Konum bilgileriniz acil durum yönetimi süreçlerinin yürütülmesi, tıbbi teşhis, tedavi ve bakım hizmetlerinin yürütülmesi, iletişim faaliyetlerinin yürütülmesi, sağlık hizmeti süreçlerinin yürütülmesi amacıyla işlenmektedir.\n\n- Sağlık verisi: Sağlık bilgileriniz iş sürekliliğinin sağlanması faaliyetlerinin yürütülmesi/ denetimi/analizi/raporlanması/izlemi, tıbbi teşhis, tedavi ve bakım hizmetlerinin yürütülmesi, kamu finansman verimliliğinin artırılması, sağlık hizmetlerinin yürütülmesi/planlanması/yönetilmesi, sağlık hizmetine yönelik bildirim süreçlerinin (SMS, Push Notification, e-Posta vb.) yürütülmesi amacıyla işlenmektedir.\n\n- Görsel ve işitsel veri: Sağlık probleminiz ile ilgili fotoğrafınız ve profil içerisinde eklenen fotoğrafınız iş sürekliliğinin sağlanması faaliyetlerinin yürütülmesi, tıbbi teşhis, tedavi ve bakım hizmetlerinin yürütülmesi, sağlık hizmeti süreçlerinin yürütülmesi amacıyla işlenmektedir.\n\nKişisel Verilerin Aktarımı\n\n   Sağlık hizmeti sunan özel sağlık kuruluşlarından hizmet almanız halinde, Acil Kan Yönetim Sistemi uygulamasındaki kişisel verileriniz KVK Kanunu’nun 6 ncı maddesinin üçüncü fıkrası kapsamında mevcut güvenlik tercihleriniz doğrultusunda ....... kurumu ile paylaşılacaktır.\n\nKişisel Veri Toplamanın Yöntemi ve Hukuki Sebebi\n\n   Kişisel verileriniz Acil Kan Yönetim Sistemi aracılığı ile otomatik yollarla veya boy, kilo gibi bilgilerin manuel olarak sizin tarafınızdan profilinize eklenmesi suretiyle elde edilmektedir. Kişisel verileriniz, KVK Kanunu’nun 5 inci maddesinin ikinci fıkrasının (a) bendindeki “Kanunlarda açıkça öngörülmesi”, (ç) bendindeki “Veri sorumlusunun hukuki yükümlülüğünü yerine getirebilmesi için zorunlu olması” hukuki sebepleri ile 6 ncı maddesinin üçüncü fıkrası uyarınca; kamu sağlığının korunması, koruyucu hekimlik, tıbbî teşhis; tedavi ve bakım hizmetlerinin yürütülmesi, sağlık hizmetleri ile finansmanının planlanması ve yönetimi amacıyla, sır saklama yükümlülüğü altında bulunan veya yetkili kişiler veya yetkili kurum/kuruluşlar tarafından işlenmektedir.\n\nİlgili Kişilerin Hakları ve Veri Sorumlusuna Başvuru\n\n   Acil Kan Yönetim Sistemi Uygulama kullanıcıları KVK Kanunu’nun 11 inci maddesinde düzenlenen haklarını, KVK Kanunu’nun 13 üncü maddesi ve Veri Sorumlusuna Başvuru Usul ve Esasları Hakkında Tebliğ hükümleri çerçevesinde Bakanlığa başvurmak suretiyle kullanabilir. KVK Kanunu’nun 13 üncü maddesi uyarınca yapılacak yazılı başvurular ....... adresine; Kayıtlı Elektronik Posta (KEP) ile yapılacak başvurular ise ...... adresine iletilmelidir."
    }
    
    @IBAction func okudumAnladimButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.yToKisi, sender: nil)
    }
    

}
