<template>
  <div>
    <div
      ref="modal"
      class="modal fade"
      :class="{show, 'd-block': active}"
      tabindex="-1"
      role="dialog"
      @click="close"
    >
      <div class="modal-dialog" role="document" >
        <div class="modal-content" ref="content">
          <div class="modal-header">
            <h5 class="modal-title"><slot name="header"></slot></h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
              @click="toggleModal"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <slot></slot>
          </div>
        </div>
      </div>
    </div>
    <div v-if="active" class="modal-backdrop fade show"></div>
  </div>
</template>
<script>
export default {
  props:['showModal'],
  data() {
    return {
      active: false,
      show: false
    };
  },

  created(){
    if (this.showModal) {
      this.toggleModal();
    }
  },
  methods: {
    /**
     * when clicking on button in bootstrap
     * the modal style set to display and after that a show class add to modal
     * so to do that we will show modal-backdrop and set modal display to block
     * then after that we will add show class to the modal and we will use setTimeout
     * to add show class because we want show class to add after the modal-backdrop show and modal display change
     * to make modal animation work
     *
     */
    toggleModal() {
      const body = document.querySelector("body");
      this.active = !this.active;
      this.active
        ? body.classList.add("modal-open")
        : body.classList.remove("modal-open");
      setTimeout(() => (this.show = !this.show), 10);
    },
    close (e) {

      if (this.$refs.content.contains(e.target)) return;
      const body = document.querySelector("body");
      body.classList.remove("modal-open");
      this.active = false;
      this.show = false;
    }
  }
};
</script>

