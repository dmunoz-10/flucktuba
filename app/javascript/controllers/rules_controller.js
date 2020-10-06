import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['edit', 'delete']

  connect() {
    this.urlEdit = this.data.get('urlEdit')
    this.urlDelete = this.data.get('urlDelete')
  }

  edit() {
    Rails.ajax({
      url: `${this.urlEdit}`,
      type: 'get'
    })
  }

  delete() {
    if (confirm('Are you sure?')) {
      Rails.ajax({
        url: `${this.urlDelete}`,
        type: 'delete'
      })
    }
  }
}
