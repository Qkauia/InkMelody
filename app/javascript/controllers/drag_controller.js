/** @format */

import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";
import { patch } from "@rails/request.js";

// Connects to data-controller="drag"
export default class extends Controller {
  connect() {
    new Sortable(this.element, {
      ghostClass: "drag-ghost",
      onEnd: async (e) => {
        const { id } = e.item.dataset;
        const { newIndex } = e;
        const url = `/api/v1/products/${id}/sort`;
        const data = { newIndex };
        await Path(url, { body: JSON.stringify(data) });
      },
    });
  }
}
