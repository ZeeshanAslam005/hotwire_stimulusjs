import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.disableForm()
    document.addEventListener('click',function(e){
      if(e.target && e.target.id== 'add_employee'){
        this.querySelectorAll("input[type='submit']").forEach(button => {
          button.disabled = true
          button.classList.add("bg-gray-200");
          button.classList.remove("bg-blue-600");
        })
      }
  });
  }

  disableForm() {
    this.submitButtons().forEach(button => {
      button.disabled = true
      button.classList.add("bg-gray-200");
      button.classList.remove("bg-blue-600");
    })
  }

  enableForm() {
    this.submitButtons().forEach(button => {
      button.disabled = false
      button.classList.remove("bg-gray-200");
      button.classList.add("bg-blue-600");
    })
  }

  submitButtons() {
    return this.element.querySelectorAll("input[type='submit']")
  }

  checkForm(event)
  {
      var f = event.target.form.elements;
      var cansubmit = true;

      for (var i = 0; i < f.length; i++) {
          if (f[i].value.length == 0) cansubmit = false;
      }
     
      if (cansubmit) {
          this.enableForm();
      }
      else {
          this.disableForm();
      }
  }

  checkNestedForm(event)
  {
      var f = event.target.form.elements;
      var cansubmit = true;

      for (var i = 0; i < f.length; i++) {
          if (f[i].value.length == 0) { debugger; if (f[i].textContent.trim() != "Add Employee") cansubmit = false;}

      }

      if (cansubmit) {
          this.enableForm();
      }
      else {
          this.disableForm();
      }
  }

  emailValidator(event) {
    var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if (event.target.value.match(validRegex)) {
      document.getElementById("email-msg").innerText = "";
      document.getElementById("phone").disabled = false;
      document.getElementById("phone").classList.remove("bg-gray-200");
      this.checkForm(event)
    } else {
      document.getElementById("email-msg").innerText = "Email is inavlid";
      document.getElementById("phone").disabled = true;
      document.getElementById("phone").classList.add("bg-gray-200");
    }
  }

  phoneValidator(evt) {
    evt.preventDefault

    var value = evt.target.value
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      var val = value.substring(0, value.length - 1);
        evt.target.value = val
    }
    else
      {
        const input = evt.target.value.replace(/\D/g,'').substring(0,10); // First ten digits of input only
        const areaCode = input.substring(0,3);
        const middle = input.substring(3,6);
        const last = input.substring(6,10);

        if(input.length > 6){evt.target.value = `${areaCode}-${middle}-${last}`;}
        else if(input.length > 3){evt.target.value = `${areaCode}-${middle}`;}
        else if(input.length > 0){evt.target.value = `${areaCode}`;}
        this.checkForm(evt)
        
      }
  }

  hideModal() {
    // this.element.parentElement.removeAttribute("src")
    this.modalTarget.remove()
  }
  showEmploymentModal() {
    var button = document.getElementById("new_employment");
    button.click();
  }

  submitEnd(e) {
    if (e.detail.success) {
      if(document.getElementById("add_employee") == null){
        this.hideModal()
        this.showEmploymentModal()
        }else{
          this.hideModal()
        }
        console.log("showing employee modal")
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
