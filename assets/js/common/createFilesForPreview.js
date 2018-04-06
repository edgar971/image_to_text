function fileToDataURL(file) {
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

export function createFilesForPreview(files) {
  const filePreviews = Promise.all(files.map((file) => fileToDataURL(file)))
  return new Promise((resolve, reject) => {
    filePreviews.then((data) => {
      resolve(data)
    }).catch((error) => {
      reject(error)
    })
  })
}

