import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["password", "checkbox"]

  connect() {
    this.checkboxTarget.checked = false;
  }

  toggle() {
    if (this.passwordTarget.type == "password") {
      this.passwordTargets.forEach(passwordTarget => {
        passwordTarget.type = "text"
      });
    } else {
      this.passwordTargets.forEach(passwordTarget => {
        passwordTarget.type = "password"
      });
    }
  }
}
