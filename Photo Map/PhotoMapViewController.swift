//
//  PhotoMapViewController.swift
//  Photo Map
//

//

import UIKit
import MapKit

class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  //one degree of latitude is approximately 111 kilometers (69 miles) at all times.
  //@IBOutlet weak var mapView: MKMapView!
  let sfRegion = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.783333, -122.416667),
            MKCoordinateSpanMake(0.1, 0.1))

    override func viewDidLoad() {
        super.viewDidLoad()

      //mapView.setRegion(sfRegion, animated: false)
        // Do any additional setup after loading the view.
      let vc = UIImagePickerController()
      vc.delegate = self
      vc.allowsEditing = true
      vc.sourceType = UIImagePickerControllerSourceType.camera
      self.present(vc, animated: true, completion: nil)
      if UIImagePickerController.isSourceTypeAvailable(.camera){
        print("Camera is available")
        vc.sourceType = .camera
      } else {
        print("Camera not available so we will use photo library instead")
        vc.sourceType = .photoLibrary
      }
    }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    let originalImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
    let editedImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
    // do something with images
    dismiss(animated: true, completion: nil)
  }




    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
