//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Hüseyin BAKAR on 18.12.2021.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    // sign in faceid soruyor. simulatörde mathching face dedik. 2. ekrana attı. success ;)
  
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInClicked(_ sender: Any) {
        
      let authContext = LAContext()
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
                {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "IS it you?") { success, error in
                if success == true
                {
                    DispatchQueue.main.async {
                        print("success")
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                }
                else
                {
                    DispatchQueue.main.async {
                        self.errorLabel.text = "Giriş Yapılamadı"
                    }
                }
                
            }
        }
        
        
       
    }
}

/*
                        ÖNEMLİ
 
 
 
 info .plist e ekledik
 
 Privacy - Face ID Usage Description
 
 String "To Authenticate"
 
 
 2. olarak : Simulatörde denemek için
 Emulatörü Seçip -> Hardware -> FaceID -> Enrolled
 
 Ayrıca ;
-----------------------------------------------------
 simulatörde denemek için
 Yeni XCode'da 12.5 Features -> FaceID -> Enrolled seçili hale getirilmelidir..
 
 
 FaceID-> matching Face seçersek program çalışırken faceid uyuştu diyebiliyoruz..
 
 önemli
 
*** Eğer hata verirse segue de yada label atamasında işlemi main thread'te yapmak gerekiyor..
 
 DispatchQueue.main.async { içene aldık bütün kod bloklarını
 */
