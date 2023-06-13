import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


window.initMap = function(...args) {
  const event = new Event("google-maps-callbacks",{"bubbles":true,"cancelable":false})
  window.addEventListener(
    "google-maps-callbacks",
    (e) => {

    },
    false
  );
  window.dispatchEvent(event)
}
