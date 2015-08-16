//
//  CBMapController.swift
//  Girafalles
//
//  Created by Fabio Gois on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import UIKit
import MapKit
import AMTagListView

class CBMapController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate, UICollectionViewDelegate, UIAlertViewDelegate, UICollectionViewDataSource
{
    let locationManager = CLLocationManager()
    
    var teachersLocation = [[-22.962621,-43.207946],[-22.946735
        ,-43.182797]]
    
    var locValue: CLLocationCoordinate2D!
    var tagArray = Array<String>()
    var selectIndexDelete : Int!
    
    /* **************************************************************************************************
    **
    **  MARK: IBOutlets
    **
    ****************************************************************************************************/
    
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var formLabels: UITextField!
    @IBOutlet weak var collectionLabels: UICollectionView!
    
    /* **************************************************************************************************
    **
    **  MARK: LoadNib
    **
    ****************************************************************************************************/
    
    required init(coder: NSCoder)
    {
        super.init(coder: coder)
        NSBundle.mainBundle().loadNibNamed("CBMapView", owner: self, options: nil)
    }
    
    
    /* **************************************************************************************************
    **
    **  MARK: ViewDidLoad
    **
    ****************************************************************************************************/
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        mapView.delegate = self
        collectionLabels.delegate = self
        collectionLabels.dataSource = self
        collectionLabels.registerClass(TagCollectionCell.self, forCellWithReuseIdentifier: "cellIdentifier");
        
        locationManager.requestWhenInUseAuthorization();
        formLabels.delegate = self

        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
        }
        else{
            println("Location service disabled");
        }
        
        mapView.showsUserLocation = true
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagArray.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell : TagCollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("cellIdentifier",
            forIndexPath: indexPath) as! TagCollectionCell;
        
        cell.tagView.setupWithText(tagArray[indexPath.row])
        cell.tagView.frame.size.width =  cell.tagView.frame.size.width*0.7
        return cell;
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectIndexDelete = indexPath.row;
        SDUIUtils.instance.showTwoOptionsAlert("Deletar Interesse", message: "Deseja deletar o interesse " + tagArray[indexPath.row] + "?", delegate: self)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2;
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 20;
    }
    
    /**
    *   Chamado quando o o alert de erro é clicado em OK, para deletar tag
    */
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex == 1){
            tagArray.removeAtIndex(selectIndexDelete)
            collectionLabels.reloadData()
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        tagArray.append(textField.text)
        textField.text = ""
        collectionLabels.reloadData()
        return true
    }
    
    /* **************************************************************************************************
    **
    **  MARK: IBActions
    **
    ****************************************************************************************************/
    
    @IBAction func mapSegmentedControl(sender: AnyObject)
    {
        // Ao alterar, exibir "isOnCall"
    }
    
    
    /* **************************************************************************************************
    **
    **  MARK: Functions
    **
    ****************************************************************************************************/
    
    var coordiantes: (Double, Double)! {
        didSet {
            println("Mudou coordinates")
            TeacherDAO.searchTeachersNearLatitude(locValue.latitude, longitude: locValue.longitude) { teacherList in
                self.teachersLocation = [[Double]]()
                for teacher in teacherList {
                    self.teachersLocation.append([teacher.latitude, teacher.longitude])
                }
                self.addTeachersLocation(teacherList)
            }
        }
    }
    
    func locationManager (manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        locValue = manager.location.coordinate;
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)
        
        coordiantes = (locValue.latitude, locValue.longitude)
    }


    // Adicionar professores ao mapa
    
    func addTeachersLocation (teachers:[Teacher])
    {
        
        println(teachersLocation.count)
        
        for var i = 0; i < teachersLocation.count; i++ {
            
            var lat = teachersLocation[i][0]
            var long = teachersLocation[i][1]
            
            var location = CLLocationCoordinate2D(
                latitude: lat,
                longitude: long
            )
            
            let teacher = teacherAnnotation(title: "\(teachers[i].name) \(teachers[i].surname)",
                teacherRating: "★★★★★",
                id: "blare#@4xa",
                coordinate: location
            )
            
            mapView.addAnnotation(teacher)
            
        }
        
    }


    // Map delegate
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? teacherAnnotation {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
            }
            return view
        }
        return nil
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        let selectedTeacher = view.annotation as! teacherAnnotation
        
        println(selectedTeacher.id)
        
        self.performSegueWithIdentifier("toProfile", sender: self)
        
    }
}
