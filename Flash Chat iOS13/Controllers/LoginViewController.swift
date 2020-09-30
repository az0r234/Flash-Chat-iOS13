

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let e = error{
                    let alertController = UIAlertController(title: "Error", message:
                        e.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Try again", style: .default))

                    self.present(alertController, animated: true, completion: nil)
                }else{
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}

