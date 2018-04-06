import axios from 'axios'

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