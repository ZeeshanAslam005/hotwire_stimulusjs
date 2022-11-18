import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  static targets = ["modal"]

  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.modalTarget.remove()
  }
  showEmploymentModal() {
    var button = document.getElementById("new_employment");
    button.click();
  }

  submitEnd(e) {
    console.log("saving")
    if (e.detail.success) {
      if (document.getElementById('save_employment') == null) {
        this.hideModal()
        this.showEmploymentModal()
      } else {
        this.hideModal()
      }
    }
  }

  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.hideModal()
    }
  }

  closeBackground(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return;
    }
    this.hideModal()
  }
}
