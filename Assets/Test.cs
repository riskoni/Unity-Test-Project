using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Test : MonoBehaviour {

	GameObject box;

	void Start () {
		box = GameObject.Find ("box");
		CommunicatorBridge.message ("Unity started");
	}
	
	void Update () {

		if ((Input.touchCount > 0) && (Input.GetTouch(0).phase == TouchPhase.Began)){

			Ray raycast = Camera.main.ScreenPointToRay(Input.GetTouch(0).position);
			RaycastHit raycastHit;
			if (Physics.Raycast(raycast, out raycastHit))
			{
				CommunicatorBridge.message ("You just hit the " + raycastHit.collider.name);
			}
		}
	}

	void changeBoxPos(string arg){
		float pos = float.Parse (arg);

		Vector3 newPos = box.transform.position;
		newPos.x = pos;
		box.transform.position = newPos;
	}

	void spawnBall(string arg){
		char[] ch = {','};
		string[] components = arg.Split(ch, 3);
		if(components.Length == 3){
			float x = float.Parse (components [0]);
			float y = float.Parse (components [1]);
			y = 1 - y;
			/* x and y represent percentage of the camera's view 0 to 1*/
			/* Now we'll map them from -1 to 1 */
			x = -1 + x*2.0f;
			y = -1 + y*2.0f;

			float z = float.Parse (components [2]);
			Vector3 pos = new Vector3 (x, y, z);
			/* z will not be changed */

			float fieldOfView = Camera.main.fieldOfView; 	/* vertical [deg] */
			float aspectRatio = Camera.main.aspect;
			float height = 2 *  z * Mathf.Tan(fieldOfView); /* height at viewable area at z pos */
			float width = height * aspectRatio;

			pos.x = width*pos.x;
			pos.y = height*pos.y;

			/* Spawn the ball */
			GameObject ballPrefab = GameObject.Find ("ball");
			GameObject ball = Instantiate(ballPrefab, pos, transform.rotation);
			ball.GetComponent<Rigidbody> ().isKinematic = false;
			ball.GetComponent<Rigidbody> ().AddForce (new Vector3 (0, 0, 500));
			GameObject.DestroyObject (ball, 10 /* sec */); 
		}
	}
}
