import NestedForm from 'stimulus-rails-nested-form'

export default class extends NestedForm {
  // static targets = ["modal", "add_item", "template"]

  // connect() {
    
  //   super.connect()
  // }

  // add(){
  //   super.add()
  //   console.log("ssssssssssssssss")
  //   this.disableForm()
  // }

  // disableForm() {
  //   this.submitButtons().forEach(button => {
  //     button.disabled = true
  //     button.classList.add("bg-gray-200");
  //   })
  // }

  // submitButtons() {
  //   return this.element.querySelectorAll("input[type='submit']")
  // }

  // hideModal() {
  //   this.element.parentElement.removeAttribute("src")
  //   this.modalTarget.remove()
  // }
  
  // submitEnd(e) {
  //   debugger
  //   if (e.detail.success) {
  //       this.hideModal()
  //   } 
  // }

}