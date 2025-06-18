import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox", "title", "form"];

  connect() {
    console.log("Todo status controller connected");
  }

  toggle() {
    const formData = new FormData(this.formTarget);

    fetch(this.formTarget.action, {
      method: "PATCH",
      headers: {
        Accept: "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content,
      },
      body: formData,
    })
      .then((response) => response.json())
      .then((data) => {
        if (this.checkboxTarget.checked) {
          this.titleTarget.classList.add("line-through", "text-gray-50");
        } else {
          this.titleTarget.classList.remove("line-through", "text-gray-50");
        }
      })
      .catch((error) => console.error("Error updating todo:", error));
  }
}