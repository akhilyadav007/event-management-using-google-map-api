import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="locations"
export default class extends Controller {

  static targets = [ 'field','map','latitude','longitude' ]

  connect() {
    console.log(typeof(google));
    if (typeof(google) != "undefined") {
      this.initMap()
    }
    else if (this.fieldTarget != "undefined") {
      location.reload();
    }
  }

  initMap() {
    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget);
    var lat = (this.latitudeTarget.value != "undefined")? this.latitudeTarget.value : 39.5
    var lng = (this.longitudeTarget.value != "undefined")? this.longitudeTarget.value : -98.35
    this.map = new google.maps.Map(this.mapTarget,{
      center: new google.maps.LatLng(lat, lng),
      zoom: 6
    })

    this.autocomplete.bindTo('bounds', this.map)
    this.autocomplete.setFields(['address_components', 'geometry', 'icon', 'name'])
    this.autocomplete.addListener('place_changed', this.placeChanged.bind(this))

    this.marker = new google.maps.Marker({
      position: new google.maps.LatLng(lat,lng),
      map: this.map,
      anchorPoint: new google.maps.Point(0, -29)
    })
  }

  placeChanged() {
    let place = this.autocomplete.getPlace()
    if (!place.geometry) {
      window.alert(`No details available for input: ${place.name}`)
      return
    }

    if (place.geometry.viewport) {
      this.map.fitBounds(place.geometry.viewport)
    } else {
      this.map.setCenter(place.geometry.location)
      this.map.setZoom(17)
    }

    this.marker.setPosition(place.geometry.location)
    this.marker.setVisible(true);

    this.latitudeTarget.value = place.geometry.location.lat()
    this.longitudeTarget.value = place.geometry.location.lng()
    console.log("lat",place.geometry.location.lat());
    console.log("lng",place.geometry.location.lng())
  }
}
