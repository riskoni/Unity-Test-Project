using UnityEngine; 
using System.Collections; 
using System.Runtime.InteropServices; 
using AOT;  
public class CommunicatorBridge : MonoBehaviour {      


	//DllImport for iOS:
	#if UNITY_IOS     
	[DllImport ("__Internal")]
	private static extern void framework_message (string message);
	#endif   


	//See: https://forum.unity.com/threads/call-a-method-in-an-activity-using-androidjavaobject.219950/
	public static void CallAndroidMethod(string methodName, string str){
		using (AndroidJavaClass javaClass = new AndroidJavaClass("com.riskov.test.MainActivity")){
			using (AndroidJavaObject activity = javaClass.GetStatic<AndroidJavaObject>("ctx")){
				activity.Call(methodName, str);
			}
		}
	}



	//message:
	public static void message(string message) {         
		#if !UNITY_EDITOR

		#if UNITY_IOS
		if (Application.platform == RuntimePlatform.IPhonePlayer) {             
			framework_message(message);         
		}         
		#elif UNITY_ANDROID
		CallAndroidMethod("onUnityMessage", message);
		#endif

		#endif //!UNITY_EDITOR
	} 
}