// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import consumer from "./channels/consumer"
import CableReady from "cable_ready"
import mrujs from "mrujs"
import { CableCar } from "mrujs/plugins"

mrujs.start({
  plugins: [
    new CableCar(CableReady, { mimeType: "application/vnd.cable-ready.json" })
  ]
})

CableReady.initialize({ consumer })

import "trix"
import "@rails/actiontext"
import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()
