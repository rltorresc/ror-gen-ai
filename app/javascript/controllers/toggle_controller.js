import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["inputField", "toggle"]
  connect() {
    this.updateInputField();
  }

  toggle() {
    this.updateInputField();
  }

  updateInputField() {
    const isChecked = this.toggleTarget.checked;
    this.inputFieldTarget.disable = isChecked;
    if (isChecked) {
      this.inputFieldTarget.value = "-1";
    }
  }
}
