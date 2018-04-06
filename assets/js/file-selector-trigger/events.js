import { FILE_INPUT_SELECTOR } from '../selectors'

function onClick(e) {
  const inputField = document.querySelector(FILE_INPUT_SELECTOR)
  inputField.click()
}

export default function bindEvents(element) {
  element.onclick = onClick
}