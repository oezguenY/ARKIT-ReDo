//
//  ViewController.swift
//  ARKIT FromScratch
//
//  Created by Özgün Yildiz on 13.04.21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

@IBOutlet weak var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // the ViewController is the delegate of the sceneView
        sceneView.delegate = self
        sceneView.debugOptions = [.showFeaturePoints]
        
        // we are providing a path to our ship in our art_scnassets
        // normally, this is being force unwrapped, which is actually safe because we can see our scnassets folder and our ship scene. Nevertheless, getting used to force unwrapping is dangerous and its better to be safe than sorry :D
        if let scene = SCNScene(named: "art.scnassets/ship.scn") {
            sceneView.scene = scene
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }


}

