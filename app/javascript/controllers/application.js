import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application
export { application }
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "jquery"
import "bootstrap"
// Remove unnecessary require statements
Rails.start()
Turbolinks.start()
ActiveStorage.start()

