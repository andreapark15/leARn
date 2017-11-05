//
//  ViewControllerOverlay.swift
//  leARn
//
//  Created by Andrea Park on 2017-11-04.
//  Copyright © 2017 Andrea Park. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import Macaw

class ViewControllerOverlay: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    var word : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        //sceneView.scene = scene
        
        //print(word!)
        // send word to API
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        self.sceneView.debugOptions = []
        // Tell the session to automatically detect horizontal planes
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // Place content only for anchors found by plane detection.
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        // Create a SceneKit plane to visualize the plane anchor using its position and extent.
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        
        let charImage = UIImage(named: word!)
        let charMaterial = SCNMaterial()
        charMaterial.diffuse.contents = charImage
        charMaterial.isDoubleSided = true

        plane.materials = [charMaterial]
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.simdPosition = float3(planeAnchor.center.x, 0, planeAnchor.center.z)
        planeNode.scale = SCNVector3(x: 0.09, y: 0.08, z: 1)
//        planeNode = .scale(sx: 0.33, sy: 0.35)
        /*
         `SCNPlane` is vertically oriented in its local coordinate space, so
         rotate the plane to match the horizontal orientation of `ARPlaneAnchor`.
         */
        planeNode.eulerAngles.x = -.pi / 2
        
        // Make the plane visualization semitransparent to clearly show real-world placement.
        planeNode.opacity = 0.6
        
        /*
         Add the plane visualization to the ARKit-managed node so that it tracks
         changes in the plane anchor as plane estimation continues.
         */
        node.addChildNode(planeNode)
    }
    
//    func createPlaneNode(anchor: ARPlaneAnchor) -> SCNNode {
//        // Create a SceneKit plane to visualize the node using its position and extent.
//
//        // Create the geometry and its materials
//        let plane = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
//
//        let charImage = UIImage(named: "a")
//        let charMaterial = SCNMaterial()
//        charMaterial.diffuse.contents = charImage
//        charMaterial.isDoubleSided = true
//
//        plane.materials = [charMaterial]
//
//        // Create a node with the plane geometry we created
//        let planeNode = SCNNode(geometry: plane)
//        planeNode.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
//
//        // SCNPlanes are vertically oriented in their local coordinate space.
//        // Rotate it to match the horizontal orientation of the ARPlaneAnchor.
//        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
//
//        /*
//         `SCNPlane` is vertically oriented in its local coordinate space, so
//         rotate the plane to match the horizontal orientation of `ARPlaneAnchor`.
//         */
//        planeNode.eulerAngles.x = -.pi / 2
//
//        // Make the plane visualization semitransparent to clearly show real-world placement.
//        planeNode.opacity = 0.25
//
//        /*
//         Add the plane visualization to the ARKit-managed node so that it tracks
//         changes in the plane anchor as plane estimation continues.
//         */
////        node.addChildNode(planeNode)
//
//        return planeNode
//    }
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }

}
