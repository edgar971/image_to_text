// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import state from './state'
import picker from './image-picker'
import fileSelectorTrigger from './file-selector-trigger'
import fileInput from "./file-input";
import { FILE_INPUT_SELECTOR } from "./selectors";

const textElementSub = () => {
  const { text } = state.getState()
  const textElement = document.querySelector('textarea.text')
  textElement.innerHTML = text
}

const processingSub = () => {
  const body = document.querySelector('body')
  const { processing } = state.getState()
  if (processing) {
    body.classList.add('processing')
  } else {
    body.classList.remove('processing')
  }
}

const render = () => {
  fileInput(FILE_INPUT_SELECTOR)
  picker('.image-holder')
  fileSelectorTrigger('.file-selector')
  state.subscribe(textElementSub)
  state.subscribe(processingSub)
}

render()

