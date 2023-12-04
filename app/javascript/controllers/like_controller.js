/** @format */

import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ["btn"];

  toggle(e) {
    e.preventDefault();

    const { id } = this.element.dataset;
    const url = `/products/${id}/like`;
    const token = document.querySelector("meta[name='csrf-token']").content;

    fetch(url, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": token,
      },
    })
      .then((result) => {
        return result.json();
      })
      .then(({ id, status }) => {
        console.log(id, status);

        if (status == "liked") {
          this.btnTarget.textContent = "取消";
        } else {
          this.btnTarget.textContent = "愛死";
        }
      })
      .catch((err) => {
        console.log(err);
      });
  }
}
