import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "display", "startDate", "endDate" ]

  connect() {
    flatpickr(this.displayTarget, {
      mode: "range",
      minDate: "today",
      dateFormat: "Y-m-d",
      onClose: (selectedDates, dateStr, instance) => {
        if (selectedDates.length === 2) {
          this.startDateTarget.value = instance.formatDate(selectedDates[0], "Y-m-d")
          this.endDateTarget.value = instance.formatDate(selectedDates[1], "Y-m-d")
        }
      }
    })
  }
}