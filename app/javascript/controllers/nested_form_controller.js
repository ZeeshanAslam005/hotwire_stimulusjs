import NestedForm from 'stimulus-rails-nested-form'

export default class extends NestedForm {
  static targets = ["modal", "add_item", "template"]

  connect() {
    super.connect()
  }

  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.modalTarget.remove()
  }
  
  submitEnd(e) {
    if (e.detail.success) {
        this.hideModal()
    } 
  }

}