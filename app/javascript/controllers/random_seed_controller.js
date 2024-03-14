import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="random-seed"
export default class extends Controller {
  static targets = ["inputField"]
  populate() {
    const randomNumber = Math.floor(Math.random() * 9999999999)
    console.log(randomNumber)
    this.inputFieldTarget.value = randomNumber
  }
}
