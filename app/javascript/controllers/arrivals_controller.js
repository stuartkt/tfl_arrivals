import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "table" ]

    connect() {
        this.startRefreshing()
    }

    startRefreshing() {
        setInterval(() => {
            this.refreshArrivals()
        }, 30000) // Update every 30 seconds
    }

    refreshArrivals() {
        fetch('/', {
            headers: {
                Accept: "text/vnd.turbo-stream.html"
            }
        })
            .then(response => response.text())
            .then(html => Turbo.renderStreamMessage(html))
    }
}