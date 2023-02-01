//
//  HaritaAcil2ViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 20.12.2022.
//

import UIKit
import MapKit

class HaritaAcil2ViewController: UIViewController {

    var locationManagerAcil = CLLocationManager()//lokasyon verileri almak için kullanacağımız nesne
    
    @IBOutlet weak var haritaAcilMapView: MKMapView!
    
    var annotationTitle:String?//pin başlık
    var annotationSubTitle:String?//pin alt başlık kan grup
    var annotationLat:Double?//pin lati
    var annotationLong:Double?//pin longi
    
    var gelenAcilNokta:AcilKan = AcilKan()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = gelenAcilNokta.getHastaneAd()
        haritaAcilMapView.delegate = self
        locationManagerAcil.delegate = self
        
        haritaAcilMapView.isZoomEnabled = false
        haritaAcilMapView.isScrollEnabled = false
        locationManagerAcil.desiredAccuracy = kCLLocationAccuracyBest //en iyi konumu al
        locationManagerAcil.requestWhenInUseAuthorization() // konumu alırken kullanıcıdan izin iste
        
        locationManagerAcil.startUpdatingLocation() // vc yüklenince konum almayı başlat
        
        pinYarat(acilNokta: gelenAcilNokta)
        
        
    }
    

   

}

//MARK: - Firebase realtime fonksiyonları


extension HaritaAcil2ViewController{
    
    func pinYarat(acilNokta:AcilKan){
        
        annotationTitle = acilNokta.getHastaneAd()
        annotationSubTitle = acilNokta.getKanGrup()
        annotationLat = acilNokta.getHastaneLati()
        annotationLong = acilNokta.getHastaneLongi()
        
        
        let annotation = MKPointAnnotation() //pin yaratıldı
        
        
        annotation.title = annotationTitle//pin in titlenına kullan seçtiği yer ismi atandı
        
        annotation.subtitle = annotationSubTitle//not atandı
        
        //create coordianae a pass param from coredata to class
        
        //coredatadan gelen yer koordinatları ile coordinate değişkeni oluşturuldu
        
        let coordinate = CLLocationCoordinate2D(latitude: annotationLat!, longitude: annotationLong!)
        
        
        annotation.coordinate = coordinate // pinin koordinatına coredatadan gelen coordinat verileri atandı
        
        haritaAcilMapView.addAnnotation(annotation)// pin map e eklendi
        
        
        locationManagerAcil.stopUpdatingLocation()
        
        
        // kullanıcının ekledği yeri görmesi için span ve region oluşturduk
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02) // create span
        
        let region = MKCoordinateRegion(center: coordinate, span: span) // create region
        
        haritaAcilMapView.setRegion(region, animated: true) //region u map e atadık
    }
    
 
    
}

extension HaritaAcil2ViewController{
    
    func yolTarifiBilgilendirme(){
        
        let alertController = UIAlertController(title: "Yol Tarifi", message: K.yolTarifi, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    func yolTarifiAl(){
        
        let requestLoc = CLLocation(latitude: annotationLat!, longitude: annotationLong!)

        CLGeocoder().reverseGeocodeLocation(requestLoc) {



            (placemarkArray, error) in//dizi ve hata değişkenleri

            if let placemarkA = placemarkArray{

                //placemark dizisi mevcutsa yeni içinde nesneler varsa
                if placemarkA.count > 0{

                    //bu nesne dizisinden bir tanesini alacağız
                    let onePlacemark = MKPlacemark(placemark: placemarkA[0])//placemark dizisinden ilk elemanı aldık

                    let item = MKMapItem(placemark: onePlacemark)

                    //item ın ismine kullanıcının eklediği yer ismini ekledik
                    item.name = self.annotationTitle

                    //haritayı araba ile gidilecek şekilde nav özelliği ile başlatma ayarlanır.
                    let launchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]

                    item.openInMaps(launchOptions: launchOptions)//haritalarda aç yaparız.

                }
            }
        }
        
    }

}


extension HaritaAcil2ViewController:MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? { //map view üzerinde özel pin oluşturmaya yarayan fonksiyon.
        
        if annotation is MKUserLocation{ // eğer gösterilen pin kullanıcının o anki konumu ise

            return nil//hiçbirşley yapma
        }
        
        
        let reuseAnnIDAcil = "myAnnotation2"//özel pin id ismi
        
        //pinimizi mapview e tanıtıyoruz
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseAnnIDAcil)
        
        if pinView == nil{ //eklenen pin dolu ise
            
            
            //pini map e ekliyoruz
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseAnnIDAcil)
            
            pinView?.canShowCallout = true //pin e özel butonlar eklemek istioyrsak true yapılır
            
            pinView?.tintColor = .red // pin buton rengi
            
            let button = UIButton(type: .detailDisclosure) //pine özel buton oluşturduk
            
            pinView?.rightCalloutAccessoryView = button //pine butonu aktardık
            
        }else{
            
            pinView?.annotation = annotation //pin normal
        }
        
        return pinView //pin return edilir
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {// kullanıcı özle pindeki information butonua tıklarsa yol tarifi alacak
        
        //pinin konum verilerini alyıpruz
        
        
        
        let alertController = UIAlertController(title: "UYARI", message: "Acil Kan İhtiyacı için harita üzerindeki butona tıkladınız.Kan bağışı, kana ihtiyaç duyan hasta açısından can güvenliği arz etmektedir.Bağış Yap butonuna tıklarsanız ilgili hastaneye gitmeniz önemle rica olunur.", preferredStyle: .alert)
        
        let yönlendirButton = UIAlertAction(title: "Yönlendir", style: .cancel){
            
            action in
            
            self.yolTarifiAl()
        }
        
        let iptalButton = UIAlertAction(title: "İptal Et", style: .destructive){
            
            action in
            
            self.view.endEditing(true)
        }
        
        
        alertController.addAction(iptalButton)
        alertController.addAction(yönlendirButton)
        
        
        self.present(alertController, animated: true)
        
//        let requestLoc = CLLocation(latitude: annotationLat!, longitude: annotationLong!)
//
//        CLGeocoder().reverseGeocodeLocation(requestLoc) {
//
//
//
//            (placemarkArray, error) in//dizi ve hata değişkenleri
//
//            if let placemarkA = placemarkArray{
//
//                //placemark dizisi mevcutsa yeni içinde nesneler varsa
//                if placemarkA.count > 0{
//
//                    //bu nesne dizisinden bir tanesini alacağız
//                    let onePlacemark = MKPlacemark(placemark: placemarkA[0])//placemark dizisinden ilk elemanı aldık
//
//                    let item = MKMapItem(placemark: onePlacemark)
//
//                    //item ın ismine kullanıcının eklediği yer ismini ekledik
//                    item.name = self.annotationTitle
//
//                    //haritayı araba ile gidilecek şekilde nav özelliği ile başlatma ayarlanır.
//                    let launchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
//
//                    item.openInMaps(launchOptions: launchOptions)//haritalarda aç yaparız.
//
//                }
//            }
//        }
    
        
    }
    
}



extension HaritaAcil2ViewController:CLLocationManagerDelegate{
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//
//
//        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude) // get locaiton
//
//        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // create span
//
//        let region = MKCoordinateRegion(center: myLocation, span: span) // create region
//
//        haritaAcilMapView.setRegion(region, animated: true) // set region
//
//
//        print("latitude: \(locations[0].coordinate.latitude)")
//        print("longitutde: \(locations[0].coordinate.longitude)")
//
//
//    }

}
