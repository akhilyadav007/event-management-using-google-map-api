import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="events"
export default class extends Controller {
  static targets = ["direction","lat","lng"]
  connect() {
    if (typeof(google) != "undefined") {
      this.initDirection()
    } else if ((this.latTarget.value != 'undefined') && (this.lngTarget.value != 'undefined')) {
      location.reload()
    }
  }

  initDirection() {
    this.direction = new google.maps.Map(this.directionTarget,{
      center: new google.maps.LatLng(this.latTarget.value, this.lngTarget.value),
      zoom: 6
    })
    
    this.marker = new google.maps.Marker({
      position: new google.maps.LatLng(this.latTarget.value, this.lngTarget.value),
      map: this.direction,
      anchorPoint: new google.maps.Point(0, -29)
    })
  }
}
