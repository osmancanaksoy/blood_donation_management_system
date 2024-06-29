//
//  SSSViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class SSSViewController: UIViewController {

    @IBOutlet weak var SSSLabel: UILabel!
    
    
    @IBOutlet weak var SSSTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SSSTextView.isEditable = false
        SSSTextView.text = "Kimler Kan Bağışında Bulunabilir?\n\n   18-65 yaş aralığında 50 kilogramın üzerindeki her sağlıklı birey kan bağışçısı adayı olabilir. (19 yaşından gün almak, 65’ini doldurmamak gerekir.)İlk kez kan bağışında bulunacaklar için üst yaş sınırı: 61 yaşından gün almamış olmalı. Düzenli kan bağışçıları için üst yaş sınırı 65 yaşını doldurduktan, 70 yaşından gün alana kadar kan bağış merkezi doktorunun onayı olmak şartıyla yılda en fazla 1 kez olmak üzere kan bağışlayabilir.\n\nKan Bağışı Nerelerde Yapılır?\n\n  Kullanıcılarımız uygulamaya kayıt olurken ilgili konumlarına göre o konum çevresinde bulunan bağış noktaları kullanıcılara gösterilecektir.\n\nKan Bağışı Ne Kadar Sürer?\n\n   Kayıt, muayene, kan bağışı ve ikram işlemleri yaklaşık 30-35 dk. sürmektedir.\n\nKan Bağışı Sağlıklı mıdır?\n\n   Kan bağışlamanın sağlığa herhangi bir yararı olduğuna dair bilimsel bir çalışma yoktur. Kan bağışının bağışçıya en önemli faydası hiç tanımadığı üç kişinin hayatını kurtarmaktır.\n\n Ne Kadar Aralıklarala Birey Kan Bağışında bulunabilir?\n\n   Tam kan bağışında;Erkekler 90 günde bir ,Kadınlar 120 gün de bir Aferez ve tam kan bağışı aralıkları hakkında detaylı bilgi için Ulusal Kan ve Kan Bileşenleri Hazırlama, Kullanım ve Kalite Güvencesi Rehberi 2016 (bkz. 73-74)\n\nUygulamaya Kayıt Olurken ve Kan Bağışı Yaparken Kimlik Bildirmem Zorunlumu?\n\n  Bağışçılar her kan bağışı işlemi öncesinde isim, soy isim, doğum tarihi (gün/ay/yıl), TC kimlik numarasını içeren nüfus cüzdanı, ehliyet veya pasaport ve kalıcı adres bilgilerini vererek kendilerini tanıtmalıdır. Kimlik ibrazı Sağlık Bakanlığı’nın hazırlanmış olduğu Ulusal Kan ve Kan Bileşeni Hazırlama, Kullanım ve Kalite Güvencesi Rehberi 2016'ya göre zorunludur.\n\nKişisel Verilerim Nasıl İşlenecek?\n\n Verilerin İşlenmesi bilgisi mobil uygulamaya kayıt olurken ilk  ve son kayıt sayfasında  belirtilmektedir. "
    }
    


}
