import state from '../state'
import { validateFiles } from '../common/validateFiles'
import { previewFiles } from '../common/previewFiles'
import { IMAGE_HOLDER_SELECTOR } from '../selectors'
import { uploadAndConvertFilesToText } from '../common/uploadAndConvertFilesToText'

async function onChange(e) {
  e.preventDefault()
  state.setProcessing(true)

  const { files } = this
  const imageHolderElement = document.querySelector(IMAGE_HOLDER_SELECTOR)

  const validFiles = validateFiles(files)
  await previewFiles(validFiles, imageHolderElement)

  try {
    const { text } = await uploadAndConvertFilesToText(validFiles)
    state.setText(text)
  } catch (e) {
    
  }

  state.setProcessing(false)
}

export default function bindEvents(element) {
  element.onchange = onChange
}