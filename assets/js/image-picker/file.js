import axios from 'axios'

const ACCEPTED_FILE_TYPES = ['image/png', 'image/jpeg', 'image/gif']
const IMAGE_PREVIEW_CLASS = 'preview'

export function isValidFile(file) {
  if (ACCEPTED_FILE_TYPES.includes(file.type)) {
    return true
  } else {
    return false
  }
}

export function processFiles(files) {
  return Object.values(files)
    .filter((file) => isValidFile(file))
}

export function fileToDataURL(file) {
  const reader = new FileReader()

  return new Promise((resolve, reject) => {
    reader.onerror = () => {
      reader.abort()
      reject(new DOMException("Problem parsing input file."))
    }

    reader.onload = (event) => {
      resolve(event)
    }

    reader.readAsDataURL(file)
  })
}

export function processFilesForPreview(files) {
  const filePreviews = Promise.all(files.map((file) => fileToDataURL(file)))
  return new Promise((resolve, reject) => {
    filePreviews.then((data) => {
      resolve(data)
    }).catch((error) => {
      reject(error)
    })
  })
}

export function previewFiles(files, element) {
  clearPreviewFiles(element)
  files.map((file) => {
    const image = new Image
    image.src = file.target.result
    image.width = 600
    image.classList.add(IMAGE_PREVIEW_CLASS)
    element.appendChild(image)
  })
}

export function clearPreviewFiles(element) {
  const previewImages = element.querySelectorAll(`.${IMAGE_PREVIEW_CLASS}`)
  Object.values(previewImages).map((image) => element.removeChild(image))
}

function createFormData(files) {
  const form = new FormData()
  files.map((file) => form.append("image", file))
  return form
}

export async function uploadAndConvertFilesToText(files) {
  const formData = createFormData(files)
  const { data } = await axios.post('/api/image', formData)
  return data
}