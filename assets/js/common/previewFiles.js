import { validateFiles } from './validateFiles'
import { createFilesForPreview } from './createFilesForPreview'

const IMAGE_PREVIEW_CLASS = 'preview-image'
const DROP_AREA_HAS_IMAGE_CLASS = 'has-preview-image'

export async function previewFiles(files, displayElement) {
  const filesToPreview = await createFilesForPreview(files)
  addPreviewFiles(filesToPreview, displayElement)
}

export function addPreviewFiles(files, element) {
  clearPreviewFiles(element)
  files.map((file) => {
    const image = new Image
    image.src = file.target.result
    image.width = 600
    image.classList.add(IMAGE_PREVIEW_CLASS)
    element.appendChild(image)
  })
  element.classList.add(DROP_AREA_HAS_IMAGE_CLASS)
}

export function clearPreviewFiles(element) {
  const previewImages = element.querySelectorAll(`.${IMAGE_PREVIEW_CLASS}`)
  Object.values(previewImages).map((image) => element.removeChild(image))
}