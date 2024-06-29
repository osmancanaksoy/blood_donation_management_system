//
//  ViewControllerKanDetay.swift
//  Kan App
//
//  Created by Hüdahan Altun on 9.12.2022.
//

import UIKit
import MapKit
import CoreLocation


class ViewControllerKanBagisDetay: UIViewController {
    
    var locationManager = CLLocationManager()//lokasyon verileri almak için kullanacağımız nesne
    
    @IBOutlet weak var bagisNoktaImageView: UIImageView!
    
    @IBOutlet weak var bagisNoktaAdLabel: UILabel!
    
    
    @IBOutlet weak var bagisNoktaMapView:MKMapView!
    
    
    @IBOutlet weak var questionMarkButton: UIBarButtonItem!
    
    var noktaID:Int?
    
    var bagisNoktaNesnesi:BagisNokta = BagisNokta () //veritabanından gelecek verilerin tutulduğu nesne
    
    var annotationTitle:String?//pin başlık
    var annotationSubTitle:String?//pin alt başlık
    var annotationLat:Double?//pin lati
    var annotationLong:Double?//pin longi
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bagisNoktaMapView.delegate = self
        locationManager.delegate = self
        
        bagisNoktaMapView.isScrollEnabled = false
        bagisNoktaMapView.isZoomEnabled = false
       
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //en iyi konumu al
        locationManager.requestWhenInUseAuthorization() // konumu alırken kullanıcıdan izin iste
        locationManager.startUpdatingLocation() // vc yüklenince konum almayı başlat
    
        
        bagisNoktaNesnesi = BagisNoktaDAO().bagisNoktaGetir(id: noktaID!)
        
        bagisNoktaImageView.image = UIImage(named: bagisNoktaNesnesi.getBagisImage())
        bagisNoktaAdLabel.text = bagisNoktaNesnesi.getBagisAd()
        
        pinYarat(bagisNokta: bagisNoktaNesnesi)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        yolTarifiAl()
    }
    
    @IBAction func questionMarkButtonPressed(_ sender: Any) {
        
       yolTarifiAl()
        
    }
    

}

extension ViewControllerKanBagisDetay{
    
    func pinYarat(bagisNokta:BagisNokta){
        
        annotationTitle = bagisNokta.getBagisAd()
        annotationSubTitle = bagisNokta.getBagisIl()
        annotationLat = bagisNokta.getBagisLati()
        annotationLong = bagisNokta.getBagisLongi()
        
        
        let annotation = MKPointAnnotation() //pin yaratıldı
        
        
        annotation.title = annotationTitle//pin in titlenına kullan seçtiği yer ismi atandı
        
        annotation.subtitle = annotationSubTitle//not atandı
        
        //create coordianae a pass param from coredata to class
        
        //coredatadan gelen yer koordinatları ile coordinate değişkeni oluşturuldu
        
        let coordinate = CLLocationCoordinate2D(latitude: annotationLat!, longitude: annotationLong!)
        
        
        annotation.coordinate = coordinate // pinin koordinatına coredatadan gelen coordinat verileri atandı
        
        bagisNoktaMapView.addAnnotation(annotation)// pin map e eklendi
        
        
        locationManager.stopUpdatingLocation()
        
        
        // kullanıcının ekledği yeri görmesi için span ve region oluşturduk
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02) // create span
        
        let region = MKCoordinateRegion(center: coordinate, span: span) // create region
        
        bagisNoktaMapView.setRegion(region, animated: true) //region u map e atadık
    }
    
    
    func yolTarifiAl(){
        
        let alertController = UIAlertController(title: "Yol Tarifi", message: K.yolTarifi, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
}

extension ViewControllerKanBagisDetay:MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? { //map view üzerinde özel pin oluşturmaya yarayan fonksiyon.
        
        if annotation is MKUserLocation{ // eğer gösterilen pin kullanıcının o anki konumu ise
            
            return nil//hiçbirşley yapma
        }
        //eğer değilse o zaman kullanıcı beğendiği yeri görüntülüyor demektir
        
        
        let reuseAnnID = "myAnnotation"//özel pin id ismi
        
        //pinimizi mapview e tanıtıyoruz
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseAnnID)
        
        if pinView == nil{ //eklenen pin dolu ise
            
            
            //pini map e ekliyoruz
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseAnnID)
            
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

extension ViewControllerKanBagisDetay:CLLocationManagerDelegate{
    
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
//        bagisNoktaMapView.setRegion(region, animated: true) // set region
//
//
//        print("latitude: \(locations[0].coordinate.latitude)")
//        print("longitutde: \(locations[0].coordinate.longitude)")
//
//
//    }

}
