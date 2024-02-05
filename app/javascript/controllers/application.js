import { Application } from "@hotwired/stimulus"
import { VirtualizedController } from "hotwire-virtualized";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

Stimulus.register("virtualized", VirtualizedController);

export { application }
