import bindEvents from './events'

export default function fileInput(selector) {
  const input = document.querySelector(selector)
  bindEvents(input)
}