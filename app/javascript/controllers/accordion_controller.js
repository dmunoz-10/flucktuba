import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['content', 'angle']

  connect() {
    this.toggleClassesContent = 'is-hidden'
    this.toggleClassesAngle = ['fa-angle-down', 'fa-angle-up']
  }

  toggle(event) {
    event.preventDefault()

    this.contentTarget.classList.toggle(this.toggleClassesContent)
    this.toggleAngleIcon()
  }

  toggleAngleIcon() {
    this.toggleClassesAngle.forEach((class_name) => {
      this.angleTarget.classList.toggle(class_name)
    })
  }
}
