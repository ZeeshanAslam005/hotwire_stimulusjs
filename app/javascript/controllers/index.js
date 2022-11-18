// Import and register all your controllers from the importmap under controllers/*

// import { application } from "controllers/application"

// // Eager load all controllers defined in the import map under controllers/**/*_controller
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// eagerLoadControllersFrom("controllers", application)

import { Application } from '@hotwired/stimulus'
import NestedForm from 'stimulus-rails-nested-form'

const application = Application.start()
application.register('nested-form', NestedForm)

import TurboModalController from "./turbo_modal_controller"
application.register("turbo-modal", TurboModalController)
